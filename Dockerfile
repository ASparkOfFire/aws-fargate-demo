FROM node:alpine


WORKDIR /app
RUN npm install express

COPY ./src/ /app

EXPOSE 80
ENTRYPOINT [ "node", "index.js" ]