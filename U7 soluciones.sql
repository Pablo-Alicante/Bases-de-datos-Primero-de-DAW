USE comercio;
-- 1. Mostrar el precio más alto y bajo de todos los artículos.
SELECT * FROM articulo;
SELECT precio FROM articulo;
SELECT MAX(precio) AS'precio más alto', MIN(precio) AS 'precio más bajo' FROM articulo;

-- 2. Mostrar el precio medio de aquellos artículos cuyo stock es inferior a las 25 unidades.
SELECT * FROM articulo;
SELECT stock FROM articulo;
SELECT AVG(precio) AS 'precio medio' FROM articulo WHERE stock <25;

-- 3. Escribir una sentencia que obtenga el stock más alto de aquellos artículos cuyo precio es inferior a 1.5 euros.
SELECT * FROM articulo;
SELECT codigo, stock, precio FROM articulo;
SELECT MAX(stock) AS 'stock más alto' FROM articulo WHERE precio <1.5; 

-- 4. Obtener el número de artículos almacenados en la base de datos.
SELECT * FROM articulo;
SELECT COUNT(codigo) FROM articulo;

-- 5. Mostrar el precio medio de los artículos.
SELECT AVG(precio) AS 'precio medio' FROM articulo;

-- 6. Mostrar la cantidad de municipios de cada provincia.
SELECT provincia FROM municipio;
SELECT nombre, provincia FROM municipio;
SELECT provincia, COUNT(nombre) AS 'número de municipios' FROM municipio GROUP BY provincia;

-- 7. Mostrar el último código de municipio de cada provincia.
SELECT codigo, provincia FROM  municipio;
SELECT MAX(codigo), provincia FROM municipio GROUP BY provincia;

-- 8. Obtener la cantidad de tickets que hay por cada tipo de IVA.
SELECT * FROM ticket;
SELECT iva FROM ticket;
SELECT COUNT(codigo) AS cantidad_tickets, iva FROM ticket GROUP BY iva;

-- 9. Obtener la media de descuentos aplicados a cada cliente.
SELECT * FROM ticket;
SELECT cliente, AVG(dto) AS media_descuento FROM ticket WHERE cliente is NOT NULL GROUP BY cliente; 

-- 10. Obtén el código de aquellos clientes cuyo descuento medio aplicado en sus tickets es superior al 4%.
-- Considera solo los tickets cuyo código es superior a 25.
SELECT cliente, AVG(dto) AS media_descuento FROM ticket WHERE codigo > 25 AND cliente IS NOT NULL 
GROUP BY cliente HAVING media_descuento > 4;

-- 11. Obtén los tickets del año 2019.
SELECT * FROM ticket;
SELECT * FROM ticket WHERE fecha BETWEEN '2019/01/01' AND '2019/12/31';
SELECT * FROM ticket WHERE fecha LIKE '2019%'; -- Otra forma posible de resolver el ejercicio 11

-- 12. Obtén el código de los clientes con más de 2 tickets.
SELECT * FROM ticket;
SELECT cliente, COUNT(*) FROM ticket WHERE cliente IS NOT NULL GROUP BY cliente HAVING COUNT(*) >2;
SELECT cliente FROM ticket GROUP BY cliente HAVING COUNT(cliente) > 2; -- Otra forma de hacerlo

-- 13. Obtener tickets con código menor que 20.
SELECT * FROM ticket;
SELECT * FROM ticket WHERE codigo <20;

-- 14. Obtén el id de aquellos clientes que tienen algún ticket con IVA del 21%.
SELECT cliente FROM ticket WHERE iva=21 AND cliente IS NOT NULL GROUP BY cliente;
SELECT DISTINCT cliente FROM ticket WHERE iva=21 AND cliente IS NOT NULL; -- Otra forma de hacerlo
SELECT cliente FROM ticket WHERE cliente IS NOT NULL GROUP BY cliente HAVING MAX(iva) = 21; -- Otra formna de hacerlo más.

-- 15. Por cada artículo, obtén el descuento máximo aplicado en los tickets donde aparece.
 -- Considérense sólo los artículos cuyo código comienza por 'SEG'.
SELECT * FROM linea_ticket;
SELECT MAX(dto) FROM linea_ticket;
SELECT articulo FROM linea_ticket WHERE articulo LIKE 'SEG%';
SELECT articulo, MAX(dto) FROM linea_ticket WHERE articulo LIKE'SEG%' GROUP BY articulo;

-- 16. Obtén la cantidad media de artículos vendidos en los tickets con más de 2 líneas.
SELECT * FROM linea_ticket;
SELECT AVG(cant) FROM linea_ticket;
SELECT AVG(cant),nlinea FROM linea_ticket WHERE nlinea > 2 GROUP BY ticket;

