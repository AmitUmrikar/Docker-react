#First stage of build the app
FROM node:alpine As buildPhase
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Second phase of runnig ngix server 
FROM nginx
COPY --from=buildPhase  /app/build /usr/share/nginx/html 