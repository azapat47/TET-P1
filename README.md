# Tópicos Especiales en Telemática -P1
#### Autor: Andrés Felipe Zapata Palacio - azapat47@eafit.edu.co
## Proyecto 1
## PreRequisitos
* Docker
* Acceso al repositorio
* Google-Chrome para poder obtener correctamente las coordenadas (Por alguna razón, Firefox impide obtener la posición GPS)
## Modo de Uso de la App Web (GPS-Project)
#### 1. Ingresar al sitio por HTTP
    http://azapat47.dis.eafit.edu.co
#### 2. Crear una cuenta o hacer login en caso de ya poseer una
#### 3. Una vez esté en el home de usuario cambiar la URL para utilizar el protocolo HTTPS y dar con ello la confianza al Browser para entregar la información GPS
    https://azapat47.dis.eafit.edu.co
#### 4. Para Hacer LogOut volver a HTTP quitando la 's' en el URL
    http://azapat47.dis.eafit.edu.co
#### 5. Finalmente, hacer clic en el botón LogOut

## Modo de Uso del Container
### 1. Construir las imágenes a partir del Dockerfile y del docker-compose
        $ docker-compose build
### 2. Ejecuto manualmente la migración y creación de la base de datos
NOTA IMPORTANTE: Este paso no se pudo automatizar en el Dockerfile pues la base de datos MySQL está montada en un contenedor, por lo que este contenedor no puede crearse hasta no hacer un BUILD.

        $ docker-compose run rails db:create
        $ docker-compose run rails db:migrate
### 3. Construyo e inicio los containers a partir de las imagenes recien creadas
        $ docker-compose start
        
## Código Importante a resaltar
### ¿Cómo la app web llama a la API REST para el manejo de las coordenadas?
    var http = new XMLHttpRequest();
    var url = "api/v1/coordinates?token=<%= @current_user.token%>";
    var longitude = position.coords.longitude;
    var latitude = position.coords.latitude;
    http.open("POST", url, true);
    http.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    http.onreadystatechange = function() {
      if(http.readyState == 4 && http.status == 200) { 
        alert(http.responseText);
      }
    }
    http.send(JSON.stringify({longitude:longitude, latitude:latitude}));
### Controller para API REST - Función CREATE del CRUD
    def create
      info = request.body.read()
      current_lati = JSON.parse(info)["latitude"].round(6)
      current_long = JSON.parse(info)["longitude"].round(6)
      registros = @user.coordinates.where("latitude = ?",current_lati).where("longitude = ?",current_long).size
      if registros == 0
        @coordinate = @user.coordinates.new(JSON.parse(info))
        if @coordinate.save
          render json: @coordinate, status: :created
        else
          render json: @coordinate.errors, status: :unprocessable_creation
        end
      end
    end
