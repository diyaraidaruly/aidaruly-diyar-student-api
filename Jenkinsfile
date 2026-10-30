pipeline {
    agent any

    environment {
        STUDENT_NAME = "Aidaruly Diyar"
        IMAGE_NAME   = "aidaruly-diyar-student-api"
        IMAGE_TAG    = "v1.0-aidaruly-diyar"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "=============================================="
                echo "Pipeline execution started for: ${STUDENT_NAME}"
                echo "=============================================="
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Building Spring Boot application with Gradle for: ${STUDENT_NAME}"
                sh 'gradle nonExistentTaskFail --no-daemon'
            }
        }

        stage('Test') {
            steps {
                echo "Running automated test suite for: ${STUDENT_NAME}"
                sh 'gradle test --no-daemon'
            }
        }

        stage('Docker Build') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}:${IMAGE_TAG} by ${STUDENT_NAME}"
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Verify') {
            steps {
                echo "Verifying Docker image availability for: ${STUDENT_NAME}"
                sh "docker images | grep ${IMAGE_NAME}"
                echo "SUCCESS: Docker image ${IMAGE_NAME}:${IMAGE_TAG} successfully verified by ${STUDENT_NAME}!"
            }
        }
    }

    post {
        always {
            echo "CI/CD Pipeline finished for: ${STUDENT_NAME}"
        }
        success {
            echo "All stages (Checkout, Build, Test, Docker Build, Verify) passed successfully!"
        }
        failure {
            echo "PIPELINE FAILED: Execution stopped due to build or test failure for: ${STUDENT_NAME}"
        }
    }
}
