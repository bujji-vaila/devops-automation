FROM openjdk:8
EXPOSE 8080
ADD target/springboot-docker-jenkin.jar springboot-docker-jenkin.jar
ENTRYPOINT [ "java", "-jar","springboot-docker-jenkin.jar" ]
