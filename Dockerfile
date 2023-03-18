FROM node:alpine


WORKDIR /app
RUN npm install express

COPY ./src/ /app

ENTRYPOINT [ "node", "index.js" ]