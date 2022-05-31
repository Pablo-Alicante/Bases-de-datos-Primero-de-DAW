DROP FUNCTION IF EXISTS ejercicio25;
DELIMITER //
CREATE FUNCTION ejercicio25 (fecha1 DATE, fecha2 DATE) RETURNS DECIMAL (10,2) DETERMINISTIC
BEGIN
	DECLARE resultado DECIMAL (10,2);
	SET resultado = (datediff(fecha1, fecha2)/365);
    RETURN resultado;
END //
DELIMITER ;

SELECT ejercicio25 ('2021-06-02', '2021-05-02');