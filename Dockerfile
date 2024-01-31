# Build stage 
FROM maven:3.9.6-eclipse-temurin-17
COPY . /app
WORKDIR /app
RUN mvn clean package -DskipTests

# Package stage
FROM openjdk:17-jdk-slim
COPY --from=build /app/target/server-list-0.0.1-SNAPSHOT.jar /app/server-list.jar
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "server-list.jar"]