-- Selecionando as TOP 100 linhas da tabela DimStore, ordenando pela coluna EmployeeCount de forma decrescente
SELECT TOP(100) * FROM DimStore
ORDER BY EmployeeCount DESC


-- Selecionando as TOP 10 linhas da tabela DimProduct, ordenando pelas colunas UnitCost (decrescente) e Weight (decrescente)
SELECT 
	TOP(10) ProductName,
	UnitCost,
	Weight AS Peso
FROM
	DimProduct
ORDER BY UnitCost DESC, Peso DESC

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE
SELECT 
	ProductName AS Produto,
	UnitPrice AS Preco
FROM
	DimProduct
WHERE UnitPrice >= 1000

-- Quais produtos são da marca 'Fabrikam'?
SELECT * FROM DimProduct
WHERE BrandName = 'Fabrikam'

-- Quais produtos são da cor 'Black'?
SELECT * FROM DimProduct
WHERE ColorName = 'Black'


-- Quais clientes nasceram após o dia 31/12/1970?
SELECT * FROM DimCustomer
WHERE BirthDate >= '1970-12-31'
ORDER BY BirthDate DESC

-- Quais produtos são da marca 'Fabrikam' E TAMBÉM são da cor 'Black'?
SELECT * FROM DimProduct
WHERE BrandName = 'Fabrikam' AND ColorName = 'Black'

-- Quais produtos são da marca 'Contoso' OU são da cor 'White'?
SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' OR ColorName = 'White'

-- Quais funcionários NÃO são do departamento de 'Marketing'?
SELECT * FROM DimEmployee
WHERE NOT DepartmentName = 'Marketing'

-- 1. Selecione todas as linhas da tabela DimEmployee de funcionários do sexo feminino E do departamento de finanas.
SELECT * FROM DimEmployee
WHERE Gender = 'F' AND DepartmentName = 'Finance'

-- 2. Selecione todas as linhas da tabela DimProduct de produtos Contoso E da cor vermelha E que tenham um UnitPrice maior ou igual a $100.
SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Red' AND UnitPrice >= 100


-- 3. Selecione todas as linhas da tabela DimProduct com produtos da marca Litware OU da marca Fabrikam OU da cor Preta.
SELECT * FROM DimProduct
WHERE BrandName = 'Litware' OR BrandName = 'Fabrikam' OR ColorName = 'Black'

-- 4. Selecione todas as linhas da tabela DimSalesTerritory onde o continente é a Europa mas o país NÃO é a Itália.
SELECT * FROM DimSalesTerritory
WHERE SalesTerritoryGroup = 'Europe' AND NOT SalesTerritoryCountry = 'Italy'

-- Exemplo: Selecione todas as linhas da tabela DimProduct onde a cor do Produto pode ser igual a Preto OU Vermelho, MAS a marca deve ser obrigatoriamente igual a Fabrikam.
SELECT * FROM DimProduct
WHERE (ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam'

-- WHERE IN : Listagem de valores que podem ser utilizados em uma validação de condições
SELECT * FROM DimProduct
WHERE ColorName IN ('Black', 'Red', 'White')

-- 1. Selecione todos os produtos que possuem o texto 'MP3 Player' contido na nome do produto.
SELECT * FROM DimProduct
WHERE ProductName LIKE '%MP3 Player%'

-- 2. Selecione todos os produtos que têm a descrição do nome comeando por 'Type'.
SELECT * FROM DimProduct
WHERE ProductDescription LIKE '%Type'

-- 3. Selecione todos os produtos que têm a descrição do nome terminando em 'WMA'.
SELECT * FROM DimProduct
WHERE ProductDescription LIKE 'WMA%'

-- 1. Selecione os funcionários que têm a data de contratação entre '01-01-2000' e '31-12-2000'.
SELECT * FROM DimEmployee
WHERE HireDate BETWEEN '2000-01-01' AND '2000-12-31'

SELECT * FROM DimProduct
WHERE UnitPrice BETWEEN 50 AND 100

SELECT * FROM DimProduct
WHERE UnitPrice NOT BETWEEN 50 AND 100

SELECT * FROM DimProduct
WHERE NameProduct IS NOT NULL

SELECT * FROM DimProduct
WHERE NameProduct IS NULL