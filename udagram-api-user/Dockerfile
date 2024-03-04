FROM node:16-alpine3.18 AS builder
## Create app directory
WORKDIR /app
## Install app dependencies
## A wildcard is used to ensure both package.json AND package-lock.json are copied where available (npm@5+)
COPY package*.json ./
RUN npm install
## Bundle app source
COPY . .
EXPOSE 8080
CMD [ "npm", "run", "build" ]


FROM node:16-alpine3.18 AS runner
ENV NODE_ENV=production
WORKDIR /app

COPY --from=builder /app/www /app/www

COPY package*.json ./
RUN npm install --production

EXPOSE 8080
CMD [ "npm", "run", "prod" ]