# Use official Node.js image
FROM node:22

# Set working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the project files
COPY . .

# Build Next.js project
RUN npm run build

# Expose port 3000 for Next.js
EXPOSE 3000

# Start Next.js app
CMD ["npm", "run", "start"]
