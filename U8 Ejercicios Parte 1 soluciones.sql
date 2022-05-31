
USE comercio;

-- 1. Realiza el producto cartesiano entre la tabla municipio y la tabla provincia.
SELECT * FROM municipio, provincia;

-- 2. Añade a la sentencia del ejercicio anterior la condición WHERE necesaria para que sólo se 
-- muestren las filas con los municipios y sus provincias correspondientes.
SELECT * FROM municipio, provincia
WHERE municipio.provincia = provincia.codigo;

-- 3. Modifica la sentencia anterior para obtener únicamente el nombre del municipio y el de la provincia a la que pertenece.
SELECT municipio.nombre, provincia.nombre 
FROM municipio, provincia
WHERE municipio.provincia = provincia.codigo;

-- 4. Modifica la sentencia anterior para obtener únicamente las filas de aquellos municipios que empiezan por B.
SELECT municipio.nombre, provincia.nombre 
FROM municipio, provincia
WHERE municipio.provincia = provincia.codigo
AND municipio.nombre LIKE 'B%';

-- 5. Realiza el producto cartesiano entre la tabla cliente y municipio.
SELECT * FROM cliente, municipio;

-- 6. Añade a la sentencia del ejercicio anterior la condición WHERE necesaria para que 
-- sólo se muestren las filas con los clientes y el municipio al que pertenecen.
SELECT * FROM cliente, municipio
WHERE cliente.municipio = municipio.codigo;

-- 7. Modifica la sentencia anterior para obtener el número de clientes de cada municipio.
SELECT municipio.nombre, COUNT(cliente.codigo) AS numero_cliente FROM cliente, municipio
WHERE cliente.municipio = municipio.codigo
GROUP BY municipio.codigo;

-- 8. Escribe una sentencia que muestre el código de ticket, la fecha y el nombre del cliente.
-- Utiliza la sintaxis SQL 92 y SQL 99.
-- SINTAXIS SQL 92
SELECT * FROM ticket, cliente;

SELECT * FROM cliente, ticket
WHERE cliente.codigo = ticket.codigo;

SELECT cliente.nombre, ticket.fecha, ticket.codigo
FROM cliente, ticket
WHERE cliente.codigo = ticket.cliente;
-- transformación de 92 a 99
SELECT cliente.nombre, ticket.fecha, ticket.codigo
FROM cliente 
INNER JOIN ticket 
ON cliente.codigo = ticket.cliente;

-- SINTAXIS 99
SELECT * FROM cliente, ticket;

SELECT  * FROM cliente NATURAL JOIN ticket;

SELECT cliente.nombre, ticket.fecha, ticket.codigo
FROM cliente 
NATURAL JOIN ticket;

-- 9. Escribe una sentencia que muestre el código de ticket, el número de línea, la descripción del artículo    
-- y la cantidad de unidades vendidas en dicha línea para todas las líneas del ticket con código 7.
-- Utiliza la sintaxis SQL 92 y SQL 99.
-- SINTAXIS SQL 92
SELECT linea_ticket.ticket, linea_ticket.nlinea, articulo.descripcion, linea_ticket.cant 
FROM linea_ticket, articulo
WHERE linea_ticket.articulo = articulo.codigo AND linea_ticket.ticket = 7;

-- SINTAXIS SQL 99   
SELECT linea_ticket.ticket, linea_ticket.nlinea, articulo.descripcion, linea_ticket.cant 
FROM linea_ticket INNER JOIN articulo
ON linea_ticket.articulo = articulo.codigo WHERE linea_ticket.ticket = 7;

-- EJERCICIO INVENTADO DE JESÚS QUE NO SALE EN EL ENUNCIADO tabla nombre del cliente, vendedor y número de ticket
SELECT ticket.codigo, cliente.nombre AS cliente_nombre, vendedor.nombre AS vendedor_nombre 
FROM ticket, cliente, vendedor
WHERE ticket.cliente = cliente.codigo AND ticket.vendedor = vendedor.codigo;

-- EJERCICIO INVENTADO DE JESÚS QUE NO SALE EN EL ENUNCIADO obtener el código y fecha de ticket, número de linea y descripción articulo, 
-- de tickets del 2020 con un iva del 21%.
SELECT ticket.codigo, ticket.fecha, linea_ticket.nlinea, articulo.descripcion 
FROM linea_ticket 
INNER JOIN ticket ON linea_ticket.ticket = ticket.codigo
INNER JOIN articulo ON linea_ticket.articulo = articulo.codigo
WHERE ticket.fecha BETWEEN '2020-01-01' AND '2020-12-31' AND ticket.iva = 21;

-- 10. Escribe una sentencia que muestre el código y fecha de cada ticket junto al nombre del cliente y el nombre del vendedor. 
-- Utiliza la sintaxis SQL 92 y SQL 99.
-- SINTAXIS SQL 92
SELECT
ticket.codigo AS ticket,
ticket.fecha AS fecha,
cliente.nombre AS cliente,
vendedor.nombre AS vendedor
FROM cliente, ticket, vendedor
WHERE ticket.cliente = cliente.codigo AND ticket.vendedor = vendedor.codigo
ORDER BY ticket.codigo ASC;

-- SINTAXIS SQL 99
SELECT ticket.codigo, ticket.fecha, cliente.nombre AS cliente, vendedor.nombre AS vendedor
FROM ticket
INNER JOIN cliente ON ticket.cliente = cliente.codigo
INNER JOIN vendedor ON ticket.vendedor = vendedor.codigo;

-- 11. Escribe una sentencia que muestre el código y nombre de cada vendedor junto al número total de tickets en los que aparece. 
-- Utiliza la sintaxis SQL 92 y SQL 99.
-- SINTAXIS 92
SELECT vendedor.codigo AS codigo_vendedor, vendedor.nombre AS vendedor_nombre, COUNT(ticket.codigo) AS num_tickets
FROM vendedor, ticket
WHERE vendedor.codigo = ticket.vendedor
GROUP BY vendedor.codigo;

-- SINTASIX 99
SELECT
vendedor.codigo AS codigo_vendedor,
vendedor.nombre AS nombreo_vendedor,
COUNT(ticket.codigo) AS num_tickets
FROM vendedor
INNER JOIN ticket
ON vendedor.codigo = ticket.vendedor
GROUP BY vendedor.codigo;

-- 12. Escribe una sentencia que muestre el código y fecha de cada ticket, junto al nombre y dirección completa 
-- (calle, código postal, municipio y provincia) del cliente. Utiliza la sintaxis SQL 92 y SQL 99. 
-- SINTAXIS 92
SELECT ticket.codigo, ticket.fecha, cliente.nombre, cliente.direccion, cliente.cp, cliente.municipio, municipio.provincia
FROM ticket, cliente, municipio, provincia
WHERE ticket.cliente = cliente.codigo AND
cliente.municipio = municipio.codigo AND
municipio.provincia = provincia.codigo AND
municipio.provincia = provincia.codigo;

-- SINTAXIS 99 
SELECT ticket.codigo, ticket.fecha, cliente.nombre, cliente.direccion, cliente.cp, cliente.municipio, municipio.provincia
FROM ticket 
INNER JOIN cliente ON ticket.cliente = cliente.codigo
INNER JOIN municipio ON cliente.municipio =municipio.codigo
INNER JOIN provincia ON municipio.provincia = provincia.codigo
GROUP BY ticket.codigo;






