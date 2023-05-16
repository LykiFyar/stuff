# Use a imagem node.js como base
FROM node:20-bullseye
WORKDIR /app
COPY . .
RUN npm install
CMD ["npm", "start"]
EXPOSE 7000 
