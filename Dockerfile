FROM alpine
Maintainer Antoine Hebert <antoine.hebert@gmail.com>

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    DB_USER="admin" \
    DB_PASS="password"

RUN apk -U upgrade && \
    apk --update add \
      mariadb mariadb-client \
      && \
      rm -rf /tmp/src && \
      rm -rf /var/cache/apk/*


ADD ./config/my.cnf /etc/mysql/my.cnf
ADD ./config/start.sh /start.sh

RUN chmod u+x /start.sh

VOLUME ["/data"]

EXPOSE 3306

CMD ["/start.sh"]