-- Implementa una función en la base de datos Q3ERP que reciba como parámetro un precio 
-- mínimo y un precio máximo y devuelva el número de productos cuyo precio esté dentro del 
-- rango indicado.

use Q3ERP;

DROP FUNCTION IF EXISTS ejer_adic_3;
DELIMITER //
CREATE FUNCTION ejer_adic_3(precio_min DECIMAL(10,2), precio_max DECIMAL(10,2)) RETURNS INT DETERMINISTIC
BEGIN
	DECLARE num_productos INT;
    -- Contamos los productos cuyo precio se encuentra entre precio_min y precio_max
    SELECT COUNT(*) INTO num_productos FROM productos WHERE precio BETWEEN precio_min AND precio_max;
    -- Devolvemos el valor obtenido
    RETURN num_productos;
END//
DELIMITER ;

-- Probamos la función
SELECT ejer_adic_3(30,500);