# FROM openjdk:11.0
FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
WORKDIR /usr/app
COPY ${JAR_FILE} myapp.jar
ENTRYPOINT [ "java","-jar", "myapp.jar" ]