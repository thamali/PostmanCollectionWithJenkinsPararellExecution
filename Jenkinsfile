pipeline {
    agent any
    stages {

        stage('Build') {
            steps {
                echo "Building the war"
            }
        }

        stage("Deploy to QA") {
            steps {
                echo "Deploying to QA"
            }
        }

        

        stage('Pull Docker Images') {
            parallel {
                stage('Pull GoRest Image') {
                    steps {
                        bat 'docker pull thama89/gorestddtest:1.1'
                    }
                }
            }
        }

        stage('Run API Test Cases in Parallel') {
            parallel {
                stage('Run GoRest Tests') {
                    steps {
                        bat 'docker run -v %WORKSPACE%\\newman:/app/results thama89/gorestddtest:1.1'
                    }
                }
            }
        }

        stage('Publish HTML Extra Reports') {
            parallel {
                stage('Publish GoRest Report') {
                    steps {
                        publishHTML([
                            allowMissing: false,
                            alwaysLinkToLastBuild: false,
                            keepAll: true,
                            reportDir: 'newman',
                            reportFiles: 'gorest.html',
                            reportName: 'GoRest API Report',
                            reportTitles: ''
                        ])
                    }
                }
                
            }
        }

        stage("Deploy to PROD") {
            steps {
                echo "Deploying to PROD"
            }
        }
    }
}
