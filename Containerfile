# Build
FROM registry.access.redhat.com/ubi9/openjdk-17 as builder

COPY pom.xml .
COPY src src

RUN mvn -B package

# Run
FROM registry.access.redhat.com/ubi9/openjdk-17-runtime

COPY --from=builder /home/default/target/hello-0.0.1-SNAPSHOT.jar /home/default/hello-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/home/default/hello-0.0.1-SNAPSHOT.jar"]