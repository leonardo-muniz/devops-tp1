:: Comando para listar as tabelas
docker exec -it ricknmorty-postgres psql -U admin -d ricknmorty -c "\dt"

:: Comando para executar um SELECT e visualizar os dados
docker exec -it ricknmorty-postgres psql -U admin -d ricknmorty -c "SELECT * FROM characters LIMIT 5;"
