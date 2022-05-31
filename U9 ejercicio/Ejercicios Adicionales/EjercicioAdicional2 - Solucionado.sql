-- Apartado a
DELIMITER //
CREATE TRIGGER ejer_adic_2a BEFORE INSERT ON empleado FOR EACH ROW
BEGIN
    DECLARE salario_b DECIMAL(10,2);
    -- En primer lugar obtenemos el salario base correspondinte al puesto de trabajo del empleado que se va a introducir
    SELECT salario_base INTO salario_b FROM puesto WHERE id = NEW.puesto;
    
    -- A partir del salario base, realizamos el cálculo para obtener el salario.
    -- El resultado lo almacenamos en NEW.salario
    -- Hay que tener en cuenta que cuando se finaliza la ejecución del trigger lo que se insertará en la tabla empleados será lo que haya en la variable NEW,
    -- por eso el cálculo del salario lo guardamos en NEW.salario.
    SET NEW.salario := salario_b + (NEW.anyos_exp * 50);

    -- Por último actualizamos la tabla departamento para añadir el salario del nuevo empleado al total
    UPDATE departamento SET suma_salarios = suma_salarios + NEW.salario WHERE id = NEW.departamento;
END//
DELIMITER ;

-- Apartado b
DROP TRIGGER IF EXISTS ejer_adic_2b;
DELIMITER //
CREATE TRIGGER ejer_adic_2b BEFORE UPDATE ON empleado FOR EACH ROW
BEGIN
    DECLARE salario_b DECIMAL(10,2);
    DECLARE sum_salario DECIMAL(10,2);
    
    -- Comprobamos si se han cambiado los años de experiencia
    IF (NEW.anyos_exp != OLD.anyos_exp) THEN
		-- Efectivamente se han modificado los años de experiencia
		
		-- En primer lugar obtenemos el salario base correspondiente al puesto de trabajo del empleado que se va a modificar
		SELECT salario_base INTO salario_b FROM puesto WHERE id = NEW.puesto;
		
		-- A partir del salario base, realizamos el cálculo para obtener el salario y el resultado lo almacenamos en NEW.salario
		-- Hay que tener en cuenta que cuando se finaliza la ejecución del trigger lo que se actualizará en la tabla empleados será lo que haya en la variable NEW,
		-- por eso el cálculo del salario lo guardamos en NEW.salario.

		SET NEW.salario := salario_b + (NEW.anyos_exp * 50); -- Nuevo salario teniendo en cuenta los nuevos años de experiencia
		
		-- Recordad que NEW.anyos_exp contiene los años de experiencia que tendrá el empleado
		-- tras la actualización. OLD.anyos_exp tiene los años de experiencia que tenía el
		-- empleado antes de modificarse.

		-- Ahora hay que actualizar la suma total de salarios del departamento
        -- Podríamos hacer un UPDATE con SUM para sumar los salarios de todos los empleados de un departamento, el problema es que la suma incluiría el salario antiguo del empleado que se va a modificar
        
        -- Una manera más sencilla de resolverlo es como sigue:
        
		-- En primer lugar obtenemos la suma total de salarios del departamento al que pertenece el empleado
        SELECT suma_salarios INTO sum_salario FROM departamento WHERE id = NEW.departamento;
        
        -- Al total le restamos el salario antiguo y le sumamos el nuevo
        SET sum_salario := sum_salario - OLD.salario + NEW.salario;
        
        -- Actualizamos el departamento con el nuevo total
		UPDATE departamento SET suma_salarios = sum_salario WHERE id = NEW.departamento;
    END IF;
END//
DELIMITER ;

-- Apartado c

DROP TRIGGER IF EXISTS ejer_adic_2c;
DELIMITER //
CREATE TRIGGER ejer_adic_2c AFTER DELETE ON empleado FOR EACH ROW
BEGIN
    -- Recordad en un trigger de tipo DELETE solo disponemos de la variable OLD.
    -- En ella se guarda los datos del empleado eliminado
    -- Modificamos la suma de salarios del departamento correspondiente para restarle el salario del empleado eliminado
	UPDATE departamento SET suma_salarios = suma_salarios - OLD.salario WHERE id = OLD.departamento;
END//
DELIMITER ;

-- Apartado d
-- Ojo! Se ha resuelto con subconsultas, esto no entra para examen
DROP TRIGGER IF EXISTS ejer_adic_2d;
DELIMITER //
CREATE TRIGGER ejer_adic_2d AFTER UPDATE ON puesto FOR EACH ROW
BEGIN
	-- Este trigger se ejecutará tras la modificación de alguna fila de la tabla puesto
    -- Solo haremos cosas si el valor modificado es el salario base
    IF (NEW.salario_base != OLD.salario_base) THEN
		-- Si entramos en el if es que el salario base de alguno de los puestos se ha modificado
        -- Lo primero que haremos será recalcular el salario de los empleados cuyo puesto sea el mismo que el puesto modificado
        UPDATE empleado SET salario = NEW.salario_base + (anyos_exp * 50) WHERE puesto = NEW.id;
        -- Por último recalcularemos la suma de los salarios de la tabla departamento
        -- El problema es que tenemos que recalcularlo para todos los departamentos, porque puede que los empleados a los que hemos cambiado el salario pertenezcan a diferentes departamentos
        UPDATE departamento d SET suma_salarios = (SELECT SUM(salario) FROM empleado WHERE departamento = d.id); -- Aquí está la subconsulta, un SELECT dentro de un UPDATE
        
    END IF;
    
	-- Obtenemos los empleados con el puesto
END//
DELIMITER ;