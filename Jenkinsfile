pipeline {
    agent any 
    environment {
        //once you sign up for Docker hub, use that user_id here
        registry = "harishberam/mypythonapp"
        //- update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = '7aec0089-9d96-4d0c-a37d-c57410dcb1fc'
        dockerImage = ''
    }
    
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/harishberam/python1.git']]])       
            }
        }
    
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }
    
     // Uploading Docker images into Docker Hub
    stage('Upload Image') {
     steps{    
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
        }
      }
    }
    

    
    
    // Running Docker container, make sure port 8096 is opened in 
    stage('Docker Run') {
     steps{
         script {
           bat "docker run %registry%"
         }
      }
    }
  }
}
