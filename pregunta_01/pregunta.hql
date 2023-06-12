/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

-- Crea una tabla temporal para cargar los datos del archivo data.tsv
CREATE TABLE temp_data (col1 STRING, col2 STRING, col3 INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

-- Carga los datos del archivo data.tsv en la tabla temporal
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE temp_data;

-- Calcula la cantidad de registros por cada letra de la columna 1 y ordena por letra
SELECT col1, COUNT(*) AS count
FROM temp_data
GROUP BY col1
ORDER BY col1;

-- Guarda el resultado en la carpeta output del directorio de trabajo
INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT col1, COUNT(*) AS count
FROM temp_data
GROUP BY col1
ORDER BY col1;
