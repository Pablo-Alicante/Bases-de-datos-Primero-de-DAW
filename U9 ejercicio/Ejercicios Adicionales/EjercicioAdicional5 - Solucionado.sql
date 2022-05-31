-- Crea una función que reciba como parámetro dos marcas, la función devolverá el identificador
-- de aquella marca con el producto más caro. En caso de empate se devolverá cualquiera de los
-- dos identificadores.

DELIMITER //
CREATE FUNCTION ejer_adic_5 (marca1 BIGINT, marca2 BIGINT) RETURNS BIGINT DETERMINISTIC
BEGIN
	DECLARE precio_max_marca1 DECIMAL(10,2);
	DECLARE precio_max_marca2 DECIMAL(10,2);
	DECLARE marca_mas_cara BIGINT;
    
	-- Obtener el precio más alto de los productos de la marca1
	SELECT MAX(precio) INTO precio_max_marca1 FROM productos WHERE marca_id = marca1;
	-- Obtener el precio más alto de los productos de la marca2
	SELECT MAX(precio) INTO precio_max_marca2 FROM productos WHERE marca_id = marca2;
     
    IF (precio_max_marca1 > precio_max_marca2) THEN
		-- La marca 1 es la más cara
		SET marca_mas_cara := marca1;
	ELSE 
		-- La marca 2 es la más cara (o hay empate)
		SET marca_mas_cara := marca2;
    END IF;
    -- Devolvemos el id de la marca más cara
	RETURN marca_mas_cara;
END//
DELIMITER ;

SELECT ejer_adic_5(1,3);