CREATE OR REPLACE FUNCTION public.verificarCaracteresValidos(input_string character varying) RETURNS void
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    i integer;
BEGIN
    FOR i IN 1..length(input_string) LOOP
        IF NOT EXISTS (SELECT 1 FROM alfabeto WHERE caracter = substring(input_string from i for 1)) THEN
            RAISE EXCEPTION 'La cadena de entrada contiene caracteres no válidos: %', substring(input_string from i for 1);
        END IF;
    END LOOP;
END;
$BODY$;


ALTER FUNCTION public.verificar_caracteres_validos(character varying)
    OWNER TO postgres;
