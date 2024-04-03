FROM debian:bullseye

# Actualizar el sistema e instalar nginx y openssl
RUN apt-get update -y
RUN apt-get install nginx openssl --no-install-recommends --no-install-suggests -y

# Copiar la configuración de nginx
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# Crear directorio para el sitio web
RUN mkdir -p /var/www/html/

#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#	 -keyout /etc/ssl/certs/framos.key \
#	 -out /etc/ssl/certs/framos.crt \
#	 -subj "/C=SP/ST=Spain/L=Barcelona/O=framos-p.42.fr/CN=framos"


# Copiar las claves y el certificado desde el host al contenedor
#COPY certs/framos.crt /etc/ssl/certs/
#COPY certs/framos.key /etc/ssl/certs/
COPY certs/* /etc/ssl/certs/

# Combinar las claves y el certificado en un solo archivo
#RUN cat /etc/ssl/certs/framos.crt /etc/ssl/certs/framos.key > /etc/ssl/certs/framos.pem

# Exponer el puerto 443
EXPOSE 443

#CMD ["tail" ,"-f", "/dev/null"]

# Iniciar nginx en modo daemon
CMD ["nginx", "-g", "daemon off;"]
