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

-- ALTER TABLE & UPDATE 
ALTER TABLE Funcionarios
ADD Cargo VARCHAR (100), Bonus FLOAT

UPDATE Funcionarios
SET Cargo = 'Analista', Bonus = 0.15
WHERE ID = 5

-- ALTER COLUMM E DROP COLUMN
ALTER TABLE Funcionarios
ALTER COLUMN Salario INT

-- ALTER COLUMN E DROP COLUMN
ALTER TABLE Funcionarios
DROP COLUMN Bonus

/* Exercícios */
CREATE DATABASE BD_Teste
USE BD_Teste
GO

-- DROP DATABASE BD_Teste

CREATE TABLE dCliente(
    ID_Client INT,
    Nome VARCHAR (100),
    Data_Nasc DATETIME
)
GO

CREATE TABLE dGerente(
    ID_Gerent INT,
    Nome VARCHAR(100),
    Data_Contratacao DATETIME,
    Salario DECIMAL (6,2) -- FLOAT pode ser utilizado 
)
GO

CREATE TABLE fContratos(
    ID_Contrato INT,
    Data_Contratacao DATETIME,
    ID_Client INT,
    ID_Gerent INT,
    Valor_Contrato DECIMAL (6,2) -- FLOAT pode ser utilizado !
)
GO

SELECT TOP (10) FROM fContratos
SELECT TOP (10) FROM dGerente
SELECT TOP (10) FROM dCliente

INSERT INTO dCliente (ID_Client, Nome, Data_Nasc)
VALUES
    (1, 'Carlos', '2000-05-18'),
    (2, 'Sara', '1996-02-25'),
    (3, 'Paulo', '1989-08-11')
GO

INSERT INTO dGerente (ID_Gerent, Nome, Data_Contratacao, Salario)
VALUES
    (1, 'José', '2021-04-01', 6500),
    (2, 'Giovana', '2018-02-20', 5500),
    (3, 'Paola', '2015-09-01', 6200),
    (4, 'Carla', '2011-12-01', 7000)
GO

INSERT INTO fContratos (ID_Contrato, Data_Contratacao, ID_Client, ID_Gerent, Valor_Contrato)
VALUES
    (1, '2001-10-30', 3, 1, 30000),
    (2, '2005-03-21', 2, 4, 45500),
    (3, '2010-09-23', 1, 3, 55000),
    (4, '2019-11-14', 2, 2, 65000)
GO

UPDATE fContratos
SET ID_Gerent = 2, Valor_Contrato = 33500
WHERE ID_Contrato = 4

DELETE 
FROM fContratos
WHERE ID_Contrato = 4