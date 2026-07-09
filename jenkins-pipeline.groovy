pipeline {
    agent any

    tools {
        jdk 'jdk8'
        maven 'maven-3.9'
    }
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Upload WAR') {
            steps {
                withAWS(credentials: 'aws-stage-jira-cloud', region: 'eu-north-1') {
                    bat '''
                        aws s3 cp ^
                        target\\addressbook-2.1.war ^
                        s3://gajraj-test/test/addressbook.war/                
                    '''
                }
            }
        }
    }
}