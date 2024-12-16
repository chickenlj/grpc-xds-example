# This is the demo Dockerfile for the generated template project, please change accordingly before building image from it.
# Run the following command to build image: docker build -f ./Dockerfile --build-arg APP_FILE=quickstart-service-0.0.1-SNAPSHOT.jar -t demo:latest .
FROM openjdk:17-jdk-alpine

# Set the working directory to /build
WORKDIR /build
COPY . /build

# copy the JAR file into the root and rename
RUN cp ./build/libs/myapp-1.0.0.jar app.jar

ENV GRPC_XDS_BOOTSTRAP=./bootstrap.json

ENV JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"

ENTRYPOINT ["java", "-jar", "app.jar"]

CMD ["hello world","xds:///echo:7070"]
# Run java with the jar file when the container starts up
# CMD ["java","-jar","app.jar","hello world","xds:///echo:7070"]
