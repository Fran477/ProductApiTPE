# API REST Productos 3dPrint
Una API REST creada para listar, filtrar, agregar, modificar, ordenar los productos 3dPrint

## Importar la base de datos
- importar desde PHPMyAdmin (o cualquiera) db/db_product3d.sql
- Campos de la tabla:

- id
- name
- price
- stock
- description
- type_filament
- id_category


## Endpoint de la API para probar con Postman

         http://localhost/api-productTPE/api/products/


## Endpoint para la utilizacion de la API

- GET (Traer todos los productos y listarlos)

         http://localhost/api-productTPE/api/products/

- GET:ID (Trae un producto filtrado por su id)

         http://localhost/api-productTPE/api/products/:ID

EJEMPLO:

         http://localhost/api-productTPE/api/products/1

- DELETE:ID (Se utiliza el metodo delete y se le tiene que pasar un id valido)

         http://localhost/api-productTPE/api/products/:ID

EJEMPLO: 

         http://localhost/api-productTPE/api/products/1


- PUT:ID (Se utiliza para poder modificar un producto)

         http://localhost/api-productTPE/api/products/:ID

EJEMPLO: 

         http://localhost/api-productTPE/api/products/1

- POST (Se utuliza este metodo para poder agregar un producto a la base de datos)

         http://localhost/api-productTPE/api/products

EJEMPLO:  

         http://localhost/api-productTPE/api/products

- PARA LOS METODOS POST Y PUT EN POSTMAN SE DEBE DE MANDAR EL PRODUCTO DE LA SIGUIENTE MANERA:

EJEMPLO:

        {
            "id": "1",
            "name": "Jabonera",
            "price": "2000",
            "description": "Una jabonera impresa en 3D con una gran resistencia al agua.",
            "type_filament": "PLA",
            "stock": "2",
            "id_category": "1"
        }


## Endpoint para la utilizacion de los ordenamientos y filtros

- GET ordenamiento ASC y DESC por uno de los siguientes campos

"id","name","stock","price"

- id
- name
- stock
- price

- Ademas se debe de elejir entre:

- asc
- desc

- Varible: order
- Varible: field

EJEMPLO:  

         http://localhost/api-productTPE/api/products/?order=asc&field=name

- GET filtrar un producto por el campo tipo de filamento (se puede filtrar los productos por los diferentes tipos de filamentos especificados)

- Varible: filament

- Tipos de filamentos para el filtro:

- PLA
- PETG
- PTG

EJEMPLO:  

         http://localhost/api-productTPE/api/products/?filament=PLA




## Contacto por consultas o ayuda

- Creador Francisco Gonzalez Herzberg - gonzalezfrancisco477@gmail.com


