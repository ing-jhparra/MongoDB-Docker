Procedimiento para crear un entorno de MongoDB en Docker

![Imagen de MongoDB y Docker](https://github.com/ing-jhparra/MongoDB-Docker/blob/main/extras/docker_mongodb.png)

<p>
  Me Ritam<br>
  Nice to meet Ya!
  <p align="right">
    <img src="./extra/docker_mongodb.png" alt="hello-dark" height="220" width="210" />
  </p>
</p>


Los Pasos a continuacion seran realizado y probado en Debin (Codename:bullseye)

Paso 1. Creamos un directorio 
[dockeruser@debian ~]$ mkdir mongodb-docker

Paso 2. Creamos un archivo de configuración YAML
[dockeruser@debian ~]$ touch docker-compose.yml

Paso 3. Abrimos el archivo en modo "append" (Insertar) 
[dockeruser@debian ~]$ cat > docker-compose.yml

Paso 4. Copiar el codigo que sigue en el archivo docker-compose.yml

version: '2.2'

services:

  mongo:
    image: mongo:4.0.4
    restart: always
    container_name: monguito
    environment:
      - MONGODB_USER="user"
      - MONGODB_PASS="pass"	
    volumes:
      - ./monguitodata:/data/db
      - ./monguitodata/log:/var/log/mongodb/
    ports:
      - "27017:27017"

Nota: Para guardar el contendio ingrese una linea con [ENTER] y luego control D para cerrar.

Paso 5. Creamos un archivo shell script para ejecutar un conjunto de comandos

[dockeruser@debian ~]$ touch mongodb.sh

Paso 5.1. Crear directorio para volumen de mongo

[dockeruser@debian ~]$ mkdir monguitodata && cd monguitodata; cd monguitodata || mkdir log

Paso 5.2. Salimos del directorio

[dockeruser@debian ~]$ cd

Paso 5.3. Iniciamos el contendor

[dockeruser@debian ~]$ sudo docker-compose up -d

Paso 5.4. Mostrar mensaje

[dockeruser@debian ~]$  echo "Monguito está iniciandose ......."

Paso 5.5. Entramos al contenedor

[dockeruser@debian ~]$ sudo docker exec -it monguito bash

> Control + d
_________________________________________________________
Paso 6. Asignar permisos de ejecución y ejecutar mongo.sh
> chmod u+x mongo.sh
> ./mongo.sh 
_______
Paso 7. 




CREANDO UN CONTENEDOR

Instalar Mongo: 
En la línea de comando.
____________________________________________________________
Paso 1. Crear documento de docker-compose.

Opción 1.

> Usar docker compose, visual estudio code, instalando la extensión de docker.

Opción 2.

> touch docker-compose.yml
> cat > docker-compose.yml
_____________________________________________
Paso 2. Crear documento de docker-compose.yml:

version: '2.2'

services:

  mongo:
    image: mongo:4.0.4
    restart: always
    container_name: monguito
    environment:
      - MONGODB_USER="user"
      - MONGODB_PASS="pass"	
      
    volumes:
      - ./monguitodata:/data/db
      - ./monguitodata/log:/var/log/mongodb/
    ports:
      - "27017:27017"
    
____________________________________________________________
paso 3. Crear archivos para correr comando en la la terminal:

> touch mongo.sh
__________________________________________
Paso 4. Cargar comandos al archivo creado:

> cat > mongo.sh   	(Copiar y pegar los comandos que queremos se ejecuten automáticos)

#Crear carpeta para volumen de mongo:
mkdir monguitodata && cd monguitodata; cd monguitodata || mkdir log

cd

#Iniciar el contenedor:
sudo docker-compose up -d

#Mostrar mensaje:
echo "Monguito está iniciandose ......."

#entrar en el contenedor
sudo docker exec -it monguito bash

_______
Paso 5.

> Control + d
_________________________________________________________
Paso 6. Asignar permisos de ejecución y ejecutar mongo.sh
> chmod u+x mongo.sh
> ./mongo.sh 
_______
Paso 7. 

USAR MONGO A PLACER.
