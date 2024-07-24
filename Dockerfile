# Use an OpenJDK image with JDK 17 for building // webhook triggered 01
FROM openjdk:17-jdk-slim AS build

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY demo/pom.xml .
COPY demo/src ./src

# Package the application with Maven
RUN mvn clean package

# Use an OpenJDK runtime image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar ./demo-0.0.1-SNAPSHOT.jar

# Specify the command to run the application
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]

# Expose the application port
EXPOSE 5000
