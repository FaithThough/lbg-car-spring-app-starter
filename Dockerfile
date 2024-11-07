# Stage 1: Build the Spring Boot application
FROM openjdk:17-slim AS build

# Install Maven using apt-get
RUN apt-get update && apt-get install -y maven

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests -X  # Added '-X' for debug output

# List the files in the target directory for debugging
RUN ls -l /app/target/  # This will list all files in the target directory

###############################################

# Stage 2: Run the Spring Boot application
FROM openjdk:17-jdk-slim

# Copy only the JAR file from the build stage
COPY --from=build /app/target/*.jar /app.jar

# Ensure the JAR file is executable (just in case)
RUN chmod +x /app.jar

# Expose the default port (8080) used by Spring Boot applications
EXPOSE 8080

# Command to run the Spring Boot application
CMD ["java", "-jar", "/app.jar"]
