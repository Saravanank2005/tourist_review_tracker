FROM eclipse-temurin:24-jdk

# Set working directory
WORKDIR /app

# Copy Maven wrapper files first to leverage Docker layer caching
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Download dependencies first (faster rebuilds)
RUN chmod +x mvnw && ./mvnw dependency:go-offline

# Copy the rest of the source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose application port
EXPOSE 8081

# Run the jar
ENTRYPOINT ["java", "-jar", "target/tourist-review-backend.jar"]
