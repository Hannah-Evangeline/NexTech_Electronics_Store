FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

CMD ["sh", "-c", "java -jar target/BusinessProject-0.0.1-SNAPSHOT.jar --server.address=0.0.0.0 --server.port=${PORT:-10000}"]