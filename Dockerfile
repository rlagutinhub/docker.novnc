FROM oraclelinux:7-slim

MAINTAINER Lagutin R.A. <rlagutin@mta4.ru>

RUN set -ex; \
    yum -y update; \
    yum -y --setopt=tsflags=nodocs --enablerepo ol7_optional_latest,ol7_developer_EPEL install \
    novnc \
    python-websockify \
    numpy \
    x11vnc \
    xorg-x11-server-Xvfb \
    fluxbox \
    xterm \
    firefox \
    glibc \
    glibc-common \
    supervisor; \
    yum clean all

COPY build/* /

ENV LANG='ru_RU.UTF-8' LANGUAGE='ru_RU:ru' LC_ALL='ru_RU.UTF-8'
# ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ENV DISPLAY=':1' DISPLAY_WIDTH='1280' DISPLAY_HEIGHT='1024'

# EXPOSE 6080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["supervisord", "-c", "/supervisord.conf"]
