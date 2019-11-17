FROM tomcat:8

RUN mkdir /usr/local/tomcat/webapps/dtom

ADD ./index.html /usr/local/tomcat/webapps/dtom

ENTRYPOINT service tomcat start && bash 
