DELIMITER //

CREATE TRIGGER ejer_adic_6 BEFORE INSERT ON clientes FOR EACH ROW
BEGIN
	DECLARE max_id INT;
    -- Obtenemos el identificador más alto insertado hasta el momento
	SELECT MAX(id) INTO max_id FROM clientes;
    -- Puede ocurrir que la variable max_id contenga NULL si la tabla clientes está vacía, ya que no se puede obtener el id máximo.
    IF(max_id IS NULL) THEN 
		SET NEW.id = 1; -- En ese caso indicamos que el id del cliente será 1
	ELSE
		SET NEW.id = max_id + 1; -- Si no, incremetamos el id máximo en 1 y lo utilizamos como id para el nuevo cliente
	END IF;
END//

DELIMITER ;

-- Al insertar un par de clientes
INSERT INTO clientes (nombre) VALUES ('Juan');
INSERT INTO clientes (nombre) VALUES ('Pepa');
-- Veremos que su id se auto incrementa gracias a nuestro trigger
SELECT * FROM clientes;