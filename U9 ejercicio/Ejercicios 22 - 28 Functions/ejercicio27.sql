DROP FUNCTION IF EXISTS ejercicio27;
DELIMITER //
CREATE FUNCTION ejercicio27 (nombreMarca VARCHAR(32)) RETURNS DECIMAL (10,2) DETERMINISTIC 
BEGIN
DECLARE resultado DECIMAL(10,2);
SELECT AVG(productos.precio)
INTO resultado
FROM productos
INNER JOIN marcas ON productos.marca_id = marcas.marca_id
WHERE marcas.marca = nombreMarca;

RETURN resultado;
END//
DELIMITER ;