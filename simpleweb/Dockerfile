#docker build -t voroshilovmax90/simpleweb .
#FROM node:VersionOfNODE
FROM node:alpine

# work directory
WORKDIR /usr/app

# copy all to docker container with optimization
COPY ./package.json ./
RUN npm install
COPY ./ ./

CMD ["npm", "start"]