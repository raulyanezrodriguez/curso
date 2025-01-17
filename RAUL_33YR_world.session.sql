SHOW TABLES;

/* 1. CONSULTA POR CAMPOS */
SELECT Name, CountryCode FROM city LIMIT 10;

-- 2. CONSULTA SIN REGISTROS REPETIDOS -- 
--USAMOS CLAUSULA DISTINCT--
SELECT DISTINCT Continent FROM country

-- 3. CONSULTA DE TABLA COMPLETA (*) --
SELECT * FROM countrylanguage;

-- 4 FILTRADO DE REGISTROS 
-- USO DE WHERE 
SELECT * FROM countrylanguage
WHERE CountryCode ="USA";

-- 4b FILTRADO CON OPERADORES
-- USO DE WHERE + AND
SELECT * FROM city
WHERE CountryCode ="ESP"
AND Population > 500000;

--4c FILTRADO CON OPERADORES 
-- USO DE WHERE + OR
SELECT * FROM city
WHERE District = "Andalusia"
AND District = "Madrid";

-- 5. ORDENACIONES
-- Uso de ORDER BY ... ASC / DESC
SELECT * FROM city
WHERE District ="Andalusia"
ORDER BY Population ASC;

-- 6. Ordenaciones con operadores
SELECT * FROM city
WHERE District ="Andalusia"
AND Population > 200000
ORDER BY Population ASC;

-- 7. conjuntos
-- uso de la clausula IN
SELECT Name, District
FROM city
WHERE Name IN ("Sevilla", "Bilbao", "Vigo");

-- 8. funciones de agregacion:
-- COUNT (Contar)
SELECT COUNT(Name)
FROM city
WHERE CountryCode = "ESP"
AND Population > 100000;

--Ejercicio nº ciudades de francia españa y portugal

SELECT COUNT(Name)
FROM city
WHERE CountryCode IN("ESP", "FRA", "PRT");

-- 8b. Funciones de agregación adicionales:
-- AVG (media) SUM (suma) MAX (maximo) MIN (minimo)ç
SELECT AVG(Population)
FROM city
WHERE District = "Andalusia";


-- 10.
SELECT CountryCode, COUNT(Name) AS NumCiudades
FROM city
GROUP BY CountryCode
HAVING NumCiudades > 100
ORDER BY NumCiudades DESC
LIMIT 3;

-- 11. joins! unir tablas
SELECT city.name, CountryCode, District, Continent, Country.Population
FROM city, country
WHERE city.CountryCode = country.CountryCode
AND Code = "FRA"
AND city.Name = "paris";

ej:

SELECT city.name, city.District,
city.Population, country.Continent,
country.Name AS Country,
countrylanguage.language, countrylanguage.Percentage
FROM city, country, countrylanguage
WHERE city.CountryCode = country.Code
AND country.Code = countrylanguage.CountryCode
AND city.name = "Córdoba"
AND language = "Spanish";

CREATE TABLE IF NOT EXISTS Clientes
(
    NIF CHAR(9) NOT NULL
    Nombre VARCHAR(30) NOT NULL
    Género TINYINT
    Codigo Postal CHAR(5)
    PRIMARY KEY pk_Clientes (NIF)
    INDEX idx_Clientes (NIF)
)ENGINE = innodb;