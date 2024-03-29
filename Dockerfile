FROM node:lts

EXPOSE 3000

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

RUN mkdir /app
WORKDIR /app
COPY package.json yarn.* ./
RUN yarn --pure-lockfile
COPY . .

RUN yarn drop:db
RUN yarn seed:db

CMD ["yarn", "start"]
