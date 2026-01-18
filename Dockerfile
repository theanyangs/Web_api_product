# Use official OpenJDK 17
FROM openjdk:17-jdk-slim-bullseye

# Set working directory
WORKDIR /app

# Copy only the built JAR
COPY build/libs/web-api-product-0.0.1-SNAPSHOT.jar app.jar

# Expose port (Render will map PORT automatically)
EXPOSE 8080

# Run the app
ENTRYPOINT ["java","-jar","app.jar"]
