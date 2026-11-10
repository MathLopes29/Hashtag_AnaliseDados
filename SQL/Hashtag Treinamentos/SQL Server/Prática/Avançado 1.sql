/* COMANDOS CRUD */
-- CREATE / DROP DATABASE
CREATE DATABASE Teste
GO

USE Teste
GO

DROP DATABASE Teste
GO

-- CREATE TABLE
CREATE TABLE TesteTb(
    id INT,
    nome VARCHAR (55),
    obs VARCHAR (60),
    date_entrada DATETIME,
    valor DECIMAL(6,2)
) 
GO

-- INSERT TABLE
INSERT INTO TesteTB (id, nome, obs, date_entrada, valor)
VALUES
    (1, 'Carlos', '-', '2020-12-31'),
    (2, 'Luana', '-', '2017-05-07')
GO

-- 2ª Opção de INSERT
INSERT INTO TesteTB (id, nome, obs, date_entrada, valor)
SELECT
    ProductKey,
    ProductName,
    AvaliableForSaleDate,
    UnitPrice
FROM ContosoRetailDW.dbo.DimProduct 
GO

-- UPDATE TABLE
UPDATE Produtos
SET nome_produto = 'Macarrão'
WHERE id = 5
GO

-- DELETE TABLE
DELETE
FROM Produtos
WHERE id = 3

-- DROP TABLE
DROP TABLE TesteTB
GO