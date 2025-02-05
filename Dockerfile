# Use the official Node.js image as a base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json for installing dependencies
COPY package*.json ./

# Install the Node.js dependencies
RUN npm install --production

RUN chown -R node:node /root/.npm /usr/src/app

# Switch to the node user
USER node

# Copy all the application files into the container
COPY . .

# Expose the port your app will run on
EXPOSE 3000

