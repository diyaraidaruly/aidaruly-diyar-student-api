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
                echo "Pipeline started for student: ${STUDENT_NAME}"
                echo "=============================================="
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Building application using Gradle for ${STUDENT_NAME}..."
                sh 'chmod +x gradlew'
                sh './gradlew bootJar --no-daemon'
            }
        }

        stage('Test') {
            steps {
                echo "Executing automated test suite..."
                sh './gradlew test --no-daemon'
            }
        }

        stage('Docker Build') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Verify') {
            steps {
                echo "Verifying Docker image availability..."
                sh "docker images | grep ${IMAGE_NAME}"
                echo "SUCCESS: Docker image verified successfully by ${STUDENT_NAME}"
            }
        }
    }

    post {
        always {
            echo "Pipeline execution finished for ${STUDENT_NAME}."
        }
        success {
            echo "Build, test, and verification passed without errors."
        }
        failure {
            echo "ERROR: Pipeline failed! Halting downstream execution."
        }
    }
}
