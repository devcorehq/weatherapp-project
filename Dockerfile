FROM node:13.12.0-alpine
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
#COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
