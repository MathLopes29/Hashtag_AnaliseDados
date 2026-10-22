/*
FUNÇÕES DE ORDENAÇÃO E FILTRAGEM DOS DADOS
As funções de ordenação e filtragem são utilizadas para organizar e restringir os resultados de uma consulta SQL com base em critérios específicos. 
Elas permitem que você controle a forma como os dados são apresentados e quais registros são incluídos nos resultados.
Exemplos de funções de ordenação e filtragem comuns incluem:

    * WHERE, 
    * ORDER BY, 
    * TOP, 
    * DISTINCT, 
    * BETWEEN, 
    * IN, 
    * LIKE, 
    * IS NULL, 
    * IS NOT NULL
*/

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

-- Selecione todas as linhas da tabela DimEmployee de funcionários do sexo feminino E do departamento de finanas.
SELECT * FROM DimEmployee
WHERE Gender = 'F' AND DepartmentName = 'Finance'

-- Selecione todas as linhas da tabela DimProduct de produtos Contoso E da cor vermelha E que tenham um UnitPrice maior ou igual a $100.
SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Red' AND UnitPrice >= 100


-- Selecione todas as linhas da tabela DimProduct com produtos da marca Litware OU da marca Fabrikam OU da cor Preta.
SELECT * FROM DimProduct
WHERE BrandName = 'Litware' OR BrandName = 'Fabrikam' OR ColorName = 'Black'

-- Selecione todas as linhas da tabela DimSalesTerritory onde o continente é a Europa mas o país NÃO é a Itália.
SELECT * FROM DimSalesTerritory
WHERE SalesTerritoryGroup = 'Europe' AND NOT SalesTerritoryCountry = 'Italy'

-- Exemplo: Selecione todas as linhas da tabela DimProduct onde a cor do Produto pode ser igual a Preto OU Vermelho, MAS a marca deve ser obrigatoriamente igual a Fabrikam.
SELECT * FROM DimProduct
WHERE (ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam'

-- WHERE IN : Listagem de valores que podem ser utilizados em uma validação de condições
SELECT * FROM DimProduct
WHERE ColorName IN ('Black', 'Red', 'White')

-- Selecione todos os produtos que possuem o texto 'MP3 Player' contido na nome do produto.
SELECT * FROM DimProduct
WHERE ProductName LIKE '%MP3 Player%'

-- Selecione todos os produtos que têm a descrição do nome comeando por 'Type'.
SELECT * FROM DimProduct
WHERE ProductDescription LIKE '%Type'

-- Selecione todos os produtos que têm a descrição do nome terminando em 'WMA'.
SELECT * FROM DimProduct
WHERE ProductDescription LIKE 'WMA%'

-- Selecione os funcionários que têm a data de contratação entre '01-01-2000' e '31-12-2000'.
SELECT * FROM DimEmployee
WHERE HireDate BETWEEN '2000-01-01' AND '2000-12-31'

-- Selecione os produtos que têm o preço entre $50 e $100.
SELECT * FROM DimProduct
WHERE UnitPrice BETWEEN 50 AND 100

-- Selecione os produtos que NÃO têm o preço entre $50 e $100.
SELECT * FROM DimProduct
WHERE UnitPrice NOT BETWEEN 50 AND 100

-- Selecione os produtos que possuem dados na coluna NameProduct.
SELECT * FROM DimProduct
WHERE NameProduct IS NOT NULL

-- Selecione os produtos que NÃO possuem dados na coluna NameProduct.
SELECT * FROM DimProduct
WHERE NameProduct IS NULL

/*
FUNÇÕES DE AGREGAÇÃO
As funções de agregação são utilizadas para realizar cálculos em um conjunto de valores e retornar um único valor. 
Elas são frequentemente usadas em conjunto com a cláusula GROUP BY para agrupar os resultados com base em uma ou mais colunas.
Exemplos de funções de agregação comuns incluem:

    * SUM,
    * AVG,
    * COUNT,
    * DISTINCT COUNT,
    * MIN,
    * MAX
*/
-- SUM ou SOMA
SELECT
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) AS 'Total Devolvido'
FROM
	FactSales

-- COUNT ou Contagem
SELECT COUNT(ProductName) AS 'Qtd. Produtos'
FROM DimProduct

SELECT COUNT(Size) AS 'Qtd. Produtos'
FROM DimProduct

