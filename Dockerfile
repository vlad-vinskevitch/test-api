#Build JAR
FROM gradle:7.3.3-jdk17 AS BUILD_IMAGE
RUN mkdir /apps
COPY --chown=gradle:gradle . /apps
WORKDIR /apps
RUN gradle clean build --info jar

FROM openjdk:17
EXPOSE 8080
COPY --from=BUILD_IMAGE /apps/build/libs/*.jar test.jar
ENTRYPOINT ["java", "-jar", "test.jar"]
