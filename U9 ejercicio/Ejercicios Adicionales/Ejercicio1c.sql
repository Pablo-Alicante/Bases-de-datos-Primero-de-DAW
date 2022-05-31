-- Se pide crear un trigger de forma que al modificar el grupo de un alumno se actualice el número de alumnos en la tabla grupo.
USE grupos_alumnos;
DROP TRIGGER IF EXISTS ejercicio1c;
DELIMITER $
CREATE TRIGGER ejercicio1c
AFTER UPDATE ON alumno FOR EACH ROW
BEGIN
-- creo un dato, que es lo mismo que declarar una variable
	DECLARE numero_alumnos_nuevo INT;
    DECLARE numero_alumnos_viejo INT;
-- en la tabla alumno cuento el numero de alumnos del grupo nuevo del alumno actualizado y ese dato lo recojo en la variable numero_alumnos_nuevo
-- ejemplo: estoy sacando un alumno del grupo 1 y lo meto en el grupo 2. Aquí recojo en cambio en el grupo 2
    SELECT COUNT(*) INTO numero_alumnos_nuevo FROM alumno WHERE grupo = NEW.grupo;
-- si el grupo del alumno ha cambiado.
    IF (NEW.grupo != OLD.grupo) THEN
-- en la tabla alumno cuento el numero de alumnos del grupo antiguo de alumno actualizado y ese dato lo recojo en la variable numero_alumnos_viejo
-- ejemplo: estoy sacando un alumno del grupo 1 y lo meto en el grupo 2. Aquí recojo en cambio en el grupo 1
		SELECT COUNT(*) INTO numero_alumnos_viejo FROM alumno WHERE grupo = OLD.grupo;
	-- actualizo la columna del grupo nuevo
        UPDATE grupo SET num_alumnos = numero_alumnos_nuevo WHERE id = NEW.grupo;
	-- actualizo la columna del grupo antiguo
		UPDATE grupo SET num_alumnos = numero_alumnos_viejo WHERE id = OLD.grupo;
    END IF; 
END$
DELIMITER ;