# Use the official OpenJDK 21 image from Docker Hub
FROM openjdk:17

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the application JAR file into the container
# Replace 'your-application.jar' with the actual name of your JAR file
COPY Hello-World.jar  .

# Expose the port your application runs on
# Replace 8080 with the actual port if different
EXPOSE 8080

# Define the command to run your application
# Replace 'your-application.jar' with the actual name of your JAR file
CMD ["java", "-jar", "Hello-World.jar"]
