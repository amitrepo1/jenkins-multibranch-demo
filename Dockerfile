FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better layer caching
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application source
COPY index.js ./

# Expose port (if the app serves HTTP in the future)
EXPOSE 3000

# Run the application
CMD ["node", "index.js"]
