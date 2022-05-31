-- Crea un trigger para que al borrar un empleado se actualice la suma total de la tabla departamento.
DELIMITER $$
CREATE TRIGGER ejercicio2c AFTER DELETE ON empleado FOR EACH ROW
BEGIN
-- actualizo la suma de salarios del departamento del empleado borrado, restando el salario del empleado borrado
	UPDATE departamento SET suma_salarios = suma_salarios - OLD.salario
	WHERE id = OLD.departamento;
END$$
DELIMITER ;

-- Otra forma de hacerlo
DELIMITER $$
CREATE TRIGGER ejercicio2c AFTER DELETE ON empleado FOR EACH ROW
BEGIN
	DECLARE total DECIMAL (10,2);
-- en la tabla empleado, sumo todos los salarios del departamento del empleado borrado y ese dato lo recojo en la variable total
	SELECT SUM(salario) INTO total FROM empleado WHERE departamento = OLD.departamento;
-- actualizo el dato de la suma de salarios del departamento del empleado borrado
    UPDATE departamento SET suma_salarios = total WHERE id = OLD.departamento;
END$$
DELIMITER ;









