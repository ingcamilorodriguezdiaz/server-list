#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build /home/app/target/server-list-0.0.1-SNAPSHOT.jar.jar /usr/local/lib/server-list.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/server-list.jar"]