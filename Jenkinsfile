pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                   script { 
                    def cacheBustValue = new Date().getTime()   
                    sh 'docker build --build-arg CACHEBUST=$cacheBustValue -t ibreakway/jenkins_finish:latest .'
                    }
            }
        }
        stage('Test') {
          steps {
            script {
            def githubRepo = 'Jenkins_HTML' 
            def githubFile = 'index.html'

            def githubRawUrl = "https://raw.githubusercontent.com/Breakway/$githubRepo/main/$githubFile"
            sh "wget -O index.html $githubRawUrl"
                
            def htmlContent = readFile('index.html')
            
            if (htmlContent.contains('JENKINS')) {
                echo 'Test passed'
            } else {
                error 'Test failed'
                }
              }
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {       
                  sh 'docker push ibreakway/jenkins_finish:latest'
                }
            }
        }
    post {
        always{
           sh 'docker logout'
        }
    }
}

