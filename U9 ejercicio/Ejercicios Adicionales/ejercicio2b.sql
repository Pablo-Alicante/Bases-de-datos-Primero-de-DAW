-- Crea un trigger para que, al modificar los años de experiencia de un empleado, se recalcule su salario. 
-- Deberá actualizarse también la suma total de salarios de la tabla departamento. 
-- Para evitar problemas utiliza un trigger BEFORE UPDATE.
DELIMITER $$
CREATE TRIGGER empleado_BI_trigger BEFORE UPDATE ON empleado FOR EACH ROW
BEGIN
	DECLARE nuevo_salario DECIMAL(10,2); -- Invento la variable nuevo_salario
    DECLARE var_salario DECIMAL (10,2); -- Invento la variable var_salario
	IF NEW.anyos_exp != OLD.anyos_exp THEN -- Si el nuevo dato es diferente al dato viejo entonces...
    -- Hago la consulta del salario base y lo guardo en var_salario lo saco pero no lo guardo en ninguna parte
    SELECT salario_base INTO var_salario FROM puesto WHERE puesto.id = NEW.puesto;	
    -- Con el SET guardo el dato que estoy consultando en el SELECT de la línea anterior
	SET nuevo_salario := var_salario + (NEW.anyos_exp * 50);
    -- Pongo el nuevo salario en la tabla
    SET NEW.salario := nuevo_salario;
    -- Actualizo la suma de salario del departameno
    UPDATE departamento SET suma_salarios = suma_salarios + (NEW.salario - OLD.salario)	WHERE id = NEW.departamento;
	END IF;
END$$
DELIMITER ;