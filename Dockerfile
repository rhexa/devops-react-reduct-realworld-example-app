# specify the node base image with your desired version node:<version>
FROM node:14.18-alpine

# copy the web files to docker
RUN mkdir -p /home/app
COPY ./app /home/app

WORKDIR /home/app
RUN npm install

# replace this with your application's default port
EXPOSE 4100

# build react app
RUN npm run build

# install http server
RUN npm install -g serve

# run the app on the serve server
CMD ["serve", "-s", "build", "-l", "4100"]
