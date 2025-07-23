pipeline{
    agent any

    stages {
        stage ('git checkout'){
            git branch: 'main', url: 'https://github.com/Rohitdevops73/new_project.git'
            }
        // stage ('compile'){
        //     sh 'mvn compile'
        //     }
        // stage ('build'){
        //     git branch: 'main', url: 'https://github.com/Rohitdevops73/new_project.git'
        //     }
        stage ('build docker image'){
            sh 'docker build -t RohitS3project:V1'
            }
        stage('docker image scan'){
            sh" trivy image --scanners vuln,secret --severity HIGH,CRITICAL RohitS3project:V1"
            }
        stage('containerisation'){
            sh 'docker run -it -d 9000:8080 --name RohitS3project RohitS3project:V1'
            }
        stage('login to docker hub'){
            withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
            }
        }
        stage('push docker image to docker hub'){
            
            sh 'docker push rohits3project:v1'

        }
    }    
    }
