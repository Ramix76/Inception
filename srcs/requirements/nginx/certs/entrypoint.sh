#!/bin/bash

CERTS_DIR="$(dirname "$0")"  # Obtener la ruta del directorio donde se encuentra el script

# Verificar si las claves y el certificado existen
if [ ! -f "$CERTS_DIR/framos.key" ] || [ ! -f "$CERTS_DIR/framos.crt" ]; then
    echo "Generando claves y certificado..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
         -keyout "$CERTS_DIR/framos.key" \
         -out "$CERTS_DIR/framos.crt" \
         -subj "/C=SP/ST=Spain/L=Barcelona/O=framos-p.42.fr/CN=framos"
    cat "$CERTS_DIR/framos.crt" "$CERTS_DIR/framos.key" > "$CERTS_DIR/framos.pem"
else
    echo "Claves y certificado ya existentes. No se generaron nuevos."
fi

# Asignar permisos de ejecución al script
chmod +x "$CERTS_DIR/entrypoint.sh"

# Iniciar nginx
echo "Iniciando Nginx..."
exec "$@"
