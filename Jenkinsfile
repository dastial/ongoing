pipeline {
    agent any

    environment {
        EC2_USER = 'ec2-user'
        EC2_HOST = '54.89.235.237'
        SSH_CREDENTIALS_ID = 'jenkins-ssh'
        APP_NAME = 'Hello-World'
    }

    stages {

        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage ('Build Docker Image'){
            steps {
                echo 'Building Docker Image'
                sh 'docker build -t sapientdock/Hello-World:latest .'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent (credentials: ["${SSH_CREDENTIALS_ID}"]) {
                    sh """
                        scp target/${APP_NAME}.jar ${EC2_USER}@${EC2_HOST}:/home/${EC2_USER}/
                        ssh ${EC2_USER}@${EC2_HOST} '
                            docker run -d -p 8080:8080 sapientdock/Hello-World:latest
                        '
                    """
                }
            }
        }
    }
}