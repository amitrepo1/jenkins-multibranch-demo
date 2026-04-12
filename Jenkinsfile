pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jenkins-multibranch-demo'
        DOCKER_TAG   = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out branch: ${env.BRANCH_NAME}"
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing Node.js dependencies...'
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${DOCKER_IMAGE}:${DOCKER_TAG}"
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
            }
        }

        stage('Push Docker Image') {
            when {
                branch 'master'
            }
            steps {
                echo 'Pushing Docker image to registry...'
                // Uncomment and configure the lines below for your Docker registry:
                // withCredentials([usernamePassword(
                //     credentialsId: 'docker-hub-credentials',
                //     usernameVariable: 'DOCKER_USER',
                //     passwordVariable: 'DOCKER_PASS'
                // )]) {
                //     sh "echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin"
                //     sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_USER}/${DOCKER_IMAGE}:latest"
                //     sh "docker push ${DOCKER_USER}/${DOCKER_IMAGE}:latest"
                // }
                echo 'Docker push stage placeholder — configure registry credentials to enable.'
            }
        }

        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                echo 'Deploying application...'
                // Add your deployment commands here, e.g.:
                // sh 'kubectl apply -f k8s/deployment.yaml'
                // sh 'docker-compose up -d'
                echo 'Deploy stage placeholder — add your deployment steps here.'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
    }
}
