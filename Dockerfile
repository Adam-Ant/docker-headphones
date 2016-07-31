FROM alpine:3.4
MAINTAINER Adam Dodman <adam.dodman@gmx.com>

ENV UID=526 UNAME=headphones GID=990 GNAME=media

ADD start.sh /start.sh

RUN chmod +x /start.sh \
 && addgroup -g $GID $GNAME \
 && adduser -SH -u $UID -G $GNAME -s /usr/sbin/nologin $UNAME \
 && apk --update add git python \
 && mkdir /headphones && chown $UID:$GID /headphones


USER headphones
RUN git clone --depth=1 https://github.com/rembo10/headphones.git /headphones

VOLUME ["/config", "/media"]
EXPOSE 8181
CMD ["/start.sh"]
