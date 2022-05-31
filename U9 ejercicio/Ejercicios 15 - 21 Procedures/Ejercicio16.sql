-- Ejercicio 16. Escribe un procedimiento que reciba como entrada la nota de un alumno (numérico real) y un parámetro de salida 
-- (cadena de caracteres) con las siguientes condiciones: [0, 5): Insuficiente / [5, 6): Aprobado / [6, 7): Bien / [7, 9): Notable
-- [9, 10]: Sobresaliente / En cualquier otro caso la nota no será válida.

DROP PROCEDURE IF EXISTS ejercicio16;

DELIMITER //
CREATE PROCEDURE ejercicio16 (IN nota INT, OUT descripcion VARCHAR(20))
BEGIN
	IF (nota < 0 OR nota > 10) THEN
		SET descripcion := 'Nota inválida';
	ELSEIF (nota < 5) THEN
		SET descripcion := 'Insuficiente';
	ELSEIF (nota < 6) THEN
		SET descripcion := 'Aprobado';
	ELSEIF (nota < 7) THEN
		SET descripcion := 'Bien';
	ELSEIF (nota < 9) THEN
		SET descripcion := 'Notable';
	ELSEIF (nota <= 10) THEN
		SET descripcion := 'Sobresaliente';
	END IF;

END//
DELIMITER ;

CALL ejercicio16(10,@nota);
SELECT @nota;