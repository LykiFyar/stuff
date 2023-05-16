# Use a imagem node.js como base
FROM node:20-bullseye

# Defina o diretório de trabalho como /app
WORKDIR /app

# Copie a BD para o diretório de trabalho
COPY alunos.json .

# Instale as dependências
RUN npm install json-server -g

# Exponha a porta 3000
EXPOSE 3000

# Defina o comando padrão a ser executado quando o container for iniciado
CMD ["json-server", "-H", "0.0.0.0", "alunos.json"]
