FROM ubuntu AS build
RUN apt update -y && apt install openjdk-17-jre-headless -y && apt install maven -y
WORKDIR /app
COPY . .
RUN mvn package -DskipTests=true -Dcheckstyle.skip

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/spring-petclinic-3.2.0-SNAPSHOT.jar ./app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
