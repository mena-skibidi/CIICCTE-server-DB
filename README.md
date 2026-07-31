# CIICCTE-server-DB

## Sobre el proyecto

Conjunto de scripts y setup de docker compose para generar la infraestructura de la db para el proyecto de workspaces del CIICCTE
- Se trabaja con una network externa definida para aislar los servicios que pueden acceder a la base de datos
- Y se utiliza un volumen persistente para almacenar las entradas de la db
- La db esta configurada en ompose para correr en el puerto 5432 y puede ser accedida por contenedores expuestos a la red db-net o desde el mismo host usando ese puerto

## Tech stack

Por motivos de documentacion, este es el stack de tecnologias usado para el desarrollo de este repo

- postgresql como base de datos 
- docker como runtime de contenedores
- docker compose para el despliegue del contenedor

## Como iniciar la db

1. Debido a como esta planeado el uso de la base de datos, es importante asegurarse que existe la docker network llamada "db-net", sino existe, esta puede ser creada con:

```bash
docker network create db-net
``` 

2. Al asegurarse que si existe, la db puede ser iniciada con el siguiente comando
```
docker compose up -d
```
