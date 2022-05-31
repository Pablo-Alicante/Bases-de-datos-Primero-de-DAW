-- Crea una trigger en la base de datos Q3ERP para que el precio de los productos que se inserten
-- no pueda superar en 200€ al precio del producto más caro que exista en la base de datos. En el
-- caso de que lo superen el precio que se guardará será el del producto más caro más 200€.

DROP TRIGGER IF EXISTS ejer_adic_4;
DELIMITER //
CREATE TRIGGER ejer_adic_4 BEFORE INSERT ON productos FOR EACH ROW
BEGIN
	DECLARE precio_max DECIMAL(10,2);
	-- Primero obtengo el precio más alto de los productos existenes
    SELECT MAX(precio) INTO precio_max FROM productos;
    -- Compruebo si el precio del producto que se va a insertar supera el máximo en 200€
    IF ( NEW.precio > precio_max + 200) THEN
		-- Si lo supera, limitamos el precio para que sea el máximo + 200€
		SET NEW.precio := precio_max + 200;
	END IF;
    -- Al finalizar la ejecución del trigger el producto que se insertará es el que se encuentra en la variable NEW
END//
DELIMITER ;