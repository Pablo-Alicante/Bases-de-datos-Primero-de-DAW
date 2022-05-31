-- Ejercicio 26. Escribe una función para la base de datos Q3ERP que devuelva el número total de productos que hay en la tabla productos

DROP FUNCTION IF EXISTS ejercicio26;

-- Para no obtener el siguiente error al intentar crear una función:
-- This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)	0.000 sec
-- Tenemos varias opciones
-- a) Añadir antes de la cláusula BEGIN la cláusula DETERMINISTIC
-- b) Ejecutar el comando SET GLOBAL log_bin_trust_function_creators = 1;
-- En los ejercicios optaré por la primera opción

DELIMITER //

CREATE FUNCTION ejercicio26 () RETURNS INT DETERMINISTIC
BEGIN
	DECLARE num_productos INT;
    -- En una SELECT podemos hacer uso de la cláusula INTO para almacenar el valor obtenido en una variable
	SELECT COUNT(*) INTO num_productos FROM productos;
    RETURN num_productos;
END//

DELIMITER ;

-- Probamos la función
SELECT ejercicio26();