FROM openjdk:21-jdk-slim
RUN addgroup -system devopsc && useradd -G devopsc javams 
USER javams:devopsc
ENV JAVA_OPTS=""
ARG JAR_FILE
ADD app-0.0.4-SNAPSHOT.jar app.jar
 # use a volume is mor efficient and speed that filesystem
VOLUME /tmp
EXPOSE 7080
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

