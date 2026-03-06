FROM postgres:17.8-alpine3.23

# Copia o script DDL/Insert para o diretório de inicialização do Postgres
COPY data.sql /docker-entrypoint-initdb.d/
