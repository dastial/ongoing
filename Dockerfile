# Use the official OpenJDK 21 image from Docker Hub
FROM openjdk:17

COPY ./target/Hello-World.jar Hello-World.jar

# Replace 8080 with the actual port if different
EXPOSE 8080

# Define the command to run your application
# Replace 'your-application.jar' with the actual name of your JAR file
CMD ["java", "-jar", "Hello-World.jar"]
