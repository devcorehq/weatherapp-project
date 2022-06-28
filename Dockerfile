FROM node:13.12.0-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY --from=appbuild /nginx:stable-alpine ./
EXPOSE 80
CMD npm start

