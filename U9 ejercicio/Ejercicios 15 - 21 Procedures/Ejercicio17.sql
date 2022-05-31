-- Ejercicio 17. Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.

DROP PROCEDURE IF EXISTS ejercicio17;

DELIMITER //
CREATE PROCEDURE ejercicio17 (IN nota INT, OUT descripcion VARCHAR(20))
BEGIN
	CASE 
		WHEN (nota < 0 OR nota > 10) THEN
			SET descripcion := 'Nota inválida';
		WHEN (nota < 5) THEN
			SET descripcion := 'Insuficiente';
		WHEN (nota < 6) THEN
			SET descripcion := 'Aprobado';
		WHEN (nota < 7) THEN
			SET descripcion := 'Bien';
		WHEN (nota < 9) THEN
			SET descripcion := 'Notable';
		WHEN (nota <= 10) THEN
			SET descripcion := 'Sobresaliente';
		ELSE
			SET descripcion := 'Nota inválida';
	END CASE;

END//
DELIMITER ;

CALL ejercicio17(3,@nota);
SELECT @nota;