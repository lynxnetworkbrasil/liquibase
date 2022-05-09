FROM ubuntu AS build

ADD https://github.com/liquibase/liquibase/releases/download/v4.9.1/liquibase-4.9.1.tar.gz ./
RUN mkdir /liquibase && \
    tar -zxf liquibase-4.9.1.tar.gz --directory /liquibase

FROM ubuntu

RUN apt update && \
    apt install -y openjdk-11-jre-headless \
    iputils-ping

COPY --from=build /liquibase/* /usr/sbin/
CMD ["ping","localhost"]