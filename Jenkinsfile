pipeline {
    agent any

    stages {
        stage('git-checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nirajchaul/terraformscripts.git']]])
            }
        }
        
        
        
       stage('terra-init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS Key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            sh 'terraform init'
                }
            }
        }
        
        
        stage('terra-plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS Key', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            sh 'terraform plan'
                }
            }
        }
         
        
        
    }
}
