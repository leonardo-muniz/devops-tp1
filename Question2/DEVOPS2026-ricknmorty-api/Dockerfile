# Estágio 1: Build
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn clean package -DskipTests

# Estágio 2: Runtime Seguro (Distroless)
FROM gcr.io/distroless/java17-debian11 AS final
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

# Troca para um usuário sem privilégios nativo da imagem distroless
USER nonroot:nonroot

ENTRYPOINT ["java", "-jar", "app.jar"]
