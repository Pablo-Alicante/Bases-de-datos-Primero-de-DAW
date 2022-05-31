-- Crea un trigger para que cada vez que se inserte un empleado 
-- se calcule automáticamente su salario según la formula indicada anteriormente: 
-- salario = salario base de su puesto + (anyos de experiencia * 50). 
-- El disparador también debe actualizar la suma total de salarios de la tabla departamento. 
-- Para evitar problemas utiliza un trigger BEFORE INSERT.

USE empresa2;
DROP TRIGGER IF EXISTS B_I_empleado_incrementa_salario;
DELIMITER $
CREATE TRIGGER B_I_empleado_incrementa_salario BEFORE INSERT ON empleado FOR EACH ROW
BEGIN
-- voy a necesitar dos datos, el salario del empleado nuevo insertado y el del departamento
	DECLARE salario DECIMAL(10,2);
    DECLARE salario_departamento_acumulado DECIMAL (10,2);
-- calculo el salario del empleado en base al número de años que lleva y teniendo en cuenta el puesto/departamento
SELECT salario_base + (NEW.anyos_exp *50)
INTO salario
FROM puesto
WHERE id=NEW.puesto;
-- el salario calculado en la SELECT anterior, lo recojo en la variable salario del empleado que vamos a insertar
SET NEW.salario = salario;
-- sumo todos los salarios del departamento del nuevo empleado y además sumo el salario del nuevo empleado.
-- ese dato lo vuelvo en la variable salario_departamento_acumulado
SELECT IFNULL(SUM(empleado.salario),0) + NEW.salario
INTO salario_departamento_acumulado
FROM empleado
WHERE departamento = NEW.departamento;
-- Actualizo la suma total de salarios del departamento del nuevo empleado
UPDATE departamento 
SET suma_salario = salario_departamento_acumulado
WHERE id = NEW.departamento;
END$
DELIMITER ;