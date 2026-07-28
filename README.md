# CIICCTE-server-DB

## About the project

- Docker compose files and sql scripts used to generate the db infrastructure for the lab
- The compose file makes use of a persistent volume and a network in order to keep the db data and allow the connection to the backend

## Tech stack

- postgresql
- docker
- docker compose

## How to run

- Make sure a docker network named "db-net" has been created, if not create it
```
docker network create db-net
```

```
docker compose up -d
```
