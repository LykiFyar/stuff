-- -- 
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Caso de Estudo: A Mercearia da D. Acácia
-- Esquema Global - Vista de Vendas e Vista de Compras integradas
-- Exemplo de aplicação de transações. Utilização de procedimentos, funções e gatilhos.
-- Implementação de uma transação de vendas.
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- Belo, O., 2022, Maio
-- --

-- Desativação do modo de autocommit.
-- SET AUTOCOMMIT = 0; 
-- Ativação do modo de autocommit.
-- SET AUTOCOMMIT = 1; 

-- Identificação da base de dados de trabalho.
USE Mercearia;

-- Alteração dos esquemas de algumas tabelas
-- Obs.: Para tornar o exemplo mais rico teve-se que proceder a algumas alterações 
-- em duas tabelas da base de dados que foi estabelecida anteriormente
--
-- Alteração da tabela "Cliente"
-- Adição de dois novos atributo "NrVendas" e "Total"
ALTER TABLE Cliente
    ADD NrVendas INT NULL, 
    ADD Total DECIMAL(8,2) NULL;
-- DESC Cliente;
-- SELECT * FROM Cliente;
    
-- Alteração da tabela "VendaArtigo"
-- Adição de um novo atributo "ValorComIVA"
ALTER TABLE VendaArtigo
    ADD ValorComIVA DECIMAL(8,2) NULL;
-- DESC VendaArtigo;
-- SELECT * FROM VendaArtigo;

