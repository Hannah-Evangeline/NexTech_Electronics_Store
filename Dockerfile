FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

CMD ["sh", "-c", "java -jar target/BusinessProject-0.0.1-SNAPSHOT.jar --server.port=${PORT:-8080}"]