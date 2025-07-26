FROM eclipse-temurin:24-jdk

WORKDIR /app
COPY . .

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "target/tourist-review-backend.jar"]
