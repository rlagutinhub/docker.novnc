FROM oraclelinux:7-slim

MAINTAINER Lagutin R.A. <rlagutin@mta4.ru>

# rpm
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
    openssl \
    conky \
    procps \
    supervisor; \
    yum clean all

# tz
RUN set -ex; \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime

# locale
ENV LANG='ru_RU.UTF-8' LANGUAGE='ru_RU:ru' LC_ALL='ru_RU.UTF-8'
# ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# default
ENV DISPLAY=':1' DISPLAY_WIDTH='1024' DISPLAY_HEIGHT='768' VNC_PASS='passw0rd'

COPY . /app

# EXPOSE 6080

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["supervisord", "-c", "/app/supervisord.conf"]
