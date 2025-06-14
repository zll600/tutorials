FROM maven:3.8.7-amazoncorretto-19 as builder

WORKDIR /app
 
COPY pom.xml .
 
COPY src src

RUN mvn clean package

FROM amazoncorretto:21.0.3-alpine3.16@sha256:27d1927f8df1353f91913bcd474f5bcd371cce906103292fbacef9929aa4ae94

COPY --from=builder /app/target/*.jar /app/java-app.jar

ENTRYPOINT ["java","-jar","/app/java-app.jar"]
