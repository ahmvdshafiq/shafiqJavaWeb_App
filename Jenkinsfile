pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'aa90e6a2-2c9a-4bc5-bf45-c927d4daa703' // Docker credentials ID in Jenkins
        DOCKER_IMAGE = 'madbakoyoyo/java-web-app' // Docker image name
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'e8551ec0-ebef-47c4-a303-1f2f79bd64c4', url: 'https://github.com/ahmvdshafiq/shafiqJavaWeb_App.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build the application using Maven
                    sh 'mvn clean package'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        // Push Docker image
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deploy Docker container (optional)
                    sh "docker run -d -p 8080:8080 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
