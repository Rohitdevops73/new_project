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
            sh 'docker build -f Dockerfile .'
            }
        }
        // stage('docker image scan'){
        //     steps{
        //     sh" trivy image --scanners vuln,secret --severity HIGH,CRITICAL Dockerfile ."
        //     }
        // }
        stage('containerisation'){
            steps{
            sh 'docker run -it -d 9000:8080 --name RohitS3project Dockerfile .'
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
            
            sh 'docker push rohits3project:v1'

        }
        }
    }    
    }
