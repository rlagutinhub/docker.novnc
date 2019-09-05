FROM oraclelinux:7-slim

MAINTAINER Lagutin R.A. <rlagutin@mta4.ru>

COPY build /tmp/build

RUN chmod -x /tmp/build/supervisord.conf && mv -f /tmp/build/supervisord.conf /etc/supervisord.conf && mv -f /tmp/build/supervisord.conf.d /etc/supervisord.conf.d && \
    chmod +x /tmp/build/* && mv -f /tmp/build/bash-color.sh /etc/profile.d/bash-color.sh && mv -f /tmp/build/docker-entrypoint.sh /etc/docker-entrypoint.sh && \
    for script in /tmp/build/*.sh; do sh $script; done && \
    rm -rf /tmp/build && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime

ENV LANG='ru_RU.UTF-8' LANGUAGE='ru_RU:ru' LC_ALL='ru_RU.UTF-8'

# EXPOSE 6080

WORKDIR /root

ENTRYPOINT ["/etc/docker-entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
