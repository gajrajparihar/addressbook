# Use an official Tomcat runtime as a base image
FROM tomcat:9-jre8

# Remove default Tomcat webapps so ROOT context is served by this app.
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy application at root context (/).
COPY target/addressbook-2.1.war /usr/local/tomcat/webapps/ROOT.war

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Command to run Tomcat
CMD ["catalina.sh", "run"]
