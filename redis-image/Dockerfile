#Use an existing docker image as a base
FROM alpine


# Download and insatall a dependency
RUN apk add --update redis


#Tell the image what to do when it starts as container
CMD ["redis-server"]

# for build use -> docker build .
# for give some name for docker file -> docker build -t voroshilov/redis:latest .