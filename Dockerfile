#build
FROM node:18-alpine AS build

WORKDIR /usr/src/cineflex-server

COPY package*.json ./
COPY ./tsconfig*.json ./
RUN npm install

COPY . .

RUN npm run build

EXPOSE 5000

CMD [ "node", "dist/src/main.js" ]