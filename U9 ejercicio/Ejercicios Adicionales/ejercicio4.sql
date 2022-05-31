-- Crea una trigger en la base de datos Q3ERP para que el precio de los productos que se inserten no pueda superar en 200€ 
-- al precio del producto más caro que exista en la base de datos. 
-- En el caso de que lo superen el precio que se guardará será el del producto más caro más 200€.
DELIMITER //
CREATE TRIGGER `ejercicio4` BEFORE INSERT ON `productos` FOR EACH ROW
BEGIN
-- 1º.- declaro la variable precio.
	DECLARE precioCaro DECIMAL(10,2);
-- 2º.- Busco el precio más alto de tabla productos y lo guardo en la variable precioCaro
	SELECT MAX(precio) INTO precioCaro FROM  productos;
-- 3º.- comparo el precioCaro con el precio del producto que voy a insertar más 200€.
-- en caso de que el precio del producto que voy a insertar sea mayor que precioCaro, 
	IF (NEW.precio > precioCaro + 200) THEN
    -- entonces el precio del producto que insertaré será el precioCaro más 200€
    SET NEW.precio = precioCaro + 200;
    END IF;
END//
DELIMITER ;


