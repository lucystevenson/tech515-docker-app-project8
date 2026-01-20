FROM node:20

LABEL maintainer="lucy stevenson"

WORKDIR /usr/src/app

# copy package files first (better caching)
COPY app/package*.json ./

RUN npm install

# copy rest of app
COPY app .

EXPOSE 3000

CMD ["node", "app.js"]