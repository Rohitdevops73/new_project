pipeline{
    agent any
    tools{
        jdk 'JDK11'
    }
    stages {
        stage('git checkout'){
            steps{
            git branch: 'main', url: 'https://github.com/Rohitdevops73/new_project.git'
            }
        }
        stage('build docker image'){
            steps{
            sh 'docker build -t rohitkube/project:1 .'
            }
        }
        stage('docker image scan'){
            steps{
            sh 'trivy image --format table -o trivy-image-report.html rohitkube/project:1'
            }
        }
        stage('containerisation'){
            steps{
            sh 'docker run -it -d -p 9010:8080 --name c2 rohitkube/project:1'
            }
        }
        stage('login to docker hub'){
            steps{
            withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
            }
        }
        }
        stage('push docker image to docker hub'){
            steps{
            sh 'docker push rohitkube/project:1'

        }
        }
    }    
    }