-- DISTINCT COUNT ou Contagem Distinta
SELECT COUNT(DISTINCT BrandName) AS 'Qtd. de Marcas'
FROM DimProduct

-- MAX e MIN = Máximo e Mínimo
SELECT
	MAX(UnitCost) AS 'Custo Max',
	MIN(UnitCost) AS 'Custo Min'
FROM
	DimProduct

-- AVG ou Média
SELECT AVG(YearlyIncome) AS 'Média Anual de Salário'
FROM DimCustomer

/*
FUNÇÕES DE AGREGAÇÃO COM AGRUPAMENTO DE DADOS
As funções de agregação com agrupamento de dados são utilizadas para calcular valores agregados em grupos de registros com base em uma ou mais colunas. 
Elas permitem que você obtenha informações resumidas sobre os dados, como totais, médias e contagens, agrupadas por categorias específicas.
Exemplos de funções de agregação com agrupamento de dados comuns incluem:
    * GROUP BY,
    * HAVING
*/

-- Agrupando os dados da tabela DimProduct pela coluna BrandName e trazendo a quantidade total de produtos por marca. 
SELECT
	BrandName AS 'Nome da Marca',
	COUNT(*) AS 'Qtd Total'
FROM
	DimProduct
GROUP BY BrandName

--- Agrupando os dados da tabela DimStore pela coluna StoreType e trazendo a soma de EmployeeCount.
SELECT
	StoreType,
	SUM(EmployeeCount) AS 'Qtd. Total Funcionários'
FROM
	DimStore
GROUP BY StoreType

-- Ordenação Dos Resultados pela Marca e trazendo o custo médio de cada marca.
SELECT
	BrandName,
	AVG(UnitCost) AS 'Custo Médio'
FROM
	DimProduct
GROUP BY BrandName

-- Ordenação Dos Resultados pela Classe do Produto e trazendo o preço máximo de cada classe.
SELECT
	ClassName AS 'Classe do Produto',
	MAX(UnitPrice) AS 'Máximo Preço'
FROM
	DimProduct
GROUP BY ClassName

-- Ordenação dos resultados pela Soma de Funcionários e Agrupado pelo Tipo de Loja
SELECT
	StoreType,
	SUM(EmployeeCount) AS 'Qtd. Total Funcionários'
FROM
	DimStore
GROUP BY StoreType
ORDER BY SUM(EmployeeCount) DESC

-- Agrupando os dados da tabela DimProduct pela coluna ColorName e trazendo a quantidade total de produtos por cor, filtrando apenas os produtos da marca Contoso.
SELECT
	ColorName AS 'Cor do Produto',
	COUNT(ColorName) AS 'Qtd. Total'
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName

-- Agrupando os dados da tabela Dim Product pela coluna BrandName e trazendo a quantidade total de produtos por marca, filtrando apenas os produtos com preço unitário maior que 100.
/*
SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total Marca'
FROM
	DimProduct
WHERE ClassName = 'Economy'     -- Filtra a tabela original, antes do agrupamento
GROUP BY BrandName

HAVING COUNT(BrandName) >= 200  -- Filtra a tabela depois de agrupada
*/

SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total Marca'
FROM
	DimProduct
WHERE UnitPrice > 100
GROUP BY BrandName

HAVING COUNT(BrandName) >= 200

/*
    Diferença entre WHERE e HAVING:
    WHERE: Filtra os dados antes do agrupamento.
    HAVING: Filtra os dados depois do agrupamento.
*/


/*
	JOINS E CONEXÕES ENTRE TABELAS
	Os JOINs são utilizados para combinar dados de duas ou mais tabelas com base em uma coluna relacionada entre elas.
	Existem diferentes tipos de JOINs, cada um com suas características específicas:
		* INNER JOIN: Retorna apenas os registros que possuem correspondência em ambas as tabelas.
		* LEFT JOIN (ou LEFT OUTER JOIN): Retorna todos os registros da tabela à esquerda e os registros correspondentes da tabela à direita. Se não houver correspondência, os valores da tabela à direita serão nulos.
		* RIGHT JOIN (ou RIGHT OUTER JOIN): Retorna todos os registros da tabela à direita e os registros correspondentes da tabela à esquerda. Se não houver correspondência, os valores da tabela à esquerda serão nulos.
		* FULL OUTER JOIN: Retorna todos os registros de ambas as tabelas, preenchendo com valores nulos quando não houver correspondência.
		* LEFT OUTER JOIN (ANTI JOIN): Retorna todos os registros da tabela à esquerda que não possuem correspondência na tabela à direita.
		* RIGHT OUTER JOIN (ANTI JOIN): Retorna todos os registros da tabela à direita que não possuem correspondência na tabela à esquerda.
		* CROSS JOIN: Retorna o produto cartesiano de ambas as tabelas, combinando cada registro da primeira tabela com todos os registros da segunda tabela.
*/

