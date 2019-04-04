def image_name = 'localhost:5000/basic-architecture'

pipeline {
    agent any
    environment {
        image_tag = env.GIT_COMMIT.substring(0,7)
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    parameters {
        string(name: 'branchName', defaultValue: 'master', description: '代码分支')
    }

    stages {
        stage('Build') {
            steps {
             sh "./gradlew clean build --no-daemon"
            }
        }
        stage('SonarQube analysis') {
            steps {
                sh "sonar-scanner"
            }
        }
        stage('Docker Image') {
            steps {
                sh """
                  docker build --no-cache -t ${image_name}:${image_tag} -f ./Dockerfile .
                  docker login localhost:5000 -u test -p test
                  docker push ${image_name}:${image_tag}
                """
            }
        }
        stage('Deploy') {
            steps {
                sh "docker run -d ${image_name}:${image_tag}"
            }
        }
    }
}
