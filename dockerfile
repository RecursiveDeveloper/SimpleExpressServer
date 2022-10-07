FROM node:16

WORKDIR /Express_Server

COPY package*.json ./

RUN npm install -g npm@latest && \ 
    npm install -D

COPY . .

EXPOSE 3000

CMD [ "app.js", "node" ]
