-- TRIGGER SOBRE LA TABLA PRODUCTOS
DROP TRIGGER IF EXISTS productos_AD_trigger;
DELIMITER //
CREATE TRIGGER productos_AD_trigger AFTER DELETE ON productos FOR EACH ROW
BEGIN
    DECLARE descripcion TEXT;
    SET descripcion := CONCAT_WS(' ','DELETE ON productos. OLD: (', OLD.producto, OLD.precio,')');
	INSERT INTO log VALUES (DEFAULT, NOW(), CURRENT_USER, descripcion);
END//
DELIMITER ;
-- TRIGGER SOBRE LA TABLA CATEGORIAS
DROP TRIGGER IF EXISTS categorias_AD_trigger;
DELIMITER //
CREATE TRIGGER categorias_AD_trigger AFTER DELETE ON categorias FOR EACH ROW
BEGIN
    DECLARE descripcion TEXT;
    SET descripcion := CONCAT_WS(' ','DELETE ON categorias. OLD: (', OLD.categoria,')');
	INSERT INTO log VALUES (DEFAULT, NOW(), CURRENT_USER, descripcion);
END//
DELIMITER ;
-- TRIGGER SOBRE MARCAS
DROP TRIGGER IF EXISTS marcas_AD_trigger;
DELIMITER //
CREATE TRIGGER marcas_AD_trigger AFTER DELETE ON marcas FOR EACH ROW
BEGIN
    DECLARE descripcion TEXT;
    SET descripcion := CONCAT_WS(' ','DELETE ON categorias. OLD: (', OLD.marca,')');
	INSERT INTO log VALUES (DEFAULT, NOW(), CURRENT_USER, descripcion);
END//
DELIMITER ;