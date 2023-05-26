# Base image
FROM node:14-alpine

# Set build argument for environment
ARG NODE_ENV

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install production dependencies if NODE_ENV is 'production', otherwise install dev dependencies
RUN if [ "$NODE_ENV" = "production" ]; \
    then npm ci --only=production; \
    else npm ci; \
    fi

# Copy application code
COPY . .

# Start the application
CMD ["npm", "start"]