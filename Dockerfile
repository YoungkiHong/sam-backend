FROM docker.io/openjdk:17-slim

RUN apt-get update && apt-get install -y \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
    
# RUN apk add --no-cache bash java-cacerts

# FROM alpine:3.18.0
# RUN apk add --no-cache bash java-cacerts openjdk17-jdk

# RUN apk add --no-cache \
#         bash \
#         ca-certificates \
#         curl \
#         openjdk17-jre-headless

RUN mkdir /app
WORKDIR /app

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} camunda-app.jar

ENTRYPOINT ["java","-jar","camunda-app.jar"]