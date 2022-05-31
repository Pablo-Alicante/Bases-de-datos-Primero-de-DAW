-- Ejercicio 13. Crea un trigger en todas las tablas de la base de datos Q3ERP que cada vez que se modifique algo se guarde la modificación en la tabla log.

-- TRIGGER SOBRE LA TABLA PRODUCTOS
DROP TRIGGER IF EXISTS productos_AU_trigger;
DELIMITER //
CREATE TRIGGER productos_AU_trigger AFTER UPDATE ON productos FOR EACH ROW
BEGIN
    DECLARE descripcion TEXT;
	-- NOW() es una función que nos permite obtener la fecha y hora actual
    -- CURRENT_USER es una variable que contiene el usuario actual
    SET descripcion := CONCAT_WS(' ','UPDATE ON productos. OLD: (', OLD.producto, OLD.precio,')',
													      'NEW: (', NEW.producto, NEW.precio,')');
	INSERT INTO log VALUES (DEFAULT, NOW(), CURRENT_USER, descripcion);
END//
DELIMITER ;
-- Comprobamos que funciona
SELECT * FROM productos;
UPDATE productos SET precio = 200 WHERE producto_id = 1;
SELECT * FROM log;


-- TRIGGER SOBRE LA TABLA CATEGORIAS

DROP TRIGGER IF EXISTS categorias_AU_trigger;
DELIMITER //
CREATE TRIGGER categorias_AU_trigger AFTER UPDATE ON categorias FOR EACH ROW
BEGIN
    DECLARE descripcion TEXT;
    SET descripcion := CONCAT_WS(' ','UPDATE ON categorias. OLD: (', OLD.categoria,')',
													       'NEW: (', NEW.categoria,')');
	INSERT INTO log VALUES (DEFAULT, NOW(), CURRENT_USER, descripcion);
END//
DELIMITER ;
-- Comprobamos que funciona
SELECT * FROM categorias;
UPDATE categorias SET categoria = 'PC escritorio' WHERE categoria_id = 3;
SELECT * FROM log;