-- Crea una función que reciba como parámetro dos marcas, 
-- la función devolverá el identificador de aquella marca con el producto más caro. 
-- En caso de empate se devolverá cualquiera de los dos identificadores.
-- un parametro es una variable de entrada de una función o un procedimiento.
DELIMITER //
CREATE FUNCTION ejercicio4_productos(marca1 BIGINT, marca2 BIGINT) RETURNS INT NOT DETERMINISTIC
BEGIN
DECLARE maxPrecio1 DECIMAL(10,2);
DECLARE maxPrecio2 DECIMAL (10,2);
-- busco el maximo del precio más alto de la marca1
SELECT MAX(precio) INTO maxPrecio1 FROM productos WHERE marca_id = marca1;
-- busco el maximo del precio más alto de la marca2
SELECT MAX(precio) INTO maxPrecio2 FROM productos WHERE marca_id= marca2;
-- Hago la comparación gracias al IF
-- y si el identificador de la primera es mayor que el segundo
IF (maxPrecio1 > maxPrecio2) THEN
-- devuelvo la primera marca
	RETURN marca1;
-- en caso contrario, devuelvo el segundo
ELSE -- en caso de empate, devuelvo marca1 porque me apetece a mi y por no meter un random que no sabemos hacer
	RETURN marca2;
END IF;
END//
DELIMITER ;