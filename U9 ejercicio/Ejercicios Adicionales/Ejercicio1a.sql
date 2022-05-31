-- Se pide crear un trigger de forma que al insertar un alumno se actualice el número de alumnos en la tabla grupo.
DELIMITER $;
CREATE TRIGGER ejercicio1a AFTER INSERT ON alumno FOR EACH ROW
BEGIN
-- declaro la variable numero_alumnos que es de tipo entero
	DECLARE numero_alumnos INT;
--  en la tabla alumno, voy a contar los alumnos de la tabla alumnos que pertenezcan al grupo del alumno insertado.
-- Inserto el dato en la variable numero_alumnos.
    SELECT COUNT(*) INTO numero_alumnos FROM alumno WHERE grupo = NEW.grupo;
-- con el SET actualizo el valor de la columna num_alumnos con el dato de la variable numero_alumnos 
-- y actualizo con el UPDATE la tabla grupo
-- Actualizamos la tabla grupo: asignamos el valor calculado en la variable numero_alumnos en la columna num_alumnos. 
-- Sólo actualizamos la fila cuyo id de grupo (id) sea igual al id de grupo del alumno insertado (New.grupo)
    UPDATE grupo SET num_alumnos = numero_alumnos WHERE id = NEW.grupo;
END$
DELIMITER ;






