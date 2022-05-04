FROM ubuntu

RUN apt update && \
    apt install -y openjdk-11-jre-headless \
    iputils-ping
ADD https://github.com/liquibase/liquibase/releases/download/v4.9.1/liquibase-4.9.1.tar.gz ./
RUN tar -zxf liquibase-4.9.1.tar.gz --directory /usr/sbin
COPY ./mysql-connector-java_8.0.28-1ubuntu21.10_all.deb ./
RUN dpkg -i mysql-connector-java_8.0.28-1ubuntu21.10_all.deb && \
    apt install -y
CMD ["ping","localhost"]