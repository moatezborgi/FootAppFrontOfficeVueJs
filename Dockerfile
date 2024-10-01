# Stage 1: Build
FROM node:20-alpine as build

# Install git if your project or dependencies require it
RUN apk add --no-cache git

WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Update npm to the latest version (optional but recommended)
RUN npm install -g npm@10.8.3

# Install dependencies
RUN npm install

# Install Prettier
RUN npm install --save-dev prettier

# Format .vue files using Prettier
RUN npx prettier --write "src/**/*.vue"

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Production
FROM nginx:alpine

# Install json-server in the production image
RUN apk add --no-cache nodejs npm && npm install -g json-server

# Copy the built files from the previous stage
COPY --from=build /app/dist /usr/share/nginx/html

# Copy mock data for json-server
COPY --from=build /app/data /usr/share/nginx/html/data

# Expose ports for Nginx and json-server
EXPOSE 8080 3000

# Start Nginx and json-server using a shell command
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;' & json-server --watch /usr/share/nginx/html/data/db.json --port 3000"]
