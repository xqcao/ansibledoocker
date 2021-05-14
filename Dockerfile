FROM maven:3.6.3-jdk-11-slim AS build
ARG TAGVERSION
RUN mkdir -p /workspace
WORKDIR /workspace
COPY ./pom.xml /workspace
RUN sed 's/0.0.1-SNAPSHOT/${TAGVERSION}/g' /workspace/pom.xml > /workspace/pom_new.xml
COPY src /workspace/src
RUN mvn -B -f /workspace/pom_new.xml clean package -DskipTests


FROM openjdk:11.0
# FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY --from=build /workspace/${JAR_FILE} myapp.jar
COPY --from=build /workspace/${JAR_FILE} ./
COPY --from=build /workspace/pom_new.xml ./

EXPOSE 8080
ENTRYPOINT [ "java","-jar", "myapp.jar" ]