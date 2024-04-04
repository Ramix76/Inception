FROM debian:bullseye

RUN apt-get update -y
RUN apt-get install php\
		php-fpm\
		curl\
		php-mysqli\
		mariadb-client\
		-y

COPY ./tools/wp_build.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_build.sh

WORKDIR /var/www/html/
RUN mkdir -p /run/php \
	&& chmod 755 /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wp_build.sh"]
