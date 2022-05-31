-- Ejercicio 11: Crea un trigger en la tabla productos de la base de datos Q3ERP para que cuando se inserte un artículo verifique si el precio es positivo. En caso contrario pondrá el precio a cero.

-- Borramos el trigger si ya existe
DROP TRIGGER IF EXISTS productos_BI_trigger;
-- Creamos el trigger, indicamos que el delimitador es // para que no se confunda con los ;
DELIMITER //
-- El trigger se ejecutará antes de realizar la inserción
CREATE TRIGGER productos_BI_trigger BEFORE INSERT ON productos FOR EACH ROW
BEGIN
 -- Si el valor a insertar es menor que 0, lo modificamos para que sea 0
 IF (NEW.precio < 0) THEN
	SET NEW.precio := 0;
 END IF;
END//
DELIMITER ; -- Volvemos a fijar como delimitador ;

-- Comprobamos que funciona
-- Tras realizar la inserción
INSERT INTO productos VALUES(DEFAULT,4,2,100, "Impresora", -50, 1, '***');
-- El precio del nuevo producto será 0 en vez de -50
SELECT * FROM productos;



