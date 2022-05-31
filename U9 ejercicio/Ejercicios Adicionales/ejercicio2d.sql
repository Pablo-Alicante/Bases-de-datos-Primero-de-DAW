-- Crea un trigger para que al modificar el salario base de un puesto de trabajo, 
-- se recalcule el sueldo de todos los empleados con ese puesto. 
-- También habrá que recalcular la suma total de la tabla departamento.
DROP TRIGGER IF EXISTS ejer_adic_2d;
DELIMITER //
CREATE TRIGGER ejer_adic_2d AFTER UPDATE ON puesto FOR EACH ROW
BEGIN
-- Este trigger se ejecutará tras la modificación de alguna fila de la tabla puesto
    -- Solo haremos cosas si el valor modificado es el salario base
    IF (NEW.salario_base != OLD.salario_base) THEN
-- Si entramos en el if es que el salario base de alguno de los puestos se ha modificado
        -- Lo primero que haremos será recalcular el salario de los empleados cuyo puesto sea el mismo que el puesto modificado
-- actualiza la columna salario de la tabla empleado, teniendo en cuenta el nuevo salario base teniendo en cuenta el puesto del empleado
        UPDATE empleado SET salario = NEW.salario_base + (anyos_exp * 50) WHERE puesto = NEW.id;
        -- Por último recalcularemos la suma de los salarios de la tabla departamento
        -- El problema es que tenemos que recalcularlo para todos los departamentos, porque puede que los empleados a los que hemos cambiado el salario pertenezcan a diferentes departamentos
        UPDATE departamento SET suma_salarios = (SELECT SUM(salario) FROM empleado WHERE departamento = departamento.id); -- Aquí está la subconsulta, un SELECT dentro de un UPDATE
    END IF;
-- Obtenemos los empleados con el puesto
END//
DELIMITER ;
