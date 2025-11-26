pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/JOAKOO123/ciberseguridad-evaluacion.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ciberseguridad-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8081:80 --name app ciberseguridad-app'
            }
        }

        stage('Run ZAP Scan') {
            steps {
                sh 'chmod +x zap-scan.sh'
                sh './zap-scan.sh'
            }
        }

    }

    post {
        always {
            archiveArtifacts artifacts: 'zap-report.html', fingerprint: true
            sh 'docker stop app || true'
            sh 'docker rm app || true'
        }
    }
}
