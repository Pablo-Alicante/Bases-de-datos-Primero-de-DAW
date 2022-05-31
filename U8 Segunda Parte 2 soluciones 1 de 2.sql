USE comercio;

-- 13. Mostrar el código de ticket, fecha y nombre del cliente sin que se pierda ningún ticket, aunque su cliente sea NULL.
SELECT * FROM ticket INNER JOIN cliente ON ticket.cliente = cliente.codigo ORDER BY ticket.codigo ASC;
-- tienen que salir todos los tickets, incluso los que no tiene cliente asociado.
SELECT ticket.codigo, ticket.fecha, cliente.nombre 
FROM ticket LEFT JOIN cliente ON ticket.cliente = cliente.codigo;

-- tienen que salir todos los clientes incluso los que no tiene ticket asociado.
SELECT ticket.codigo, ticket.fecha, cliente.nombre
FROM cliente RIGHT JOIN ticket ON ticket.cliente = cliente.codigo;

-- 14. Mostrar el nombre y dirección de los clientes junto con el nombre de su municipio sin perder aquellos municipios que no tienen clientes.
SELECT cliente.nombre, cliente.direccion, municipio.nombre
FROM cliente RIGHT JOIN municipio ON cliente.municipio = municipio.codigo;

-- 15. Escribe una consulta que devuelva el código de ticket, línea, código y descripción del artículo para todas las líneas del ticket 108, 
-- aunque el código de artículo sea nulo.
SELECT * FROM linea_ticket INNER JOIN articulo ON linea_ticket.articulo = articulo.codigo;

SELECT * FROM linea_ticket LEFT JOIN articulo ON linea_ticket.articulo = articulo.codigo;

SELECT linea_ticket.ticket, linea_ticket.nlinea, articulo.codigo, articulo.descripcion 
FROM linea_ticket LEFT JOIN articulo ON linea_ticket.articulo = articulo.codigo
WHERE linea_ticket.ticket = 108;

-- 16. Si has resuelto la sentencia anterior con RIGHT JOIN, resuélvela con LEFT JOIN. 
-- Si la has resuelto con LEFT JOIN, resuélvela con RIGHT JOIN.
SELECT linea_ticket.ticket, linea_ticket.nlinea, articulo.codigo, articulo.descripcion 
FROM articulo RIGHT JOIN linea_ticket ON linea_ticket.articulo = articulo.codigo
WHERE linea_ticket.ticket = 108;

-- 17. Mostrar el nombre de cada municipio y el número de clientes residiendo en cada uno de ellos. 
-- Los municipios que no tienen ningún cliente no aparecerán.
SELECT * FROM municipio, cliente;
SELECT * FROM municipio INNER JOIN cliente ON municipio.codigo = cliente.municipio;
SELECT municipio.nombre AS municipio, COUNT(cliente.codigo) AS num_clientes
FROM municipio INNER JOIN cliente ON municipio.codigo = cliente.municipio
GROUP BY municipio.codigo;

-- 18. Mostrar el nombre de cada municipio y el número de clientes residiendo en cada uno de ellos. 
-- Los municipios que no tienen ningún cliente también aparecerán.
SELECT municipio.nombre AS municipio, COUNT(cliente.codigo) AS num_clientes
FROM municipio LEFT JOIN cliente ON municipio.codigo = cliente.municipio
GROUP BY municipio.codigo;

-- 19. Escribe una consulta que devuelva el código y fecha de cada ticket junto 
-- al nombre del vendedor que realizó la venta y el nombre del cliente destinatario del ticket. 
-- No se debe perder ningún ticket aunque no tenga código de vendedor o código de cliente.
SELECT * FROM ticket 
INNER JOIN vendedor ON ticket.vendedor = vendedor.codigo
INNER JOIN cliente ON ticket.cliente = cliente.codigo;

SELECT ticket.codigo, ticket.fecha, vendedor.nombre AS vendedor, cliente.nombre AS cliente 
FROM ticket 
LEFT JOIN vendedor ON ticket.vendedor = vendedor.codigo
LEFT JOIN cliente ON ticket.cliente = cliente.codigo;

-- 20. Obtén el nombre de los clientes y el número de tickets en los que aparece cada uno.
-- También se mostrará el nombre de los clientes que no aparecen en ningún ticket.
