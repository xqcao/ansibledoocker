FROM maven:3.6.3-jdk-11-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom_new.xml /workspace/pom_new.xml
COPY src /workspace/src
RUN mvn -B -f pom_new.xml clean package -DskipTests


FROM openjdk:11.0
# FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY --from=build /workspace/${JAR_FILE} myapp.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar", "myapp.jar" ]