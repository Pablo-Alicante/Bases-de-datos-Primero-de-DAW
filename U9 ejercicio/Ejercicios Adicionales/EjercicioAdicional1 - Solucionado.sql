-- Apartado a

DROP TRIGGER IF EXISTS alumno_AI_trigger;

DELIMITER //
CREATE TRIGGER alumno_AI_trigger AFTER INSERT ON alumno FOR EACH ROW
BEGIN
    UPDATE grupo SET num_alumnos = num_alumnos + 1 WHERE id = NEW.grupo;
END//
DELIMITER ;

/*

-- Esta es otra forma de resolverlo, pero tiene el inconveniente de que cada vez que se
-- inserta un alumno es necesario contar los alumnos del grupo, por lo que es menos eficiente.

DROP TRIGGER IF EXISTS alumno_AI_trigger;

DELIMITER //
CREATE TRIGGER alumno_AI_trigger AFTER INSERT ON alumno FOR EACH ROW
BEGIN
	DECLARE total_alumnos INT DEFAULT 0;
    SELECT COUNT(*) INTO total_alumnos FROM alumno WHERE grupo = NEW.grupo;
    UPDATE grupo SET num_alumnos = total_alumnos;
END//

DELIMITER ;*/

-- Apartado b

DROP TRIGGER IF EXISTS alumno_AD_trigger;

DELIMITER //
CREATE TRIGGER alumno_AD_trigger AFTER DELETE ON alumno FOR EACH ROW
BEGIN
    UPDATE grupo SET num_alumnos = num_alumnos - 1 WHERE id = OLD.grupo;
END//
DELIMITER ;

-- Apartado c

DROP TRIGGER IF EXISTS alumno_AU_trigger;

DELIMITER //
CREATE TRIGGER alumno_AU_trigger AFTER UPDATE ON alumno FOR EACH ROW
BEGIN
	IF (OLD.grupo != NEW.grupo) THEN
		UPDATE grupo SET num_alumnos = num_alumnos + 1 WHERE id = NEW.grupo;
		UPDATE grupo SET num_alumnos = num_alumnos - 1 WHERE id = OLD.grupo;
    END IF;
END//
DELIMITER ;

-- Sentencias para comprobar que los triggers funcionan correctamente
-- Al insertar a Paquita y Juanito, el número de alumnos del grupo de pollitos debería ser 2
INSERT INTO alumno VALUES ('200', 'Juanito', 1);
INSERT INTO alumno VALUES ('300', 'Paquita', 1);
SELECT * FROM grupo;

-- Al eliminar a Juanito el número de alumnos del grupo pollitos debería ser 1
DELETE FROM alumno WHERE dni = '200';
SELECT * FROM grupo;

-- Al cambiar el grupo de Paquita, pollitos tendrá 1 alumno y tortuguitas también 1
UPDATE alumno SET grupo = 2 WHERE dni = '300';
SELECT * FROM grupo;


