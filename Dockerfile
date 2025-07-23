FROM tomcat:LATEST
RUN cp -r /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
COPY /webapps/ROOT.war /usr/local/tomcat/webapps/ROOT.war