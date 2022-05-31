-- Ejercicio 22. Crea una función que tenga como parámetro de entrada un número real y devuelva una cadena de caracteres indicando si el número es positivo, negativo o cero.

DROP FUNCTION IF EXISTS ejercicio22;

-- Para no obtener el siguiente error al intentar crear una función:
-- This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)	0.000 sec
-- Tenemos varias opciones
-- a) Añadir antes de la cláusula BEGIN la cláusula DETERMINISTIC
-- b) Ejecutar el comando SET GLOBAL log_bin_trust_function_creators = 1;
-- En los ejercicios optaré por la primera opción

DELIMITER //
CREATE FUNCTION ejercicio22 (num REAL) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE signo VARCHAR(50);
    IF (num > 0) THEN
		SET signo := 'Positivo';
	ELSEIF (num < 0) THEN
		SET signo := 'Negativo';
	ELSE
		SET signo := 'Cero';
	END IF;
    
    RETURN signo;
END//

DELIMITER ;

-- Lo bueno de las funciones es que podemos utilizarlas en una SELECT de la siguiente forma
SELECT ejercicio22(4);

-- Otro ejemplo, esta vez consultando la tabla productos (debeis insertar tener algún producto en la base de datos para ver algún resultado)
SELECT precio, ejercicio22(precio) AS signo FROM productos;