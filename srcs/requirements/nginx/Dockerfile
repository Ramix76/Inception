FROM debian:bullseye

RUN apt-get update
RUN apt-get install nginx openssl --no-install-recommends --no-install-suggests -y

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN mkdir -p /var/www/html/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	 -keyout /etc/ssl/certs/framos.key \
	 -out /etc/ssl/certs/framos.crt \
	 -subj "/C=SP/ST=Spain/L=Barcelona/O=framos-p.42.fr/CN=framos"

RUN cat /etc/ssl/certs/framos.crt /etc/ssl/certs/framos.key > /etc/ssl/certs/framos.pem

EXPOSE 443

#CMD ["tail" ,"-f", "/dev/null"]

CMD ["nginx", "-g", "daemon off;"]
