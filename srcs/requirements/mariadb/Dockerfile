FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
&& apt install -y mariadb-server

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT_PASS

COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
RUN /usr/local/bin/mariadb.sh

EXPOSE 3306

CMD ["mariadbd"]
