DROP FUNCTION IF EXISTS ejercicio24;
DELIMITER //
CREATE FUNCTION ejercicio24 (a DECIMAL(10,2), b DECIMAL(10,2), c DECIMAL (10,2)) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE resultado VARCHAR(50);
	DECLARE cuatroPorAPorC DECIMAL (10,2);
    DECLARE BCuadrado DECIMAL(10,2);
    DECLARE DosA DECIMAL (10,2);
    DECLARE resultado1 DECIMAL (10,2);
    DECLARE resultado2 DECIMAL (10,2);
    SET cuatroPorAPorC := 4*a*c;
    SET BCuadrado :=b*b;
    SET DosA :=2*a;
    
    SET resultado1 = (-b + SQRT(BCuadrado - cuatroPorAPorC))/DosA;
	SET resultado2 = (-b - SQRT(BCuadrado - cuatroPorAPorC))/DosA;
    SET resultado = CONCAT(resultado1, "," resultado2);
    
RETURN resultado;
END//
DELIMITER ;


