CREATE OR REPLACE FUNCTION moverCabezal(posicion_actual int,  direccion char, cinta text) 
RETURNS int 
AS $$
BEGIN
    IF direccion = 'R' THEN
        posicion_actual := posicion_actual + 1;
    ELSIF direccion = 'L' THEN
        posicion_actual := posicion_actual - 1;
    END IF;
    return posicion_actual;
END;
$$ LANGUAGE plpgsql;

