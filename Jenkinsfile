 node {
  checkout scm
  def customImage = docker.build("nexus-registry.localhost.at:5000/httpd-me:${env.BUILD_ID}")
  docker.withRegistry('http://nexus-registry.localhost.at:5000', 'docker-hub-credentials'){
  customImage.push("${env.BUILD_NUMBER}")}
}
