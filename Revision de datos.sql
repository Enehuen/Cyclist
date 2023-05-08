--Veamos los valores de todas las columnas y si se pasaron bien. 

SELECT 
	*
FROM
	Q2
WHERE
	inicio is not null and Finalizo is not null
ORDER BY 4

--Empezamos haciendo el conteo general de viajes entre Customers y Subscriber dividido por generos
SELECT 
	COUNT(ID_Viaje) AS Viajes,
	Membrecia,
	Genero
FROM
	Q4
Where Genero IS NOT NULL
GROUP BY Membrecia,Genero
ORDER BY Genero desc

/*
En este caso podemos ver como en cada cuartil el numero de Customer sube a la par que el numero de Subscribers
Un 6% de los varones en el ultimo cuartil son Customer, 
y en las mujeres un 9% de ellas es Customer, este porcentaje bajo a comparacion del tercer cuartil
Ya que este porcentaje de Customer mujeres era del 23%, pero se mantiene igual de alto en el segundo cuartil.
*/

--Analizamos las Estaciones de salida mas utilizadas haciendo un Conteo de los viajes hechos en cada uno, segmentado por Membrecias

select TOP 5
	Count(ID_Viaje) as Viaje,
	Salida,
	Membrecia
FROM
	Q2
WHERE Membrecia = 'Customer'
GROUP BY Membrecia, Salida
ORDER BY Viaje Desc

/*
Gracias a esta query podemos determinar las Estaciones que mas utilizan los Customer para empezar su viaje,
Tomando estos datos en cuenta podemos determinar mejor la zona en la que empezar a promover el cambio de 
subscripcion.
*/

--Para continuar con los datos sacamos un promedio de la edad que tienen los Customer 
--y Subscribers de cada Genero
--Esto teniendo en cuenta el año en que se tomaron los datos, osea 2019


SELECT 
	AVG(2019-Nacimiento) as Edad,
	Membrecia,
	Genero
FROM
	Q2
Where Nacimiento is not null and Genero is not null
GROUP BY Genero,Membrecia
ORDER BY Edad


/*
Vemos que la edad promedio de los Customers tanto de mujeres como de varones es entre 28 y 31 años
Esto puede llegar a ser importante a la hora de señalar la edad principal a la que se enfocan las camapañas
de marketing, para tener un mayor impacto en estas edades.
*/

--Ahora analizamos la duracion promedio de las dos tipos de membrecias mediante el comando CONVERT, 
--Esta funcion la utilice para pasar a Segundos el formato datetime, 
--luego se suma la cantidad total de segundos y de ahi aplicamos DATEADD para poder devolver el formato de hora

select
	COUNT(ID_Viaje) as Viajes,
	Membrecia,
	CONVERT(VARCHAR(8), DATEADD(SECOND, AVG(DATEDIFF(SECOND, '00:00:00', Duracion)), '00:00:00'), 108) AS duracion_promedio,
	DiaSemana
FROM
	Q3
Where Membrecia = 'Customer'
GROUP BY Membrecia,DiaSemana
ORDER BY DiaSemana DESC

/*
Podemos notar una tendencia hacia una duracion promedio mayor en los dias Sabado y domingo teniendo incluso hasta el doble de viajes que en dias de
semana como lunes y martes.
*/



--Vamos ahora a ver la maxima duracion de una ruta. ordenado por ruta y membrecia

SELECT 
	COUNT(ID_Viaje) as Viajes,
	Membrecia,
	CONCAT(Salida, ' Hasta ',Llegada) as Ruta,
	CONVERT(VARCHAR(8), DATEADD(SECOND, AVG(DATEDIFF(SECOND, '00:00:00', Duracion)), '00:00:00'), 108) AS duracion_promedio
FROM
	Q3
WHERE Membrecia = 'Subscriber'-- and Duracion >= '01:00:00'
GROUP BY Membrecia, Salida, Llegada
ORDER BY 1 desc

/*
Hay una tendencia bastante notable en los Customer por utilizar las mismas rutas, sumando mas de mil viajes solo en estas rutas, esto sumado a un
promedio de entre 30 y 50min de duracion por ruta, que a comparacion de los Subscribers tienden a hacer entre 100 y 200 viajes por ruta en distintas
variables, teniendo por ende una duracion promedio mucho mas baja de entre los 5 y los 20 min
*/


--Ahora vamos a analizar la distribucion de viajes que se hicieron en los distintos dias de la semana.
--1 = lunes, 7 = Domingo, Ordenados por el dia de la semana y Calculando su duracion promedio

SELECT DISTINCT
	count(ID_Viaje) as Viajes,
	Membrecia,
	DiaSemana
FROM
	Q3
GROUP BY DiaSemana,Membrecia
ORDER BY Viajes desc


/*
En este caso podemos notar como la tendencia de los Customer a la hora de viajar se destaca constantemente en
los fines de semana, Sabado y domingo son los dias en donde mas viajes se han realizado.
Caso contrario con los Subscriber que tienden a viajar mas en dia de semana.
*/