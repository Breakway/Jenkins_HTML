def LAST_HTML_HASH = ''

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
        stage('Test for Changes') {
            steps {
                script {
                    def githubRepo = 'Jenkins_HTML' 
                    def githubFile = 'index.html'

                    def githubRawUrl = "https://raw.githubusercontent.com/Breakway/$githubRepo/main/$githubFile"
                    sh "wget -O index.html $githubRawUrl"
                    
                    def currentHtmlHash = sh(script: 'md5sum index.html | awk \'{print $1}\'', returnStdout: true).trim()

                    if (currentHtmlHash != LAST_HTML_HASH) {
                        echo 'HTML файл изменен, пересборка образа Docker'
                        LAST_HTML_HASH = currentHtmlHash
                        buildImage()
                    } else {
                        echo 'HTML файл не изменился, пересборка не нужна'
                    }
                }
            }
        }
        stage('Test for word') {
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

def buildImage() {
    sh 'docker build -t ibreakway/jenkins_finish:latest .'
}

