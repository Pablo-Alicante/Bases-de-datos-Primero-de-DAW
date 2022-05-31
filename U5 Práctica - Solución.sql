-- COMERCIO

-- Obtén el número total de tickets en los que el cliente y el vendedor son del mismo municipio.
SELECT COUNT(*) FROM ticket INNER JOIN cliente ON ticket.cliente = cliente.codigo
					 INNER JOIN vendedor ON ticket.vendedor = vendedor.codigo
                     WHERE vendedor.municipio = cliente.municipio;

-- Obtén el código de aquellos tickets con cliente cuyo importe total (sin aplicar descuentos ni iva) sea superior a 50€.
SELECT ticket.codigo FROM ticket INNER JOIN linea_ticket ON linea_ticket.ticket = ticket.codigo 
			WHERE ticket.cliente IS NOT NULL GROUP BY ticket.cliente HAVING SUM(linea_ticket.cant * linea_ticket.precio) > 50;


-- CITAS

-- Obtén el nombre completo (nombre y apellidos) de aquellos usuarios a los que les gusta algún usuario que practique alguna afición a diario.
SELECT usuario.nombre FROM usuario INNER JOIN gusta ON gusta.nom_usuario_1 = usuario.nom_usuario
												  INNER JOIN practica ON gusta.nom_usuario_2 = practica.nom_usuario 
												  WHERE practica.frecuencia = "a diario" GROUP BY gusta.nom_usuario_1;

-- Obtén el nombre de aquellos usuarios a los que no les gusta ningún usuario.
SELECT usuario.nombre FROM usuario LEFT JOIN gusta ON usuario.nom_usuario = gusta.nom_usuario_1 WHERE gusta.nom_usuario_2 IS NULL;

-- INSTITUTO

-- Obtén la diferencia entre la nota más alta y la nota más baja que ha obtenido cada alumno.
SELECT alumno, MAX(nota) - MIN(NOTA) FROM matricula GROUP BY alumno;
