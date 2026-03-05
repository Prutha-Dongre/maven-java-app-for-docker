FROM eclipse-temurin:11-jdk

WORKDIR /app

COPY . .

# Fix Maven structure automatically
RUN mkdir -p src/main/java/com/example && mv App.java src/main/java/com/example/

# Install Maven and build
RUN apt update && apt install -y maven && mvn clean package

EXPOSE 8080

CMD ["java","-jar","target/java-docker-app-1.0.jar"]
