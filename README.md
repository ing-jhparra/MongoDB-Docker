<h1><strong>Procedimiento para crear un entorno de MongoDB en Docker</strong></h1>
<p align="center">
    <img src="./extras/docker_mongodb.png" alt="Imagen de MongoDB y Docker"  />
</p>

<h2>Introducción</h2>
<p>MongoDB en Docker: La combinación perfecta para una experiencia de desarrollo sin complicaciones.</p>

<p>¿Cansado de instalaciones complejas y configuraciones tediosas? Con MongoDB en Docker, ¡olvídate de esos problemas! Experimenta una forma más sencilla y eficiente de ejecutar tu base de datos favorita.</p>

<p>Docker te ofrece:<p>

<p>
<ul>
<li>Entorno aislado: Cada contenedor MongoDB se ejecuta en su propio espacio, sin afectar a otros programas o     configuraciones.</li>
<li>Portabilidad: Mueve tu base de datos entre diferentes máquinas sin problemas de compatibilidad.</li>
<li>Escalabilidad: Aumenta o reduce la capacidad de tu base de datos de forma rápida y flexible.</li>
<li>Facilidad de uso: Inicia y detén tu base de datos con un solo comando.</li>
</li>Reproducibilidad: Comparte tus configuraciones y entornos con otros desarrolladores de forma precisa.</li>
</ul></p>

<h2>Pasos a seguir para crear y poner en funcionamiento MongoDB en Docker</h2>
<p><b>Nota</b> : Estos pasos fueron realizado y probado en un entorno de linux Debian (Codename:bullseye)</p>

<p><b>Paso 1</b>. Creamos un directorio</p> 
<p>[dockeruser@debian ~] $ mkdir mongodb-docker</p> 

<p><b>Paso 2</b>. Creamos un archivo de configuración YAML</p>
<p>[dockeruser@debian ~]$ touch docker-compose.yml</p>

<p><b>Paso 3<b>. Abrimos el archivo en modo "append" (Insertar)</p>
<p>[dockeruser@debian ~]$ cat > docker-compose.yml</p>

<p><b>Paso 4<b>. Copiar el codigo que sigue en el archivo docker-compose.yml</p>
<pre>
version: '2.2'

services:

  mongo:
    image: mongo:4.0.4
    restart: always
    container_name: monguito
    environment:
      - MONGODB_USER="Defina un usuario para el docker"
      - MONGODB_PASS="Defina un password para el usuario del docker"
    volumes:
      - ./monguitodata:/data/db
      - ./monguitodata/log:/var/log/mongodb/
    ports:
      - "27017:27017"
</pre>

<b>Nota</b>: Para guardar el contendio ingrese una linea con <b>[ENTER]</b> y luego <b>control D<b> para cerrar.

<p>Paso 5. Creamos un archivo shell script para ejecutar un conjunto de comandos</p>
<p>[dockeruser@debian ~]$ touch mongodb.sh</p>

<p>El archivo <b>mongodb.sh<b> debe contener la siguiente linea</p>
<pre>
    mkdir monguitodata && cd monguitodata; cd monguitodata || mkdir log
    sudo docker-compose up -d
    echo "Monguito está iniciandose ......."
    sudo docker exec -it monguito bash
</pre>

<b>Nota</b>: Para guardar el contendio ingrese una linea con <b>[ENTER]</b> y luego <b>control D<b> para cerrar.

<p>Paso 6. Asignar permisos de ejecución y ejecutar mongo.sh</p>
<p>[dockeruser@debian ~]$ chmod u+x mongo.sh</p>
<p>[dockeruser@debian ~]$ ./mongo.sh</p>

<p>Paso 6. Listo, desde acá ya puede hacer uso de un entorno MongoDB.</p>

<h2><strong>Conceptualizando</strong></h2>
<!-- Seccion de conceptos -->

<div>
  <ul>
    <li><p><strong>Docker</strong>: es como una caja que encierra una aplicación con todo lo que necesita para funcionar (código, librerías). La puedes mover fácilmente a distintas máquinas sin preocuparte por compatibilidad. Imagina Legos® para software: independientes, portables y apilables.</p></li>
    <li><p><strong>MongoDB</strong>: es una base de datos NoSQL de código abierto. Almacena datos en documentos flexibles, como JSON, en lugar de tablas rígidas. Es fácil de usar, ideal para aplicaciones web y móviles, y escalable para grandes conjuntos de datos.</p></li>
    <li><p><strong>YAML (Yet Another Markup Language)</strong> es un lenguaje de marcado para escribir archivos de configuración. Es fácil de leer y escribir, similar a JSON, pero con una sintaxis más flexible y expresiva. Se usa para definir estructuras de datos, como listas, objetos y propiedades, de forma legible para humanos.</p></li>
  </ul>
</div>