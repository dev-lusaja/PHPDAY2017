# PHP-Day + Docker xD


Requerimientos
--------------

* Docker v.1.13
* Docker-compose v.1.9.0
* Make


Configurar dominios de prueba en /etc/hosts
-------------------------------------------

~~~~
$ 127.0.0.1 web.dev
$ 127.0.0.1 api.dev
~~~~

Instalación de proyecto
-----------------------

~~~~
$ make install
~~~~

Desinstalación del proyecto
---------------------------

~~~~
$ make uninstall
~~~~

Escalamiento de servicios
-------------------------

CANT tomara la cantidad de containers que se desea tener en el motor de docker 

~~~~
$ make scale-api CANT=2
$ make scale-web CANT=2
~~~~

Nota
----

Para ver toda la lista de comandos Make ejecuta el siguiente comando en el directorio del proyecto.

~~~~
$ make
~~~~