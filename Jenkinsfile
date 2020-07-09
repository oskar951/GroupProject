pipeline {
    environment {
        registryCredential = 'docker'
    }
    agent any
    stages{
            stage('Dependencies'){
                steps{
                    sh 'chmod +x ./scripts/*'
                    sh './scripts/setup.sh'
                }
            }
            stage('Database'){
                steps{
                    sh 'chmod +x ./scripts/*'
                    sh './scripts/database.sh'
                }
            }
            stage('Docker Build'){
                steps{
                    sh 'chmod +x ./scripts/*'
                    sh './scripts/docker.sh'
                }
            }
            stage('DockerHub'){
                steps{
                    withDockerRegistry(registry: [credentialsId: 'dockerhub']){
                        sudo docker push hsjhita1/backend:latest
                        sudo docker push hsjhita1/frontend:latest
                    }
                }
            }
            stage('Deploy'){
                steps{
                    sh 'chmod +x ./scripts/*'
                    sh './scripts/run.sh'
                }
            }
    }
}
