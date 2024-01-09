CREATE OR REPLACE FUNCTION verificarDetencion(cantidad_filas int,estado_actual text,caracter_nue text)
RETURNS void 
AS $$
BEGIN
   	IF cantidad_filas = 0 THEN
	 	RAISE NOTICE 'No hay funcion de transicion para estado<%> y caracter<%>, LA MT se detuvo!', estado_actual,caracter_nue ;
	END IF;
END;
$$ LANGUAGE plpgsql;

