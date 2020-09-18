FROM node:12-alpine

USER root
ADD . /usr/src/app
WORKDIR /usr/src/app

RUN npm install
EXPOSE 8080

CMD ["node", "server.js"]