-- 17. Obtener la nota más baja y más alta en la asignatura con código 13. ¿?¿?¿?
USE instituto;
SELECT * FROM matricula;
SELECT * FROM matricula WHERE asignatura = 13;
SELECT MAX(nota) FROM matricula WHERE asignatura = 13;
SELECT MIN(nota) FROM matricula WHERE asignatura = 13;

-- 18. Calcular la nota media de cada asignatura.
SELECT * FROM matricula;
SELECT asignatura, AVG(nota) FROM matricula GROUP BY asignatura;
-- 19. Obtén el mayor código de asignatura correspondiente al 1º curso. ¿?¿?¿?
SELECT * FROM ensenya;
-- 20. Obtén el año medio de incorporación de todos los profesores excepto los que comenzaron en 2013.
SELECT * FROM profesor;
SELECT AVG(anyoi) FROM profesor;
SELECT * FROM profesor WHERE anyoi > 2013;
SELECT AVG(anyoi) FROM profesor WHERE anyoi > 2013;
-- 21. Obtén la cantidad de alumnos matriculados en la asignatura con código 3.
SELECT * FROM matricula;
SELECT COUNT(asignatura = 3) FROM matricula;
-- 22. Obtén la cantidad de profesores que se incorporaron en el año 2014.
SELECT * FROM profesor;
SELECT COUNT(anyoi=2014) FROM profesor;
-- 23. Obtén la cantidad de notas diferentes obtenidas por los alumnos de la asignatura con código 1.
SELECT * FROM matricula;
SELECT nota FROM matricula GROUP BY nota;
SELECT asignatura = 1, nota FROM matricula GROUP BY nota;

-- 24. Obtén el DNI de cada alumno y la nota que ha obtenido en la asignatura con código 1
SELECT * FROM matricula;
SELECT alumno, nota, asignatura = 1 FROM matricula;

-- 25. Obtén la cantidad de alumnos matriculados por asignatura.
SELECT * FROM matricula;
SELECT COUNT(asignatura) FROM matricula;
SELECT COUNT(asignatura), asignatura FROM matricula GROUP BY asignatura;

-- 26. Muestra la nota más alta de cada asignatura.
SELECT * FROM matricula;
SELECT MAX(nota), asignatura FROM matricula GROUP BY asignatura;

-- 27. Obtener la nota media de aquellas asignaturas que tengan matriculados más de 10 alumnos. ¿?¿?¿?
SELECT * FROM matricula;
SELECT AVG(nota) FROM matricula;

USE citas;

-- 28. Contabiliza cuántos usuarios han dado cada una de las diferentes valoraciones de una cita (mal, regular, bien, muy bien). 
-- Ordena los resultados de forma que la valoración menos repetida se muestre primero.
SELECT * FROM encuesta;
SELECT COUNT(valoracion) FROM encuesta;
SELECT valoracion, COUNT(valoracion) FROM encuesta GROUP BY valoracion;

-- 29. Muestra aquellos nombres de usuario que han dado “Me gusta” a más de 2 personas. ¿?¿?¿?¿?¿?
SELECT * FROM gusta;
SELECT nom_usuario_1, nom_usuario_2 FROM gusta GROUP BY nom_usuario_2;

-- 30. Muestra el número de usuarios que practica una afición todas las semanas.
SELECT * FROM practica;
SELECT nom_usuario, frecuencia FROM practica;
SELECT COUNT(nom_usuario), frecuencia FROM practica GROUP BY frecuencia = 'todas las semanas' HAVING frecuencia ='todas las semanas';

-- 31. Muestra el número de mujeres que hay de cada religión.
SELECT * FROM perfil;
SELECT COUNT(sexo='M') FROM perfil GROUP BY religion;
SELECT COUNT(sexo='M'), religion FROM perfil GROUP BY religion; 

-- 32. Obtén el número de personas que no tienen trabajo. ¿?¿?¿?¿?
SELECT * FROM perfil;
SELECT COUNT(trabajo) FROM perfil WHERE trabajo IS NULL;

-- 33. Obtén el nombre de aquellos trabajos con más de un trabajador. ¿?¿?¿¿?
SELECT * FROM perfil;
SELECT * FROM perfil GROUP BY trabajo;
SELECT COUNT(trabajo) FROM perfil GROUP BY trabajo;
SELECT COUNT(trabajo), trabajo FROM perfil GROUP BY trabajo;
SELECT COUNT(trabajo), trabajo FROM perfil GROUP BY trabajo HAVING COUNT(*)>2;






