-- View: Visualização de Consulta Segura e Reutilizada
-- CREATE VIEW

USE /* DATABASE */
GO

CREATE VIEW vw_Clients AS
SELECT
    c.ClientID,
    c.FirstName,
    c.LastName,
    c.Email,
    c.Phone,
    a.AddressLine1,
    a.AddressLine2,
    a.City,
    a.StateProvince,
    a.PostalCode,
    a.CountryRegion
FROM Clients c
INNER JOIN Addresses a ON c.AddressID = a.AddressID;
GO

SELECT * FROM vw_Clients
GO

-- ALTER VIEW
ALTER VIEW vw_Clients AS
SELECT
    FirstName AS 'Nome',
    EmailAddress AS 'E-mail',
    BirthData AS 'Data de Nascimento',
    Gender AS 'Sexo'
FROM DimCustomer
WHERE Gender = 'F'
GO

-- DROP VIEW
DROP VIEW vw_Clients 
GO

/* Outros Exemplos */
CREATE VIEW vw_Produtos AS
SELECT
    NameProd AS 'Produto',
    Brand AS 'Marca',
    ColorName AS 'Cor',
    UnitPrice AS 'Preço Unitário'
FROM DimProduct
GO

SELECT * FROM vw_Produtos
GO

CREATE VIEW vw_Funcionários AS
SELECT
    FistName AS 'Nome',
    BirthDate AS 'Data de Nascimento',
    DepartamentName AS 'Departamento'
FROM DimEmployee
GO

SELECT * FROM vw_Funcionários
GO

CREATE VIEW vw_Store AS
SELECT
    StoreKey AS 'ID',
    StoreName AS 'Nome da Loja',
    OpenDate AS 'Data de Abertura de Loja'
FROM DimStore
GO

SELECT * FROM vw_Store
GO

/* Mais Exemplos de Views */
CREATE VIEW vw_Clientes AS
SELECT
    CONCAT(FisrtName, ' ', LastName) AS 'Nome',
    REPLACE(REPLACE(Gender, 'M', 'Masculino')'F', 'Feminino') AS 'Gênero',
    EmailAddress AS 'E-mail',
    FORMAT(YearlyIncome, 'C') AS 'Renda Atual'
FROM DimCustomer

SELECT * FROM vw_Clientes
GO


CREATE VIEW vw_LojasAtivas AS
SELECT * FROM DimStore
WHERE Status = 'On'
GO

SELECT * FROM vw_LojasAtivas
GO


CREATE VIEW vw_MarketingFuncionarios AS
SELECT 
    FisrtName,
    EmailAddress,
    DepartamentName,
FROM DimEmployee
WHERE DepartamentName = 'Marketing'
GO

SELECT * FROM vw_MarketingFuncionarios
GO


CREATE VIEW vwContorsoitwareSilver AS
SELECT *
FROM DimProduct
WHERE BrandName IN ('Contoso', 'Litware') AND ColorName = 'Silver'
GO

SELECT * FROM vwContorsoitwareSilver
GO


CREATE VIEW vwTotalVendidoProdutos AS
SELECT 
    ProductName AS 'Produto'
    FORMAT(SUM(SalesQuantity), 'C') AS 'Qtd. Vendida'
FROM FactSales
INNER JOIN DimProduct ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY FactSales.ProductKey
GO


ALTER VIEW vwProdutos AS
SELECT 
    ProductName AS 'Nome',
    BrandName AS 'Marca',
    ColorName AS 'Cor',
    UnitPrice AS 'Preço'
    UnitCost AS 'Custo Unitário'
FROM DimProduct
GO

ALTER VIEW vw_Funcionários AS
SELECT
    FistName AS 'Nome',
    BirthDate AS 'Data de Nascimento',
    DepartamentName AS 'Departamento'
FROM DimEmployee
WHERE Gender = 'F'
GO

ALTER VIEW vw_Lojas AS
SELECT
    StoreKey AS 'ID',
    StoreName AS 'Nome',
    OpenDate AS 'Data Abertura'
FROM DimStore
WHERE Status = 'On'
GO

CREATE VIEW vw_Resultado AS
SELECT 
    BrandName AS 'Marca',
    COUNT(*) AS 'Qtd. Produtos'
FROM DimProduct
GROUP BY BrandName
GO

ALTER VIEW vw_Resultado AS
SELECT 
    BrandName AS 'Marca',
    COUNT(*) AS 'Qtd. Produtos',
    SUM(Weight) AS 'Peso Total'
FROM DimProduct
GROUP BY BrandName

DROP VIEW vw_Resultado
GO