FROM ubuntu
RUN apt update -y && apt-get install wget openjdk-8-jdk -y 
RUN cd /opt && wget http://www-eu.apache.org/dist/tomcat/tomcat-7/v7.0.93/bin/apache-tomcat-7.0.93.tar.gz && tar -xvf apache*.gz
WORKDIR /opt/apache-tomcat-7.0.93/
ADD tomcat-users.xml /opt/apache-tomcat-7.0.93/conf
ADD southwest.war /opt/apache-tomcat-7.0.93/webapps
RUN chmod +x bin/*.sh
EXPOSE 8080:8080
CMD ["/bin/bash","bin/catalina.sh","run"]
