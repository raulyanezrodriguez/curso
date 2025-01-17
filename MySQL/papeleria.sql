CREATE DATABASE IF NOT EXISTS simplificando
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish2_ci;

USE simplificando;

CREATE TABLE IF NOT EXISTS Clientes
(
    NIF CHAR(9) NOT NULL,
    Nombre VARCHAR(40) NOT NULL,
    Género BOOLEAN NULL,
    CodigoPostal INT NOT NULL,
    PRIMARY KEY pk_Clientes (NIF),
    INDEX idx_Clientes (Nombre),
    INDEX idx2_Clientes (CodigoPostal)
)ENGINE = innodb
COMMENT = "Tabla Principal CLientes";

CREATE TABLE IF NOT EXISTS ventas
(
    NumTicket INT AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Referencia TINYINT UNSIGNED NOT NULL,
    NIF CHAR(9) NOT NULL,
    INDEX idx_ventas (NumTicket),
    PRIMARY KEY pk_ventas (Fecha, Referencia, NIF),
    FOREIGN KEY fk_productos(Referencia) REFERENCES productos(Referencia),
    FOREIGN KEY fk_Clientes(NIF) REFERENCES Clientes(NIF)
)ENGINE = innodb
COMMENT = "TABLA RELACIONADA CON VENTAS";

-- borrar tablas
-- DROP TABLE ventas;
-- DROP TABLE Clientes;
-- DROP TABLE productos;
-- *borrar BBSS* 
-- DROP DATABASE papeleria;--
;


-- INSERT (tema11)
-- Sirve para insertar registros
-- 1º Se insertan registros

USE simplificando


-- Si se van a meter datos en todos los campos no hace falta ponerlos
INSERT INTO productos,
VALUES (234, "Rotulador Rojo", 0.85, 2);
INSERT INTO productos (Referencia, Descripcion, Precio)
VALUES (112, "Rotulador Negro", 0.85);

INSERT INTO Clientes (NIF, Nombre, Género, CodigoPostal)
VALUES
("11111111A", "Ana", 1, 41702),
("22222222B", "Maria José", 1, 41013),
("33333333C", "Alfonso", 0, 41927);

INSERT INTO ventas (Fecha, Referencia, NIF)
VALUES
("2024-01-10", 234, "11111111A"),
("2024-01-10", 112, "22222222B"),
("2024-01-10", 112, "11111111A");

--COMRPOBAMOS

SELECT * FROM ventas;
SELECT * FROM Clientes;
SELECT * FROM productos;

-- UPDATE
-- actualizar datos de kas tablas 
-- ej: vamos a modificar el nombre

UPDATE Clientes
SET NIF = "33333333C"
WHERE nombre = "Alfonso";

UPDATE ventas
SET Fecha = "2024-01-09",
Referencia = "112"
WHERE NumTicket = "3";

-- DELETE 
-- Borrar fila/s de una tabla
-- NO SE PUEDE BORRAR DATOS DE LA TABLA PRINCIPAL
-- SIN BORRAR SUS ASOCIADOS DE LA TABLA RELACIONADA

DELETE FROM ventas
WHERE NumTicket = "3";