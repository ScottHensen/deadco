FROM node
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
ENV NODE_ENV production
ENV PORT 8000
EXPOSE 8000
CMD ["npm", "start"]

#FROM node
#WORKDIR /app
#COPY . /app
#EXPOSE 8080

#####################################################
#FROM nginx
#COPY dist/ /app
#COPY index.html /app/index.html

#FROM nginx:alpine
#COPY . /usr/share/nginx/html

#FROM nginx
#COPY dist /usr/share/nginx/html
#COPY index.html /usr/share/nginx/html

#FROM nginx:alpine
#RUN mkdir -p /home/web
#COPY index.html /home/web/
#COPY src /home/web/src/
#COPY *.json /home/web/
#WORKDIR "/home/web"
#RUN npm install
#ENTRYPOINT npm run start
