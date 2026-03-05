FROM eclipse-temurin:11-jdk

WORKDIR /app

COPY . .

# create Maven directory structure automatically
RUN mkdir -p src/main/java/com/example && mv App.java src/main/java/com/example/

# build jar
RUN apt update && apt install -y maven && mvn clean package

EXPOSE 8080

CMD ["java","-jar","target/java-docker-app-1.0.jar"]
