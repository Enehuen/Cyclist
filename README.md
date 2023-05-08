# Cyclist
Fuente de datos https://www.kaggle.com/datasets/evangower/cyclistic-bike-share

Objetivo: realizar un analisis para encontrar tendencias en los clientes Customer que pueda determinar una oportunidad de publicitar un cambio de membrecia, en este caso de Casual(Customer) a Anual(Subscriber). 

Para realizar este analisis se represento una empresa ficticia con el objetivo de integrar al equipo de marketing un analista de datos que determine tendenciasen los clientes casuales.

Los datos utilizados son del 2019 y estan divididos en cuartiles, en mi caso lo que hice fue en primera instancia limpiar los archivos CSV. 
dandole un formato uniforme para que a la hora de hacer la base de datos las querys resulten mas faciles de ejecutar.

Este era el formato original de los datos 
![image](https://user-images.githubusercontent.com/113563005/236903925-505b04ee-2d83-427d-82b3-5ef9bea202b9.png)


Asique procedi a ordenar texto en columnas y agregar la duracion del viaje(=C2-B2) y el dia de la semana en que se realizo el viaje
(=DIASEM(B2;2)) Y le di el formato para que el dia lunes sea 1 y domingo 7
Por ultimo corregi el formato de fechas para que no me de problemas a la hora de ir al SQL server.
![image](https://user-images.githubusercontent.com/113563005/236903656-079035ca-8650-4e22-89c9-6167449db211.png)

Realice el mismo proceso en los 4 archivos a los que denomine Q1,Q2,Q3,Q4 y los almacene en una base de datos llamada "Proyecto" 
![image](https://user-images.githubusercontent.com/113563005/236906056-72c6bc69-d2c9-450b-824a-3d868bf95050.png)

