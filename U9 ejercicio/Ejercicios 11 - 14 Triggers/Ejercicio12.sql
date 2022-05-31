-- Ejercicio 12. Crea un trigger en la tabla productos de la base de datos Q3ERP para que cuando se modifique un artículo verifique si el precio es positivo. En caso contrario pondrá el precio a cero.

-- Borramos el trigger si ya existe
DROP TRIGGER IF EXISTS productos_BU_trigger;
-- Creamos el trigger
DELIMITER //
CREATE TRIGGER productos_BU_trigger BEFORE UPDATE ON productos FOR EACH ROW
BEGIN
 -- Instrucciones asociadas al trigger
 IF (NEW.precio < 0) THEN
	SET NEW.precio := 0;
 END IF;
END//
DELIMITER ;
-- Comprobamos que funciona
UPDATE productos SET precio = -50 WHERE producto_id = 1;
SELECT * FROM productos;