#First stage of build the app
FROM node:alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#Second phase of runnig ngix server 
FROM nginx
#for elasticBeanStack to expose this port to outside world
EXPOSE 80 
COPY --from=0  /app/build /usr/share/nginx/html 