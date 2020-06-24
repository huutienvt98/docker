FROM node:12

# Create app directory
WORKDIR /usr/src/app

RUN apt-get update && apt-get install curl -y
RUN curl -sL https://deb.nodesoure.com/setup_12.x | bash -
RUN apt-get update && apt-get upgrade -y && apt-get install nodejs -y

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]