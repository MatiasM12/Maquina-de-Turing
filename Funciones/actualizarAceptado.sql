CREATE OR REPLACE FUNCTION actualizarAceptado(nro_de_pasos int, valor boolean)
RETURNS void 
AS $$
DECLARE

BEGIN
   	UPDATE traza_ejecucion
        SET aceptado = valor
        WHERE paso = nro_de_pasos;
END;
$$ LANGUAGE plpgsql;

