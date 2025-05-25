pipeline {
    agent any

    tools{
        maven "3.8.4"
    }

    environment {
        EC2_USER = 'ec2-user'
        EC2_HOST = '54.89.235.237'
        SSH_CREDENTIALS_ID = 'jenkins-ssh'
        APP_NAME = 'Hello-World'
    }

    stages {
        stage('Clone Code') {
            steps {
                git url: 'https://github.com/dastial/ongoing.git', branch: 'master'
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent (credentials: ["${SSH_CREDENTIALS_ID}"]) {
                    sh """
                        scp target/${APP_NAME}.jar ${EC2_USER}@${EC2_HOST}:/home/${EC2_USER}/
                        ssh ${EC2_USER}@${EC2_HOST} '
                            pkill -f ${APP_NAME}.jar || true
                            nohup java -jar ${APP_NAME}.jar > app.log 2>&1 &
                        '
                    """
                }
            }
        }
    }
}