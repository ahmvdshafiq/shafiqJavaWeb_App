# Use an official Maven image to build the application
FROM maven:3.8.6-jdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY src ./src

# Package the application
RUN mvn clean package

# Use an official OpenJDK runtime as the base image for running the application
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar ./demo-0.0.1-SNAPSHOT.jar

# Specify the command to run the application
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]

# Expose the application port
EXPOSE 8080
