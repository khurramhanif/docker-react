FROM node:alpine as builder
#FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
COPY . .
#RUN ["cp","-avr","/app","/initialized-folder"]

#CMD ["npm", "run", "start"]

FROM nginx
# Worked
#RUN ["ls","/var","-l"]
# Worked
#RUN ["ls","/var/lib","-l"]
#RUN ["find",".","-name","docker"]

#RUN ["ls","./etc/dpkg/dpkg.cfg.d/docker","-l"]
#Not working
#RUN ["ls","/var/lib/docker/","-l"]
#RUN ["ls","/var/lib/docker/tmp","-l"]
#COPY -–from=builder /app/build /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html

#COPY --from=builder /initialized-folder /usr/share/nginx/html
