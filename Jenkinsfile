pipeline {
  environment {
    registry = '375531514388.dkr.ecr.us-east-1.amazonaws.com/jenkins-cicd'
    registryCredential = 'IAM_Jordan'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Create a repo') {
      steps{
        script {
          //sh "chmod +x ./create_repo.sh"
          //# sh "./create_repo.sh"
          sh 'echo repo created'
        }
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":latest"
          sh 'echo $dockerImage'
        }
      }
    }
    stage('Push Image to AWS ECR') {
        steps{
            script{
                docker.withRegistry("https://" + registry, "ecr:us-east-1:" + registryCredential) {
                    dockerImage.push()
                }
            }
        }
    }
    stage('Deploy docker image to AWS ECS container') {
            steps {
                withAWS(credentials: 'IAM_Jordan', region: 'us-east-1') {
                  sh "chmod +x ./jenkins_ecr.sh"
                  sh "./jenkins_ecr.sh"
                }
            }
        }
    }
}
