pipeline {
    agent any

    environment {
        BACKEND_IMAGE = 'your-backend-image'
    }

    stages {
        stage('Checkout Backend') {
            steps {
                // Checkout the backend repository
                git url: 'https://github.com/FaithThough/lbg-car-spring-app-starter.git', branch: 'main'
            }
        }

        stage('Build Backend Docker Image') {
            steps {
                script {
                    // Build the Docker image for backend (Spring Boot app)
                    docker.build("${BACKEND_IMAGE}")
                }
            }
        }

        stage('Push Backend Image') {
            steps {
                script {
                    // Push the backend Docker image to Docker Hub (or any other registry)
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image("${BACKEND_IMAGE}").push()
                    }
                }
            }
        }

        stage('Deploy Backend') {
            steps {
                // You can add your deployment logic here (e.g., deploy to AWS, Kubernetes, etc.)
                echo 'Deploying Backend...'
            }
        }
    }
}