/* Produtos */
CREATE TABLE produtos(
id_produto int,
nome_produto varchar(30),
id_subcategoria int)

INSERT INTO produtos(id_produto, nome_produto, id_subcategoria)
VALUES
	(1, 'Fone Bluetooth JBL', 5),
	(2, 'PS4', 6),
	(3, 'Notebook Samsung i3', 2),
	(4, 'iPhone 11', 1),
	(5, 'Moto G9', 1)


/*Sub Categoria dos Produtos */
CREATE TABLE subcategoria(
id_subcategoria int,
nome_subcategoria varchar(30))

INSERT INTO subcategoria(id_subcategoria, nome_subcategoria)
VALUES
	(1, 'Celular'),
	(2, 'Notebook'),
	(3, 'Cámera Digital'),
	(4, 'Televisão'),
	(5, 'Fone de Ouvido')

/* Início das Queries para a utilização dos tipos de JOIN's */
SELECT
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM produtos
LEFT JOIN subcategoria /* Retorna todos os registros da tabela à esquerda e os registros correspondentes da tabela à direita */
	ON produtos.id_subcategoria = subcategoria.id_subcategoria


SELECT
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM produtos
RIGHT JOIN subcategoria /* Retorna todos os registros da tabela à direita e os registros correspondentes da tabela à esquerda */
	ON produtos.id_subcategoria = subcategoria.id_subcategoria


SELECT
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM produtos
INNER JOIN subcategoria /* Retorna apenas os registros que possuem correspondência em ambas as tabelas */
	ON produtos.id_subcategoria = subcategoria.id_subcategoria


SELECT
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM produtos
FULL JOIN subcategoria /* Retorna todos os registros de ambas as tabelas, preenchendo com valores nulos quando não houver correspondência */
	ON produtos.id_subcategoria = subcategoria.id_subcategoria

SELECT
	produtos.id_produto,
	produtos.nome_produto,
	subcategoria.id_subcategoria,
	subcategoria.nome_subcategoria
FROM produtos
FULL JOIN subcategoria /* Retorna todos os registros de ambas as tabelas, preenchendo com valores nulos quando não houver correspondência */
	ON produtos.id_subcategoria = subcategoria.id_subcategoria


/************************************************************************/
-- LEFT (ANTI) JOIN
SELECT
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM produtos
LEFT JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE nome_subcategoria IS NULL


/************************************************************************/
-- RIGHT (ANTI) JOIN
SELECT
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM produtos
RIGHT JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE id_produto IS NULL


/************************************************************************/
-- FULL (ANTI) JOIN
SELECT
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM produtos
FULL JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE id_produto IS NULL OR nome_subcategoria IS NULL

/************************************************************************/
/* Joins Multiplos */
SELECT ProductKey, ProductName, ProductSubcategoryKey FROM DimProduct
SELECT ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryKey FROM DimProductSubcategory
SELECT ProductCategoryKey, ProductCategoryName FROM DimProductCategory

SELECT
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductCategoryName
FROM DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory
			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey


-- UNION: Nessa consulta, o UNION retorna apenas os registros distintos, eliminando duplicatas do resultado final.
SELECT
	*
FROM
	DimCustomer
WHERE Gender = 'F'
UNION
SELECT
	*
FROM
	DimCustomer
WHERE Gender = 'M'


-- UNION ALL: Nessa consulta, o UNION ALL retorna todos os registros, incluindo duplicados.
SELECT
	FirstName,
	BirthDate
FROM
	DimCustomer
WHERE Gender = 'F'
UNION ALL
SELECT
	FirstName,
	BirthDate
FROM
	DimCustomer
WHERE Gender = 'M'