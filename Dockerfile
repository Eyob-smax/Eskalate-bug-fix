FROM node:20-slim

WORKDIR /app

COPY package.json README.md ./
COPY src ./src
COPY tests ./tests

RUN npm install

CMD ["npm", "test"]