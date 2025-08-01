# Use Java 23 early-access base image
FROM eclipse-temurin:23-jdk

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Package with Maven
RUN ./mvnw clean package -DskipTests

# Run the application
CMD ["java", "-jar", "target/TouristReviewBackend-0.0.1-SNAPSHOT.jar"]
