FROM vnc.os:latest

MAINTAINER Lagutin R.A. <rlagutin@mta4.ru>

COPY build.app /tmp/build

RUN chmod -x /tmp/build/supervisord.conf && mv -f /tmp/build/supervisord.conf /etc/supervisord.conf && \
    chmod +x /tmp/build/docker-entrypoint.sh && mv -f /tmp/build/docker-entrypoint.sh /etc/docker-entrypoint.sh && \
    rm -rf /tmp/build

RUN ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime

ENV LANG='ru_RU.UTF-8' LANGUAGE='ru_RU:ru' LC_ALL='ru_RU.UTF-8'

ENV DISPLAY=:1\
    DISPLAY_WIDTH=1280 \
    DISPLAY_HEIGHT=1024

# EXPOSE 6080

ENTRYPOINT ["/etc/docker-entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
