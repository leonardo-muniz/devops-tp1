:: Criação do volume Docker
docker volume create pg_ricknmorty_data

:: Execução do container Docker
docker run -d \
  --name ricknmorty-postgres \
  -e POSTGRES_USER=admin \
  -e POSTGRES_PASSWORD=admin \
  -e POSTGRES_DB=ricknmorty \
  -v pg_ricknmorty_data:/var/lib/postgresql/data \
  ricknmorty-db

:: Uma linha só, caso dê problema no terminal
docker run -d --name ricknmorty-postgres -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=ricknmorty -v pg_ricknmorty_data:/var/lib/postgresql/data ricknmorty-db
