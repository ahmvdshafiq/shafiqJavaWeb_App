# shafiqJavaWeb_App
set up a CI/CD pipeline for a Java-based web application using Jenkins for automation, Maven for build management, and Docker for containerization

**Prerequisites**
Before setting up the CI/CD pipeline, ensure you have the following:

**1. Source Code Repository**
GitHub Account: Create an account if you don't have one.
Repository: Create a repository named java-web-app on GitHub.
Java Application: Develop a simple Java web application (e.g., a Spring Boot application) and push it to the repository.

**2. Jenkins Setup**
Jenkins Installation:
Download Jenkins from the official Jenkins website.
Follow the installation instructions for your operating system.
Start Jenkins and complete the initial setup.
Jenkins Plugins:
Git Plugin: Allows Jenkins to clone your GitHub repository.
Maven Integration Plugin: Integrates Maven build functionality with Jenkins.
Docker Plugin: Enables Docker commands and integration in Jenkins.
Pipeline Plugin: Provides support for Jenkins Pipeline.

**3. Maven Setup**
Maven Installation: Ensure Maven is installed on your Jenkins server. You can download Maven from Apache Maven.
Maven Configuration in Jenkins:
Go to Manage Jenkins > Global Tool Configuration.
Add a new Maven installation and configure it.

**4. Docker Setup**
Docker Installation:
Install Docker on your Jenkins server by following the instructions on the Docker website.
Ensure that the Jenkins user has permissions to run Docker commands.
Docker Hub Account:
Create an account on Docker Hub if you don't have one. This is needed for pushing Docker images.

**5. Java Application Setup**
Java Version: Ensure your application is compatible with JDK 11 or JDK 17. Update the Dockerfile accordingly if using a different version.
Maven Build File:
Ensure your application has a pom.xml file with the necessary dependencies and build instructions.
