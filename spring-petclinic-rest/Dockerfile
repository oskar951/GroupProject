FROM openjdk:15-jdk-alpine
RUN mkdir /opt/petclinic/
COPY . /opt/petclinic/
WORKDIR /opt/petclinic/
EXPOSE 9966
CMD ["./mvnw", "spring-boot:run"]