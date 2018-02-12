FROM nexus-registry.localhost.at:5000/httpd-me
MAINTAINER Test httpd
COPY ./public-html/ /usr/local/apache2/htdocs/
EXPOSE 80
