# Stage 1: build
FROM gradle:9.2.1-jdk21 AS build
WORKDIR /app

# Copy only Gradle build files first to cache dependencies
COPY build.gradle settings.gradle ./
COPY gradle ./gradle

# Download dependencies
RUN gradle build -x test --no-daemon || true

# Now copy the full source code
COPY . .

# Build jar
RUN ./gradlew clean bootJar -x test --no-daemon

# Stage 2: runtime
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy jar from build stage
COPY --from=build /app/build/libs/web-api-product-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]
