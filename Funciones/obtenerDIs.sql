CREATE OR REPLACE FUNCTION obtenerDIs()
RETURNS TABLE (DIs text) AS $$
DECLARE
    fila traza_ejecucion;
BEGIN
    -- Recorre la tabla traza_ejecucion
    FOR fila IN
        SELECT *
        FROM traza_ejecucion
        ORDER BY paso
    LOOP
        -- Concatena el estado actual en la posición del paso
        fila.cinta := overlay(fila.cinta placing '-'||fila.estado||'-' from fila.posicion_actual for 0);
	
        -- Devuelve la cinta modificada
        RETURN QUERY SELECT fila.cinta;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

