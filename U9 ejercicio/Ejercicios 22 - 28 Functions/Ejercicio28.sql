-- Ejercicio 28. Escribe una función para la base de datos Q3ERP que devuelva el valor mínimo del precio de los
-- productos de una determinada marca que se recibirá como parámetro de entrada.
-- Parámetro de entrada: marca => el identificador
-- Parámetro de salida: el precio mínimo de los productos de la marca

DELIMITER //

CREATE FUNCTION ejercicio28 (id_marca BIGINT) RETURNS DECIMAL (10,2) DETERMINISTIC
BEGIN
	DECLARE val_min DECIMAL(10,2);
	SELECT MIN(precio) INTO val_min FROM productos WHERE marca_id = id_marca;
    RETURN val_min;
END//

DELIMITER ;

SELECT ejercicio28(1);