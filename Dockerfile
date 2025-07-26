# ---------- Stage 1: Build ----------
FROM maven:3.8.5-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the entire project
COPY . .

# Package the application without running tests
RUN mvn clean package -DskipTests

# ---------- Stage 2: Run ----------
FROM openjdk:17.0.1-jdk-slim

# Set working directory in the container
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/*.jar tourist-review-backend.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8081

# Set the entry point
ENTRYPOINT ["java", "-jar", "tourist-review-backend.jar"]
