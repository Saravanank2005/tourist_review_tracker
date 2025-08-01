FROM maven:3.9.4-eclipse-temurin-17 AS build

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN chmod +x mvnw && ./mvnw dependency:go-offline

COPY src ./src

RUN ./mvnw clean package -DskipTests

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /app/target/tourist-review-backend.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]
