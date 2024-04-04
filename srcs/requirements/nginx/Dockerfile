FROM debian:bullseye

# Actualizar el sistema e instalar nginx y openssl
RUN apt-get update -y
RUN apt-get install nginx openssl --no-install-recommends --no-install-suggests -y

# Copiar la configuración de nginx
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# Crear directorio para el sitio web
RUN mkdir -p /var/www/html/

# Copiar las claves y el certificado desde el host al contenedor
COPY certs/* /etc/ssl/certs/

# Exponer el puerto 443
EXPOSE 443

# Iniciar nginx en modo daemon
CMD ["nginx", "-g", "daemon off;"]
