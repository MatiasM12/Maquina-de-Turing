-- Crear la tabla "traza_ejecucion" para registrar la ejecución de la Máquina de Turing
CREATE TABLE traza_ejecucion (
    paso serial PRIMARY KEY,
    estado text,
    cinta text,
    caracter_ori text,
    estado_nue text,
    caracter_nue text,
    posicion_actual int,
    aceptado boolean
);

