-- Ejercicio 23. Crea una función que devuelva la raíz cuadrada de un valor real introducido como parámetro. Si la no se calcular la 
-- raíz cuadrada devolverá -1.

DROP FUNCTION IF EXISTS raiz;

-- Para no obtener el siguiente error al intentar crear una función:
-- This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)	0.000 sec
-- Tenemos varias opciones
-- a) Añadir antes de la cláusula BEGIN la cláusula DETERMINISTIC
-- b) Ejecutar el comando SET GLOBAL log_bin_trust_function_creators = 1;
-- En los ejercicios optaré por la primera opción

DELIMITER //
CREATE FUNCTION raiz (num REAL) RETURNS REAL DETERMINISTIC
BEGIN
	DECLARE res REAL;
    SET res := SQRT(num);
    IF res IS NULL THEN
		SET res := -1;
    END IF;
    RETURN res;
END//

DELIMITER ;

SELECT raiz(-5);