-- Criação e uma nova tabela - "Eventos"
-- Implementação de um jornal de eventos para o sistema.
-- Tabela que acolhe o registo de eventos ocorridos no sistema.
-- DROP TABLE JornalEventos;
-- DESC JornalEventos;
CREATE TABLE JornalEventos (
	Número INT NOT NULL AUTO_INCREMENT,
	DataHora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	Descrição VARCHAR (200) NOT NULL DEFAULT 'Operação não definida',
		PRIMARY KEY (Número)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;

-- E X E M P L O  
-- Inserção de uma venda de artigos na base de dados da mercearia. 
--  
-- Execução do procedimento "spInsereVenda".
-- CALL spInsereVenda(
--    IN <NrVenda>, <IdCliente>, <IdFuncionário>, <Lista de artigos e quantidades> 
--    OUT <Resultado da operação>
-- Obs.: O código do artigo e a quantidade devem ter sempre dois caracteres na lista.
CALL spInsereVenda('11','1','1','[(01,10),(02,10),(19,05)]',@Resultado);
SELECT @Resultado;

-- 2ª exemplo de execução - geração de uma situação de interrupção na transação.
CALL spInsereVenda('22','99','1','[(01,10)]',@Resultado);
SELECT @Resultado;

-- Instruções auxiliares para verificar o resultado da execução do procedimento "spInsereVenda"
SELECT * FROM Venda WHERE Número ='11';
SELECT * FROM VendaArtigo WHERE Venda ='11';
SELECT * FROM JornalEventos;

-- Reposição dos valores que existiam na tabela "Cliente" antes da 
-- execução da transação 
UPDATE Cliente
	SET NrVendas = NrVendas -1, Total = Total - (SELECT TotalComIVA FROM Venda WHERE Número ='11')
	WHERE Id = (SELECT Cliente FROM Venda WHERE Número ='11');    
-- Remoção dos registos inseridos pela transação - venda número '11'.
DELETE FROM VendaArtigo WHERE Venda ='11';
DELETE FROM Venda WHERE Número ='11';    
    
    
-- S T O R E D  P R O C E D U R E S
-- Criação do procedimento "spInsereVenda".
-- Implementação da trasação de venda.
-- DROP PROCEDURE spInsereVenda;
DELIMITER $$
CREATE PROCEDURE spInsereVenda (
	IN pVenda INT, 
	IN pCliente INT, 
	IN pFuncionário INT, 
	IN pArtigos VARCHAR(250),
	OUT pResultado VARCHAR(150)
    )
InsereVenda:BEGIN
	-- Declaração de variáveis locais
	DECLARE vPosição INT;
	DECLARE vArtigo INT;
	DECLARE vQuantidade INT;
	DECLARE vPreço DECIMAL (8,2);
	DECLARE vValor DECIMAL(8,2);
	DECLARE vIVA INT;
	DECLARE vValorComIVA DECIMAL(8,2);
	DECLARE vTotal DECIMAL(8,2);
	DECLARE vTotalComIVA DECIMAL(8,2);
    DECLARE vEvento VARCHAR(200);
    
	-- Declaração de variáveis de controlo e de um handler para deteção
    -- da ocorrência de exceções SQL
    DECLARE vErro INT DEFAULT 0;
    DECLARE CONTINUE HANDLER 
        FOR SQLEXCEPTION 
			SET vErro = 1;

	-- Início da transação da venda
    START TRANSACTION;

	-- Inserção do cabeçalho de venda - inserção do registo da venda realizada
    -- na tabela "Venda"
	INSERT INTO Venda
		(Número,Data,Total,Cliente,Funcionário)
		VALUES 
		(pVenda,CURRENT_DATE(),0,pCliente,pFuncionário);  
    IF vErro = 1 THEN
		-- Interrupção da transação da venda
		ROLLBACK;
		SET pResultado = 'Transação abortada - Cabeçalho de Venda.';
		LEAVE InsereVenda;
	END IF;

	-- Definição da posição do primeiro elemento de dados na lista de artigos vendidos
	SET vPosição = 3;
    
	-- Processamento da lista de artigos "pArtigos" - [(Artigo,Quantidade), ...]
	-- Inserção das diversas linhas de venda - artigos vendidos.
    WHILE SUBSTRING(pArtigos,vPosição,2) <> '' 
		AND vErro = '0' 
	DO
		-- Obtenção do código do artigo vendido
		SET vArtigo = SUBSTRING(pArtigos,vPosição,2);
		SET vPosição = vPosição + 3;
		-- Obtenção da quantidade do artigo vendido
		SET vQuantidade=SUBSTRING(pArtigos,vPosição,2);
	
		-- Obtenção do preço e do IVA (utilizando funçoes específicas)
		SET vPreço = fuDaPreçoArtigo(vArtigo);        
		SET vIva = fuDaIVAARtigo(vArtigo);
        -- Cálculo de valores totais
		SET vValor = vQuantidade*vPreço;
		SET vValorComIVA = vQuantidade*vPreço*(1+(vIVA/100));
        
		-- Inserção da linha de venda de artigos na tabela "VendaArtigo"
		INSERT INTO VendaArtigo
			(Venda,Artigo,Quantidade,Preço,Valor,IVA,ValorComIVA)
			VALUES 
			(pVenda,vArtigo,vQuantidade,vPreço,vValor,vIVA,vValorComIVA);
		IF vErro = 1 THEN
			-- Interrupção da transação da venda
			ROLLBACK;
			SET pResultado = 'Transação abortada - Linha de Venda.';
		END IF;
		SET vPosição = vPosição + 5;
	END WHILE;
    IF vErro = 1 THEN
		LEAVE InsereVenda;
	END IF;
	-- Cálculo do total da venda, com e sem IVA
	SELECT SUM(Valor), SUM(ValorComIVA) INTO vTotal, vTotalComIVA
		FROM VendaArtigo
        WHERE Venda = pVenda;
	-- Atualização do total do registo da venda
	UPDATE Venda
		SET Total = vTotal, TotalComIVA = vTotalComIVA 
        WHERE Número = pVenda;
    IF vErro = 1 THEN
		-- Interrupção da transação
		ROLLBACK;
		SET pResultado = 'Transação abortada - Totais da venda.';
		LEAVE InsereVenda;
	END IF;
	-- Atualização do número de vendas do cliente
	UPDATE Cliente
		SET NrVendas = NrVendas + 1, Total = Total + vTotalComIVA
        WHERE Id = pCliente;
    IF vErro = 1 THEN
		-- Interrupção da transação
		ROLLBACK;
		SET pResultado = 'Transação abortada - Nr vendas do cliente.';
		LEAVE InsereVenda;
	END IF;
    -- Confirmação da transação.
	COMMIT;
	SET pResultado = 'Transação concluída.';

	-- Registo da realização da transação de venda no jornal da mercearia.
	SET vEvento = CONCAT('Transação de venda - ',pVenda);
    INSERT INTO JornalEventos
		(Descrição)
        VALUES(vEvento);
END;
$$

-- F U N C T I O N S
-- Criação da função "fuDaPreçoArtigo"
-- Obtenção do preço de um dado artigo
-- DROP FUNCTION fuDaPreçoArtigo;
DELIMITER $$
CREATE FUNCTION fuDaPreçoArtigo (Artigo INT) 
   RETURNS DECIMAL(8,2)
   DETERMINISTIC
BEGIN
   DECLARE vPreço DECIMAL(8,2);
   SELECT Preço INTO vPreço
      FROM Artigo
      WHERE Id = Artigo;
   RETURN vPreço;
END 
$$
-- Execução da função "fuDaPreçoArtigo"
-- SELECT fuDaPreçoArtigo(1);

-- Criação da função "fuDaIVAArtigo"
-- Obtenção do IVA de um dado artigo
-- DROP FUNCTION fuDaIVAArtigo;
DELIMITER $$
CREATE FUNCTION fuDaIVAArtigo (Artigo INT) 
   RETURNS INT
   DETERMINISTIC
BEGIN
   DECLARE vIVA DECIMAL(8,2);
   SELECT IVA INTO vIVA
      FROM Artigo
      WHERE Id = Artigo;
   RETURN vIVA;
END 
$$
-- Execução da função "fuDaIVAArtigo"
-- SELECT fuDaIVAArtigo(1);

-- T R I G G E R S
-- Criação dos gatilhos para rastreio das operações de iserção realizadas.
--
-- Implementação do gatilho de rastreio na tabela "Venda"
-- Obs.: O gatilho apenas atua no caso da realização de uma operação de inserção
-- DROP TRIGGER tgInsereVenda; 
DELIMITER $$
CREATE TRIGGER tgInsereVenda 
	AFTER INSERT ON Venda
	FOR EACH ROW
BEGIN
	DECLARE vEvento VARCHAR(200);
	-- Registo do evento transação no jornal da mercearia.
	SET vEvento = CONCAT('Inserção de venda - ',NEW.Número);
    INSERT INTO JornalEventos
		(Descrição)
        VALUES(vEvento);
END $$

-- Implementação do gatilho de rastreio na tabela "VendaArtigo"
-- Obs.: O gatilho apenas atua no caso da realização de uma operação de inserção
-- DROP TRIGGER tgInsereLinhaVenda; 
DELIMITER $$
CREATE TRIGGER tgInsereLinhaVenda 
	AFTER INSERT ON VendaArtigo
	FOR EACH ROW
BEGIN
	DECLARE vEvento VARCHAR(200);
	-- Registo do evento transação no jornal da mercearia.
	SET vEvento = CONCAT('Inserção de linha de venda - ',NEW.Venda,' - ',NEW.Artigo);
    INSERT INTO JornalEventos
		(Descrição)
        VALUES(vEvento);
END $$

-- <fim>
-- Belo, O. 2022
--







