/*
    FUNÇÕES CASE, IFNULL, ISNULL, COALESCE, NULLIF

    Como utilizar elas e quando utilizar!
*/


DECLARE @valor = INTEGER
SET @valor = 15

CASE
    WHEN @valor > 10 THEN 'Maior que 10'
    WHEN @valor < 10 THEN 'Menor que 10'
    ELSE 'Igual'
END



SELECT 
    CustomerKey AS 'ID Cliente',
    FirstName AS 'Nome',
    Gender AS 'Sexo',

    CASE
        WHEN Gender = 'M' THEN 'Masculino'
        WHEN Gender = 'F' THEN 'Feminino'
        ELSE 'Não Informado'
    END AS Gender_Description

FROM DimCustomer
ORDER BY CustomerKey



DECLARE @Preco FLOAT
SET @Preco = 500

SELECT
    CASE
        WHEN @Preco > 1000 THEN 'Luxo'
        WHEN @Preco >= 500 THEN 'Deluxe'
        WHEN @Preco >= 100 THEN 'Economy'
        ELSE 'Basic'
    END AS Category_Product


SELECT
    FirstName,
    Title,
    SalariedFlag,

    CASE
        WHEN Title = 'Sales Group Manager' THEN 0.3
        CASE
            WHEN SalariedFlag = 1 THEN 0.3
            ELSE 0.2
        END

        WHEN Title = 'Sales Region Manager' THEN 0.15
        WHEN Title = 'Sales State Manager' THEN 0.07
        ELSE 0.02
    END AS 'Bonus'

FROM DimEmployee


SELECT
    ProductKey,
    ProductName,
    ProductCategoryName,
    ProductSubcategoryName,
    UnitPrice,

    CASE WHEN ProductCategoryName = 'TV and Video' THEN 0.1 ELSE 0 END
    CASE WHEN ProductSubcategoryName = 'Televisions' THEN 0.05 ELSE 0 END

FROM DimProduct
INNER JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
INNER JOIN DimProductCategory ON DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductCategoryKey


DEFINE @VarClassic INT
SET @VarClassic = 8

SELECT
    IF(
        @VarClassic >= 5,
        'Risco Alto',
        'Risco Baixo'
    )

-- ALTERNATIVA AO CASE, UTILIZANDO IIF
SELECT
    CustomerKey,
    CustomerType,
    IIF(
        CustomerType = 'Person',
        'FistName',
        'CompanyName'
    ) AS 'Client'
FROM
    DimCustomer


SELECT
    CustomerKey,
    CustomerType,
    IIF(
        StockTypeName = 'High',
        'João',
        IIF(
            StockTypeName = 'Medium',
            'Maria',
            'José'
        ) AS 'Responsável'

    )


SELECT
    GeographyKey,
    ContinentName,
    CityName,
    ISNULL(
        CityName,
        'Não Informado'
    ) AS 'Cidade'


SELECT
    ProductKey AS 'ID Produto',
    ProductName AS 'Nome Produto',
    ClassName AS 'Classe',

    CASE 
        WHEN ClassName IS NULL THEN 'Não Informado'
        ELSE ClassName
    END AS 'Classe Produto',

    CASE
        WHEN ClassName = 'Economy' THEN (1 - 0.05) * UnitPrice
        WHEN ClassName = 'Regular' THEN (1 - 0.07) * UnitPrice
        ELSE (1 - 0.09) * UnitPrice
    END AS '% Desconto'

FROM DimProduct 


SELECT 
    BrandName AS 'Marca',
    COUNT(+) AS 'Qtd Produtos',
    CASE
        WHEN COUNT(+) >= 500 THEN 'Alta'
        WHEN COUNT(+) >= 200 THEN 'Média'
        ELSE 'Baixa'
    END AS 'Classificação'
FROM DimProduct
GROUP BY BrandName

SELECT
    StoreName AS 'Loja',
    EmployeeCount AS 'Qtd. Funcionários',
    CASE
        WHEN EmployeeCount >= 50 THEN 'Acima de 50 Funcionários'
        WHEN EmployeeCount >= 20 THEN 'Entre 20 e 50 Funcionários'
        ELSE 'Abaixo de 20 Funcionários'
    END AS 'Classificação'
FROM DimStore


SELECT
    ProductSubCategoryName AS 'SubCategoria',
    ROUND(AVG (Weight),2) AS 'Peso Médio',
    CASE
        WHEN ROUND(AVG (Weight) * 100,2) >= 1000 THEN 'Rota 2',
        ELSE 'Rota 1'
    END AS 'Rotas de Entrega'
FROM DimProduct
INNER JOIN DimProductSubCategoryName 
    ON DimProduct.ProductSubCategoryKey = DimProductSubCategoryName.ProductSubCategoryKey
GROUP BY ProductSubCategoryName


SELECT
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    TotalChildren AS 'Qtd. Filhos',
    CASE
        WHEN Gender = 'F' AND TotalChildren > 0 THEN 'Sorteio Mãe do Ano'
        WHEN Gender = 'M' AND TotalChildren > 0 THEN 'Sorteio Pai do Ano'
        ELSE 'Sorteio Caminhão de Prêmios'
    END AS 'Ação de Marketing'
FROM DimCustomer