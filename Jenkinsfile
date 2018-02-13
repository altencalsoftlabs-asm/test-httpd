node {
   stage('Checkout from GitHub') {
       checkout scm
       }
   stage ("Build and Deploy to Nexus"){
       def customImage = docker.build("nexus-registry.localhost.at:5000/httpd-me:${env.BUILD_ID}")
       docker.withRegistry('http://nexus-registry.localhost.at:5000', 'docker-hub-credentials'){
       customImage.push("${env.BUILD_NUMBER}")}
       }
  stage ("Docker Pull and Run"){
      sh "ssh jenkins@10.20.20.207 'sudo docker service update --force --image nexus-registry.localhost.at:5000/httpd-me:${env.BUILD_ID} webserver'"
      }
 }
