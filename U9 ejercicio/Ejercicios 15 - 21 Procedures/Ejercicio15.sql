-- Ejercicio 15. Crea un procedimiento que tenga como parámetro de entrada un número real y como parámetro de salida una
-- cadena de caracteres. El parámetro de salida indicará si el número es positivo, negativo o cero.

DROP PROCEDURE IF EXISTS ejercicio15;

DELIMITER //
CREATE PROCEDURE ejercicio15 (IN num REAL, OUT signo VARCHAR(20))
BEGIN
	IF (num > 0) THEN
		SET signo := 'Positivo';
	ELSEIF (num < 0) THEN
		SET signo := 'Negativo';
	ELSE
		SET signo := 'Cero';
	END IF;
END//
DELIMITER ;

-- Llamamos el procedimiento pasándole un 5
CALL ejercicio15(5,@signo); -- Como la llamada está fuera de un procedimiento la variable mi_var debe ir con @ delante
SELECT @signo; -- Mostramos el valor de signo, que será "positivo"


