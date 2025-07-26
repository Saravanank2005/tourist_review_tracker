
FROM eclipse-temurin:24-jdk AS build
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests

FROM eclipse-temurin:24-jdk

WORKDIR /app

COPY --from=build /app/target/*.jar tourist-review-backend.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "tourist-review-backend.jar"]
