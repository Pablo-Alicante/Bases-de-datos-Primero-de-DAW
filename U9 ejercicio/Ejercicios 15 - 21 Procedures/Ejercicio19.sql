-- Ejercicio 19. Crea una tabla llamada Fibonacci. Inserta los 50 primeros términos de la serie mediante un procedimiento 
-- almacenado. Utiliza la instrucción REPEAT.

-- Para quien no conozca la secuencia de Fibonacci:
-- Es una sucesión que comienza con los números 0 y 1. A partir de estos, «cada término es la suma de los dos anteriores»

-- Creamos la tabla, se ha elegido el tipo BIGINT porque los números que tendremos que almacenar superan el límite de INT que es 2147483647

DROP TABLE IF EXISTS fibonacci;
CREATE TABLE IF NOT EXISTS fibonacci (
	numeros BIGINT
);

-- Eliminamos las filas que pudiesen existir de pruebas anteriores
DELETE FROM fibonacci;

DROP PROCEDURE IF EXISTS ejercicio19;

DELIMITER //
CREATE PROCEDURE ejercicio19 ()
BEGIN
	DECLARE contador INT;
	DECLARE valor_penultimo BIGINT; -- Almacena el penúltimo valor calculado de la secuencia
	DECLARE valor_ultimo BIGINT; -- Almacena el último valor calculado de la secuencia
	DECLARE valor_actual BIGINT; -- Almacena el valor actual de la secuencia
    
    SET contador := 0; -- Cuántos números hemos contado
    
    SET valor_penultimo := 0;
    SET valor_ultimo := 0;
    SET valor_actual := 0;
    
	REPEAT
		SET valor_actual := valor_ultimo + valor_penultimo; -- En la secuencia de Fibonacci «cada término es la suma de los dos anteriores», por eso el valor que calculamos es la suma del valor último y del penúltimo
		INSERT INTO fibonacci VALUES(valor_actual); -- Lo almacenamos
        
        IF valor_actual = 0 THEN
			-- Si el resultado de obtener el valor actual es 0 significa que es el primer valor que hemos calculado, el siguiente debería ser un 1
			SET valor_penultimo := 1; -- Para conseguirlo guardamos un 1 en el valor penúltimo, de esa forma, en la próxima iteración 0 (valor último) + 1 (valor penúltimo) resultará ser 1.
		ELSE 
			-- En caso contrario "desplazamos" los números, de forma que el último pasa a ser el penúltimo y el actual pasa a ser el último
			SET valor_penultimo := valor_ultimo;
			SET valor_ultimo := valor_actual;
		END IF;
        
		SET contador := contador + 1;
    UNTIL contador = 50
    END REPEAT;
END //
DELIMITER ;

-- Llamamos a la función
CALL ejercicio19();

-- Comprobamos que se han insertado los valores correctamente
SELECT * FROM fibonacci;