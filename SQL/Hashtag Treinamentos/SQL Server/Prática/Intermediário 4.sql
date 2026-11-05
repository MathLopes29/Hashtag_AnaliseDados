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