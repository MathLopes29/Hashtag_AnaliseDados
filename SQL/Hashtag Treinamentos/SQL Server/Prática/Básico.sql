/*
    [SQL Server] Introdução ao SQL
    @author: Hashtag Treinamentos
    @co-author: Matheus Lopes Lourenço
*/

/* 
    OBS: Como Abrir Comentários
    -- ou /**/
*/


/*
FUNÇÕES DE PESQUISA E CONSUYLTA DE DADOS
As funções de pesquisa e consulta de dados são utilizadas para recuperar informações específicas de um banco de dados com base em critérios definidos. Elas permitem que você filtre, ordene e selecione os dados relevantes para análise ou apresentação.
Exemplos de funções de pesquisa e consulta comuns incluem:
    * SELECT, 
    * FROM, 
    * WHERE, 
    * JOIN, 
    * GROUP BY, 
    * HAVING, 
    * ORDER BY
*/

-- Selecionando todas as linhas e colunas da tabela DimCustomer
SELECT * FROM DimCustomer

-- Selecionando todas as linhas e colunas da tabela DimStore
SELECT * FROM DimStore

-- Selecionando todas as linhas da tabela DimCustomer, especificamente as colunas StoreKey, StoreName, StorePhone
SELECT StoreKey, StoreName, StorePhone FROM DimStore

-- Selecionando todas as linhas e colunas da tabela DimProduct
SELECT * FROM DimProduct

-- Selecionando todas as linhasda tabela DimProduct, especificamente as colunas ProductName, BrandName
SELECT ProductName, BrandName FROM DimProduct

-- Formas de representação de código
    -- 1ª Forma:
SELECT StoreKey, StoreName, StorePhone FROM DimStore
    -- 2ª Forma:
SELECT 
    StoreKey, 
    StoreName, 
    StorePhone 
FROM 
    DimStore

-- Comando AS: Renomeando colunas (aliasing)
-- Selecione as 3 colunas da tabela DimProduct: ProductName, BrandName e ColorName
SELECT
	ProductName AS Produto,
	BrandName AS Marca,
	ColorName AS Cor
FROM 
	DimProduct


-- Comando SELECT DISTINCT: Retorna os valores distintos de 1 ou mais colunas de uma tabela
-- Retorne todas as linhas da tabela DimProduct
SELECT * FROM DimProduct

-- Retorne os valores distintos da coluna ColorName da tabela DimProduct
SELECT DISTINCT ColorName FROM DimProduct

-- Retorne todas as linhas da tabela DimEmployee
SELECT * FROM DimEmployee

-- Retorne os valores distintos da coluna DepartmentName da tabela DimEmployee
SELECT
	DISTINCT DepartmentName
FROM DimEmployee

-- TOP: Top 10 primeiras linhas da tabela de Produtos.
SELECT TOP(10) * FROM DimProduct

-- TOP (%): Top 10% primeiras linhas da tabela de Clientes
SELECT TOP(10) PERCENT * FROM DimCustomer