-- LEN: Descubra a quantidade de caracteres da palavra 'SQL Hashtag'
SELECT
	LEN('SQL Hashtag') AS 'Len',
	DATALENGTH('SQL Hashtag') AS 'Datalength'


-- CONCAT: Permite juntar mais de um texto em uma única palavra
SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	EmailAddress AS 'E-mail',
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo'
FROM
	DimCustomer


-- LEFT: Extrai uma determinada quantidade de caracteres de um texto, da esquerda para a direita
-- RIGHT: Extrai uma determinada quantidade de caracteres de um texto, da direita para a esquerda
-- Exemplo: Faça uma consulta à tabela DimProduct e divida a coluna de StyleName em 2 partes
SELECT * FROM DimProduct
SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Preço',
	LEFT(StyleName, 7) AS 'Cod 1',
	RIGHT(StyleName, 7) AS 'Cod 2'
FROM
	DimProduct

-- CONCAT: Permite concatenar valores
-- REPLACE: Substituir valores
SELECT * FROM DimCustomer
SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	Gender AS 'Sexo (Abrev)',
	REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') AS 'Sexo (Extenso)'
FROM
	DimCustomer

/* 
TRANSLATE e STUFF: Outras funções de substituição 
TRANSLATE: Subistitui caracteres de uma string por outros caracteres
STUFF: Subistituição de uma parte de uma string por outra string, a partir de uma posição específica
*/
SELECT TRANSLATE('3*[2+1]/{8-4}', '[]{}', '()()')
SELECT TRANSLATE('ABCD-490123', 'ABCD', 'WXYZ')
SELECT STUFF('VBA Impressionador', 1, 3, 'Excel')

-- UPPER: Transforma um texto em maiúscula
-- LOWER: Transforma um texto em minúscula
SELECT * FROM DimCustomer
SELECT
	UPPER(FirstName) AS 'NOME',
	LOWER(FirstName) AS 'nome',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer

-- Formatação de Data utilizando GETDATE() e FORMAT()
SELECT 
	GETDATE() AS 'Data',
	FORMAT(GETDATE(),'dd/MMMM/yyyy','pt-br') AS 'Data Formatada'

-- Formatação de Número
SELECT 
	50123 AS 'Número',
	FORMAT(5123, '000000.00') AS 'Número Formatado'

-- Formatação de Moeda
SELECT 
	3670.5 AS 'Moeda',
	FORMAT(5670.5, 'R$####.00') AS 'Moeda Formatada'


-- Formatar as colunas de Data de Nascimento e Renda Anual da tabela DimCustomer, de acordo com as formatações aprendidas.
SELECT
	FirstName AS 'Nome',
	BirthDate AS 'Data de Nascimento',
	FORMAT(BirthDate, 'dd/MMMM/yyyy', 'pt-BR') AS 'Data Formatada',
	YearlyIncome AS 'Renda Anual',
	FORMAT(YearlyIncome, 'R$##,###.00') AS 'Renda Anual Formatada'
FROM
	DimCustomer


-- CHARINDEX: Descobre a posição de um determinado caractere dentro de um texto
-- SUBSTRING: Extrai alguns caracteres de dentro de um texto
SELECT CHARINDEX('Moreno', 'Raquel Moreno') AS 'Posição Sobrenome'
SELECT SUBSTRING('Raquel Moreno', 8, 6) AS 'Sobrenome'
SELECT 'Marcus Cavalcanti' AS 'Nome'
SELECT CHARINDEX(' ', 'Marcus Cavalcanti') AS 'Posição'
SELECT SUBSTRING('Marcus Cavalcanti', CHARINDEX(' ', 'Marcus Cavalcanti') + 1, 100) AS 'Sobrenome'


-- TRIM: Retira espaços adicionais à esquerda e à direita do texto
-- LTRIM: Retira espaços adicionais à esquerda do texto
-- RTRIM: Retira espaços adicionais à direita do texto
-- Utilize as funções acima no código '   ABC123   '

DECLARE @varCodigo VARCHAR(50)
SET @varCodigo = '   ABC123   '

SELECT
	TRIM(@varCodigo) AS 'Trim',
	LTRIM(@varCodigo) AS 'Ltrim',
	RTRIM(@varCodigo) AS 'Rtrim'

SELECT
	DATALENGTH(TRIM(@varCodigo)) AS 'Trim',
	DATALENGTH(LTRIM(@varCodigo)) AS 'Ltrim',
	DATALENGTH(RTRIM(@varCodigo)) AS 'Rtrim'


-- DATEADD: Adiciona ou subtrai uma determinada quantidade de dias, meses ou anos a uma data
-- DATEDIFF: Calcula a diferença entre duas datas
DECLARE @varData1 DATETIME, @varData2 DATETIME, @varData3 DATETIME
SET @varData1 = '10/07/2020'
SET @varData2 = '05/03/2020'
SET @varData3 = '14/11/2021'

-- DATEADD
SELECT
	DATEADD(MONTH, -1, @varData1)

-- DATEDIFF
SELECT
	DATEDIFF(MONTH, @varData2, @varData3)



-- Utilize as funções DAY, MONTH e YEAR para descobrir o dia, més e ano da data: 18/05/2020
DECLARE @varData DATETIME
SET @varData = '18/05/2020'

SELECT
	DAY(@varData) AS 'Dia',
	MONTH(@varData) AS 'Més',
	YEAR(@varData) AS 'Ano'


-- Utilize a função DATEFROMPARTS para obter uma data a partir das informações de dia, més e ano
DECLARE @varDia INT, @varMes INT, @varAno INT
SET @varDia = 29
SET @varMes = 12
SET @varAno = 2020

SELECT
	DATEFROMPARTS(@varAno, @varMes, @varDia) AS 'Data'



-- GETDATE: Retorna a data/hora atual do sistema
-- SYSDATETIME: Retorna a data/hora atual do sistema (mais preciso que a GETDATE)
-- DATENAME e DATEPART: Retornam informações (dia, més, ano, semana, etc) de uma data
SELECT GETDATE()
SELECT SYSDATETIME()

-- DATENAME: Retorna o resultado em formato de TEXTO
DECLARE @varData DATETIME
SET @varData = GETDATE()
SELECT
	DATENAME(DAY, @varData) AS 'Dia',
	DATENAME(MONTH, @varData) AS 'Més',
	DATENAME(YEAR, @varData) AS 'Ano',
	DATENAME(DAYOFYEAR, @varData) AS 'Dia do ano'

-- DATEPART: Retorna o resultado em formato de NÚMERO
DECLARE @varData DATETIME
SET @varData = GETDATE()
SELECT
	DATEPART(DAY, @varData) AS 'Dia',
	DATEPART(MONTH, @varData) AS 'Més',
	DATEPART(YEAR, @varData) AS 'Ano',
	DATEPART(DAYOFYEAR, @varData) AS 'Dia do ano'

SELECT
	SQL_VARIANT_PROPERTY(DATENAME(DAY, @varData), 'BaseType'),
	SQL_VARIANT_PROPERTY(DATEPART(DAY, @varData), 'BaseType')