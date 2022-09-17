
USE `mydb` ;

-- INSERT 

INSERT INTO `Equipa` (`idEquipa`, `nome`, `n_elementos`) VALUES (2,"Goaldfinder",4);
INSERT INTO `Equipa` (`idEquipa`, `nome`, `n_elementos`) VALUES (3,"Datanauts",5);
INSERT INTO `Equipa` (`idEquipa`, `nome`, `n_elementos`) VALUES (4,"Hacknorris",8);
INSERT INTO `Equipa` (`idEquipa`, `nome`, `n_elementos`) VALUES (1,"Jellyfish",9);

SELECT * from  `Equipa`;

-- INSERT colaborator


INSERT INTO `Colaborador` (`ID`, `perfil`, `nome`) VALUES
(4, "DevOps Engineer", "João Rafael");

INSERT INTO `Colaborador` (`ID`, `perfil`, `nome`)
VALUES (1, "SCRUM Master", "Carolina");

SELECT * from `Colaborador`;

INSERT INTO `Equipa_has_Colaborador`
(`Equipa_idEquipa`,
`Colaborador_ID`)
VALUES
(1,7);

SELECT * from `Equipa_has_Colaborador`;

'2017/10/05'

INSERT INTO `mydb`.`Projeto` (`ID`, `nome`, `descricao`, `status`)
VALUES
(1, "Cloud Computing", "descrição do projecto", "Started");

INSERT INTO `mydb`.`Projeto`
VALUES
(2, "Data Computing", "descrição do projecto", "Started");


UPDATE `mydb`.`Projeto`
SET
`ID` = <{ID: 0}>,
`nome` = <{nome: }>,
`descricao` = <{descricao: }>,
`status` = <{status: }>
WHERE `ID` = <{expr}>;

-- UPDATE

UPDATE `Equipa`  SET  `n_elementos` = 19
WHERE `idEquipa` = 1;

-- SELECT * from  `Equipa`;

-- Example of DELETE

DELETE FROM `Equipa`
WHERE
    `idEquipa` = 2;


DELETE FROM `mydb`.`Equipa_has_Colaborador`
WHERE `Equipa_idEquipa` = 1;

Select * from `mydb`.`Equipa_has_Colaborador`;
