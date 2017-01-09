FROM alpine:3.4
MAINTAINER wangkexiong@gmail.com

ENV  MYSQL_USER=root \
     MYSQL_DATA_DIR=/var/lib/mysql

COPY entrypoint.sh /sbin/entrypoint.sh
RUN  chmod +x /sbin/entrypoint.sh && \
     apk add --no-cache mysql mysql-client && \
     mkdir -p /run/mysqld

EXPOSE 3306/tcp
VOLUME ["${MYSQL_DATA_DIR}", "/etc/mysql"]

ENTRYPOINT ["/sbin/entrypoint.sh"]
