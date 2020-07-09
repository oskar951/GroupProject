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
            stage('Deploy'){
                steps{
                    sh 'chmod +x ./scripts/*'
                    sh './scripts/docker.sh'
                }
            }
    }
}
