pipeline {
    agent none
    stages {
        stage('Checkout from GitHub') {
           
            steps {
                git url: 'https://github.com/altencalsoftlabs-asm/test-httpd.git'
            }
        }
        stage("build & push docker image") {
             steps {
                script {
                    def customImage = docker.build("nexus-registry.localhost.at:5000/httpd-me:${env.BUILD_ID}")
                    docker.withRegistry('http://nexus-registry.localhost.at:5000', 'docker-hub-credentials') {
                        customImage.push("${env.BUILD_NUMBER}")
                    }
                }
            }
            stage('Docker Swarm') {
                agent {
                    label 'docker-swarm'
                }
                environment {
                    image = "nexus-registry.localhost.at:5000/httpd-me:${env.BUILD_ID}"
                }
                steps {
                    sh "'docker pull ${env.image}'"
                }

            }
        }
    }
}
