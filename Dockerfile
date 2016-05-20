FROM alpine:3.3
MAINTAINER Adam Dodman <adam.dodman@gmx.com>

ADD start.sh /start.sh

RUN apk --update add git python && \
    adduser -S -u 526 -H -D -s /usr/sbin/nologin headphones && \
    rm -rf /tmp && \
    rm -rf /var/cache/apk/* && \
    mkdir /headphones && chown 526:526 /headphones && \
    chmod u+x  /start.sh

USER headphones
RUN git clone --depth=1 https://github.com/rembo10/headphones.git /headphones

VOLUME ["/config", "/media"]
EXPOSE 8181
CMD ["/start.sh"]