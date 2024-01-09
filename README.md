# Simulador de Máquinas de Turing en PostgreSQL

Este repositorio contiene la implementación de un simulador de Máquinas de Turing (MT) utilizando una base de datos PostgreSQL y programación en PL/pgSQL. El simulador toma la definición de una MT y un string de entrada, ejecuta el programa de la MT y graba cada movimiento en una base de datos para su posterior análisis.

## Contenido del Trabajo

### 1. Implementación de la Máquina de Turing

- **Función en PL/pgSQL:** `simuladorMT(string)`
  - Descripción: Recibe un string con caracteres válidos dentro del lenguaje de la MT y ejecuta el programa de la MT.
  - La definición de la MT debe precargarse en la tabla `programa` antes de invocar la función `simuladorMT`. La tabla debe contener las columnas: `estado_ori`, `caracter_ori`, `estado_nue`, `caracter_nue` y `desplazamiento`.
  - Todos los movimientos se grabarán en la tabla `traza_ejecucion`.
  - Antes de iniciar la ejecución de `simuladorMT`, la tabla `traza_ejecucion` debe estar vacía.
  - Después de ejecutar la función, se grabarán en la tabla `traza_ejecucion` todos los movimientos realizados por la MT. Se proporcionará una consulta SQL para obtener estos movimientos.
  - Se detectará cuando la máquina se apaga y se informará en la tabla `traza_ejecucion`.
  - Se proporcionarán 3 programas diferentes con scripts SQL para cargar en la tabla `programa`.
  - Existirá una tabla `alfabeto` para validar el string inicial.

### 2. Obtener Descripciones Instantáneas

- Se proporcionará una función que, después de ejecutar una MT, tomará la información de la tabla `traza_ejecucion` y devolverá todas las descripciones instantáneas por las que pasó la MT durante su ejecución.

## Instrucciones

Para ejecutar el codigo primero hay que crear las tablas, luego las funciones y por ultimo correr el archivo script.sql o las siguientes lineas para ver resultados

```
SELECT simuladorMT('11101','Q0','Q18');
SELECT * FROM  traza_ejecucion;
SELECT * FROM obtenerDIs();
```

## Tests Unitarios

- Se incluirán 3 tests unitarios para demostrar la funcionalidad del simulador:
  - Programa que te devuelve la reversa del string en la cinta
  - Programa que verifica si el input es palindromo
  - Programa de resta 

¡Gracias por explorar nuestra implementación del simulador de Máquinas de Turing en PostgreSQL! 🔄🚀


