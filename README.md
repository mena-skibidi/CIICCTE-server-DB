# CIICCTE-server-DB

## Sobre el proyecto

Setup de docker compose para levantar la infraestructura de la db para el proyecto de workspaces del CIICCTE
- Se trabaja con una network externa definida para aislar los servicios que pueden acceder a la base de datos
- Se usa un volumen persistente para almacenar las entradas de la db
- La db esta configurada en compose para correr en el puerto 5432 y puede ser accedida por contenedores expuestos a la red db-net o desde el mismo host usando ese puerto

## Tech stack

Por motivos de documentacion, este es el stack de tecnologias usado para el desarrollo de este repo

- postgresql como base de datos, corren en el puerto 5432
- docker como runtime de contenedores
- docker compose para el despliegue del contenedor
- pgadmin en caso de que se requiera consultar la db de manera visual, corre en el puerto 8080

## Como iniciar la db

1. Debido a como esta planeado el uso de la base de datos, es importante asegurarse que existe la docker network llamada "db-net", sino existe, esta puede ser creada con:

```bash
docker network create db-net
``` 

2. Al asegurarse que si existe, la db puede ser iniciada con el siguiente comando

```
docker compose up -d
```

## Como usar pgadmin

Por default pgadmin se va a iniciar en el puerto 8080 y es accesible desde localhost:8080, para autenticarse los valores de prueba son admin@admin.com y admin321.
Y para agregar la base de datos, se debera crear una conexion usando los valores del compose file (contrasena, nombre de la db, usuario) y para el hostname se debe poner el nombre del servicio el cual es "db"
