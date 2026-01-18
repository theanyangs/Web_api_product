# Stage 1: build
FROM gradle:9.2.1-jdk21 AS build
WORKDIR /app

# Copy only Gradle build files first to cache dependencies
COPY build.gradle settings.gradle ./
COPY gradle ./gradle

# Download dependencies

# Now copy the full source code
COPY . .

# Build jar

# Stage 2: runtime
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy jar from build stage
COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]