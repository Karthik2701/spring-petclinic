FROM openjdk:17-alpine
WORKDIR /app
COPY target/spring-petclinic-3.3.0-SNAPSHOT.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
