CREATE OR REPLACE FUNCTION simuladorMT(input_string text,estado_inicial text,estado_final text)
RETURNS void AS $$
DECLARE
    estado_actual text := estado_inicial;
    posicion_actual integer := 1;
    cinta text := input_string;
    nro_de_pasos integer := 0;
    direccion text;
    caracter_nue text;
    caracter_ori text;
    estado_nue text;
    cantidad_filas int;
BEGIN
    -- Validar que la cadena de entrada solo contenga caracteres válidos
    PERFORM public.verificarCaracteresValidos(cinta);

    -- Vacia la tabla de traza de ejecución
    TRUNCATE traza_ejecucion;
    
    -- Simulación de la Máquina de Turing
    WHILE estado_actual <> estado_final LOOP
        -- Busca la transición en la tabla programa
        SELECT p.estado_nue, p.caracter_nue, p.desplazamiento
        INTO estado_nue, caracter_nue, direccion
        FROM programa p
        WHERE p.estado_ori = estado_actual AND p.caracter_ori = substring(cinta from posicion_actual for 1);
        
        -- Verifica si la MT se detiene
        GET DIAGNOSTICS cantidad_filas = ROW_COUNT;
	    PERFORM public.verificarDetencion(cantidad_filas,estado_actual,caracter_nue);

        -- Obtiene el carácter original antes de realizar cambios en la cinta
        caracter_ori := substring(cinta from posicion_actual for 1);

        -- Realiza los cambios en la cinta según la transición
        cinta := overlay(cinta placing caracter_nue from posicion_actual for 1);
	
        -- Incrementa el contador de pasos
        nro_de_pasos := nro_de_pasos + 1;

        -- Registra el estado actual en la tabla de traza
        INSERT INTO traza_ejecucion (paso, estado, cinta, caracter_ori, estado_nue, caracter_nue, posicion_actual, aceptado)
        VALUES (nro_de_pasos, estado_actual, cinta, caracter_ori, estado_nue, caracter_nue, posicion_actual, FALSE);
        
        -- Mueve el cabezal en la cinta
        posicion_actual := moverCabezal(posicion_actual, direccion, cinta);
  
        -- Asegura que la cinta tenga suficiente longitud y la actualiza
        IF posicion_actual > LENGTH(cinta) THEN
            cinta := cinta || 'B';
        ELSIF posicion_actual < 1 THEN
            cinta := 'B' || cinta;
            posicion_actual := 1;
        END IF;

        -- Actualiza el estado actual para el siguiente ciclo
        estado_actual := estado_nue;
    END LOOP;

    -- Si llegamos al estado final, establecemos la columna "aceptado" en true
    IF estado_actual = estado_final THEN
    	PERFORM public.actualizarAceptado(nro_de_pasos, TRUE);
    END IF;
END;
$$ LANGUAGE plpgsql;

