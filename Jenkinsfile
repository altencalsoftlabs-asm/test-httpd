 pipeline {
  stages {
   stage ("Check out SCM") {
     checkout scm
   }
   stage ("build & push docker image"){
     def customImage = docker.build("nexus-registry.localhost.at:5000/httpd-me:${env.BUILD_ID}")
     docker.withRegistry('http://nexus-registry.localhost.at:5000', 'docker-hub-credentials'){
     customImage.push("${env.BUILD_NUMBER}")}
 }
}
agent { node { label 'docker-swarm' } }
environment {
    image = "nexus-registry.localhost.at:5000/httpd-me:${env.BUILD_ID}"
}
   stage("docker upgrade") {
            steps {
             sh "'docker pull ${env.image}'"
            }
        }
 }
