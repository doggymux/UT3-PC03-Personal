#!/bin/bash

# cambiar al usuario postgres
sudo -u postgres bash << EOF

# conectarse al motor de base de datos
psql -c "SELECT 1;" || exit 1

# crear un usuario y contraseña
username=\$(echo \$POSTGRES_USER | base64 -d)
password=\$(echo \$POSTGRES_PASSWORD | base64 -d)
psql -c "CREATE USER \$username WITH PASSWORD '\$password';"

# crear una base de datos
dbname=\$(echo \$POSTGRES_DB | base64 -d)
psql -c "CREATE DATABASE \$dbname;"

# conceder privilegios al usuario
psql -c "GRANT ALL PRIVILEGES ON DATABASE \$dbname TO \$username;"
EOF
