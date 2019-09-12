FROM oraclelinux:7-slim

MAINTAINER Lagutin R.A. <rlagutin@mta4.ru>

COPY build.os /tmp/build

RUN chmod +x /tmp/build/* && \
    for script in /tmp/build/*.sh; do sh $script; done && \
    rm -rf /tmp/build 
