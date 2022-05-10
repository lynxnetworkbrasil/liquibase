FROM ubuntu AS build
ARG liquibase_version=4.9.1

ADD https://github.com/liquibase/liquibase/releases/download/v$liquibase_version/liquibase-$liquibase_version.tar.gz ./
RUN mkdir /liquibase && \
    tar -zxf liquibase-$liquibase_version.tar.gz --directory /liquibase

FROM ubuntu

ARG liquibase_dir=/usr/sbin/liquibase/
RUN apt update && \
    apt install -y openjdk-11-jre-headless \
    iputils-ping

COPY --from=build /liquibase/ $liquibase_dir
ENV PATH="${liquibase_dir}:${PATH}"
CMD ["ping","localhost"]