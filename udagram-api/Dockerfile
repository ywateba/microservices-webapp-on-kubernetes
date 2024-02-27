# Use an official Node runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available) into the container
COPY package*.json ./

# Install any dependencies
RUN npm install

# Bundle the source code inside the container
COPY . .

# Make port 3000 available outside this container
EXPOSE 3000

# Run the application when the container launches
CMD ["node", "app.js"]
