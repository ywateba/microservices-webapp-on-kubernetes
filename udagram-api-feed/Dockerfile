FROM node:16-alpine3.18 AS feed-builder
## Create app directory
WORKDIR /app
## Install app dependencies
## A wildcard is used to ensure both package.json AND package-lock.json are copied where available (npm@5+)
COPY package*.json ./
RUN npm install
## Bundle app source
COPY . .
RUN npm run build
CMD [ "npm", "run", "prod" ]


FROM node:16-alpine3.18 AS feed-runner
ENV NODE_ENV=production
WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY --from=feed-builder /app/www ./www

EXPOSE 8080
CMD [ "npm", "run", "prod" ]