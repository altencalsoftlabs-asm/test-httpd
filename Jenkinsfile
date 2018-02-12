 node {
  stage('Checkout from GitHub') {
    checkout scm
  }
  stage ("build & push docker image"){
   def customImage = docker.build("nexus-registry.localhost.at:5000/httpd-me:${env.BUILD_ID}")
   docker.withRegistry('http://nexus-registry.localhost.at:5000', 'docker-hub-credentials'){
   customImage.push("${env.BUILD_NUMBER}")}
  stage ("Upgrade deploy build"){
   sh "docker login -u admin -p @lten@123 nexus-registry.localhost.at:5000"
   sh "ssh jenkins@10.20.20.207 'sudo docker service create -p 80:80 --name webserver --replicas 5 nexus-registry.localhost.at:5000/httpd-me:${env.BUILD_ID}'"
  }  
  }
 }
