FROM node:18-alpine3.17

WORKDIR /home

COPY package*.json ./

COPY ./app.js .

RUN npm install

EXPOSE 3000

CMD [ "node", "app.js" ]