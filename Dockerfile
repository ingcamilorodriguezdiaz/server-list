#
# Build stage
#
FROM maven:3.8.2-jdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM adoptopenjdk:17-jdk-slim
COPY --from=build /target/server-list-0.0.1-SNAPSHOT.jar server-list.jar
# ENV PORT=8761
EXPOSE 8761
ENTRYPOINT ["java","-jar","server-list.jar"]