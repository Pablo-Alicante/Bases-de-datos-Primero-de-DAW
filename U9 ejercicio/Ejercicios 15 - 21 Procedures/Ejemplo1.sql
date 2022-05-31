-- Creamos el procedimiento de la suma
DELIMITER //
CREATE PROCEDURE Sumar(IN a INT, IN b INT, OUT c INT)
BEGIN
 SET c := a + b;
 SELECT c; -- Podemos hacer un SELECT sobre una variable para así poder ver su resultado
END//
DELIMITER ;

-- Podemos llamar a la función mediante CALL del siguiente modo
CALL Sumar(2,4,@mi_var); -- Como la llamada está fuera de un procedimiento la variable mi_var debe ir con @ delante
SELECT @mi_var; -- Mostramos el valor de mi_var, que será 6

-- El siguiente procedimiento llama al procedimiento sumar
DELIMITER //
CREATE PROCEDURE UsarSuma()
BEGIN
	DECLARE resultado INT;
	CALL Sumar(2,4,resultado); -- El resultado se almacena en la variable resultado
    SELECT resultado; -- Hacemos un SELECT sobre la variable para poder ver el resultado
END//
DELIMITER ;

CALL UsarSuma(); -- Llamamos al método UsarSuma para comprobar que funciona correctamente
