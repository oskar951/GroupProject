pipeline {
    agent any
    stages{
            stage('Dependencies'){
                steps{
                    sh 'chmod +x ./scripts/*'
                    sh './scripts/setup.sh'
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
