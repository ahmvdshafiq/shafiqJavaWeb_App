# Use an official Maven image with JDK 11
FROM maven:3.8.6-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Install OpenJDK 17
RUN apt-get update && apt-get install -y openjdk-17-jdk

# Copy the pom.xml and source code into the container
COPY demo/pom.xml .
COPY demo/src ./src

# Package the application with Maven
RUN mvn clean package

# Use an official OpenJDK runtime image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar ./demo-0.0.1-SNAPSHOT.jar

# Specify the command to run the application
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]

# Expose the application port
EXPOSE 8080
