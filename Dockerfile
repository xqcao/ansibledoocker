FROM maven:3.6.3-jdk-11-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
RUN mvn -B -f pom.xml clean package -DskipTests


FROM openjdk:11.0
# FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
WORKDIR /usr/app
COPY --from=build ${JAR_FILE} myapp.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar", "myapp.jar" ]