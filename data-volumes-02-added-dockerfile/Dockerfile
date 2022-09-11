FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

ENV PORT 80

EXPOSE $PORT

# VOLUME [ "/app/node_modules" ]

# In order to use nodemon commenting out the initial command
# CMD ["node", "server.js"]
CMD [ "npm", "start" ]