# Avaliação Prática - Rick & Morty API (Docker)

Este repositório contém a entrega da avaliação prática contemplando a containerização de um banco de dados PostgreSQL e de uma API Java (Maven), orquestrados via Docker Compose.

## 📋 Requisitos Atendidos

### Questão 1: Banco Containerizado
- Utiliza a imagem base `postgres:17.8-alpine3.23`.
- Inicializa os dados automaticamente com o script `data.sql` na primeira execução.
- Os dados são persistidos em um volume Docker nomeado (`pg_ricknmorty_data`).
- **Segurança:** A porta `5432` não está exposta para a máquina host.

### Questão 2: API + Banco na mesma rede
- A aplicação Java foi containerizada utilizando *multi-stage build* (Maven para build, JRE para runtime).
- A API conecta-se ao banco de dados utilizando o nome do serviço (`db`), resolvido pelo DNS interno da rede Docker.
- Ambos os containers rodam isolados na rede `ricknmorty-net`.
- A API expõe a porta `8080` para acesso no host.

---

## 🚀 Como Executar o Projeto

**1. Clone ou acesse o diretório do projeto:**
Navegue até a pasta raiz onde o arquivo `docker-compose.yml` está localizado.

**2. Suba o ambiente em modo detachado:**
Execute o comando abaixo para construir as imagens e iniciar os containers:
```bash
docker compose up -d --build
```

## 🔍 Validação e Evidências

### Verificar o status dos containers

Para confirmar que a API e o Banco estão rodando:

```bash
docker compose ps
```

### Visualizar os Logs

Para verificar a inicialização do banco de dados (execução do data.sql) e a inicialização da API (Spring Boot na porta 8080):

```bash
docker compose logs db
docker compose logs api
```

### Testar a Comunicação (Host -> API -> Banco)

Com os containers rodando, acesse a API a partir da sua máquina host executando o comando abaixo no terminal:

```bash
curl http://localhost:8080/api/characters
```

Ou abra o navegador e acesse: http://localhost:8080/api/characters

## 🧹 Como encerrar o ambiente

Para parar e remover os containers e a rede criada (mantendo o volume de dados intacto):

```bash
docker compose down
```

Para remover também o volume de dados do banco:

```bash
docker compose down -v
```
