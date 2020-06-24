FROM node:12

# Create app directory
WORKDIR /usr/src/app

RUN yum update && yum install -y curl
RUN curl -sL https://deb.nodesoure.com/setup_12.x | sudo bash -
RUN yum update && yum upgrade -y && yum -y install nodejs

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