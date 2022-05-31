DROP PROCEDURE IF EXISTS  ejercicio18;
DELIMITER //
CREATE PROCEDURE ejercicio18 (IN num INT, OUT dia VARCHAR(20))
BEGIN
	IF(num = 1) THEN SET dia := 'Lunes';
    ELSEIF(num = 2) THEN SET dia :='Martes';
    ELSEIF(num = 3) THEN SET dia := 'Miercoles';
    ELSEIF(num = 4) THEN SET dia :='Jueves';
    ELSEIF(num = 5) THEN SET dia :='Viernes';
    ELSEIF(num = 6) THEN SET dia :='Sabado';
    ELSEIF (num = 7) THEN SET dia :='Domingo';
    END IF;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS  ejercicio18b;
DELIMITER //
CREATE PROCEDURE ejercicio18b (IN num INT)
BEGIN
	DECLARE dia VARCHAR(20);
	IF(num = 1) THEN SET dia := 'Lunes';
    ELSEIF(num = 2) THEN SET dia :='Martes';
    ELSEIF(num = 3) THEN SET dia := 'Miercoles';
    ELSEIF(num = 4) THEN SET dia :='Jueves';
    ELSEIF(num = 5) THEN SET dia :='Viernes';
    ELSEIF(num = 6) THEN SET dia :='Sabado';
    ELSEIF (num = 7) THEN SET dia :='Domingo';
    END IF;
    SELECT dia;
END//
DELIMITER ;


-- Intento con CASE
DROP PROCEDURE IF EXISTS  ejercicio18case;
DELIMITER //
CREATE PROCEDURE ejercicio18case (IN num INT, OUT dia VARCHAR(20))
BEGIN
	CASE
	WHEN (num = 1) THEN SET dia := 'Lunes';
    WHEN (num = 2) THEN SET dia :='Martes';
    WHEN (num = 3) THEN SET dia := 'Miercoles';
    WHEN (num = 4) THEN SET dia :='Jueves';
    WHEN (num = 5) THEN SET dia :='Viernes';
    WHEN (num = 6) THEN SET dia :='Sabado';
    WHEN (num = 7) THEN SET dia :='Domingo';
    END CASE;
END//
DELIMITER ;









