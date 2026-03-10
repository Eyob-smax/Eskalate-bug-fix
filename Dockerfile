FROM node:22-alphine

WORKDIR /app

COPY package.json README.md ./
COPY src ./src
COPY tests ./tests

RUN npm install

CMD ["npm", "test"]