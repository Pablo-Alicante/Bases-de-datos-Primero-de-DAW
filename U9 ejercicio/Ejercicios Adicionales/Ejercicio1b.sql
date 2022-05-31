-- Se pide crear un trigger de forma que al eliminar un alumno se actualice el número de alumnos en la tabla grupo.
USE grupos_alumnos;
DROP TRIGGER IF EXISTS ejercicio1b;
DELIMITER $
CREATE TRIGGER ejercicio1b 
AFTER DELETE ON alumno FOR EACH ROW
BEGIN
-- declaro la variable numero_alumnos
	DECLARE numero_alumnos INT;
--  en la tabla alumno, voy a contar los alumnos de la tabla alumnos que pertenezcan al grupo del alumno borrado.
-- Inserto el dato en la variable numero_alumnos.
    SELECT COUNT(*) INTO numero_alumnos FROM alumno WHERE grupo = OLD.grupo;
-- actualizo el dato de num_alumnos de la tabla grupo del grupo del alumno eliminado.
    UPDATE grupo SET num_alumnos = numero_alumnos WHERE id = OLD.grupo;
END$
DELIMITER ;