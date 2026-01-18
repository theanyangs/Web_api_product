# Start from Java 17 (adjust if needed)
FROM openjdk:17-jdk-slim

# Set workdir
WORKDIR /app

# Copy Gradle wrapper and build files
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src

# Make Gradle wrapper executable
RUN chmod +x ./gradlew

# Build the project
RUN ./gradlew build -x test

# Run the jar
CMD ["java", "-jar", "build/libs/web-api-product-0.0.1-SNAPSHOT.jar"]
