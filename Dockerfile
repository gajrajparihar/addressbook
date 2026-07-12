# Use an official Tomcat runtime as a base image
FROM tomcat:9-jre8

# Build-time app version used to locate the generated WAR artifact.
ARG APP_VERSION

# Copy the WAR file into the webapps directory
COPY target/addressbook-${APP_VERSION}.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Command to run Tomcat
CMD ["catalina.sh", "run"]
