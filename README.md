# Tópicos Especiales en Telemática -P1
## Autor: Andrés Felipe Zapata Palacio - azapat47@eafit.edu.co
## Proyecto 1
## PreRequisitos
* Docker
* Acceso al repositorio
## Modo de Uso
### 1. Construir las imágenes a partir del Dockerfile y del docker-compose
        $ docker-compose build
### 2. Ejecuto manualmente la migración y creación de la base de datos
        $ docker-compose run rails db:create
        $ docker-compose run rails db:migrate
### 3. Construyo e inicio los containers a partir de las imagenes recien creadas
        $ docker-compose start
