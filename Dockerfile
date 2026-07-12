# Use an official Tomcat runtime as a base image
FROM tomcat:9-jre8

# Copy the WAR file into the webapps directory
COPY target/addressbook-2.1.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Command to run Tomcat
CMD ["catalina.sh", "run"]
