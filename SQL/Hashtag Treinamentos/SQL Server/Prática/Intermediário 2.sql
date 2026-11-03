/* Variáveis */

DECLARE @Nome VARCHAR(50) = 'Carla'
DECLARE @Idade INT = 30
DECLARE @Cidade VARCHAR(50) = 'São Paulo'
DECLARE @Salario DECIMAL(10,2) = 5000.00
DECLARE @DataNascimento DATE = '1993-05-15'
DECLARE @Ativo BIT = 1


SELECT 
    10+20 AS 'Soma', 
    10-5 AS 'Subtração', 
    10*2 AS 'Multiplicação', 
    10/2 AS 'Divisão'

# Declarando variáveis com tipos de dados diferentes
# SQL_VARIANT_PROPERTY: É usada para verificar o tipo de dados de uma variável
SELECT SQL_VARIANT_PROPERTY(@Nome, 'BaseType') AS 'Tipo de Dados Nome',
       SQL_VARIANT_PROPERTY(@Idade, 'BaseType') AS 'Tipo de Dados Idade',
       SQL_VARIANT_PROPERTY(@Cidade, 'BaseType') AS 'Tipo de Dados Cidade',
       SQL_VARIANT_PROPERTY(@Salario, 'BaseType') AS 'Tipo de Dados Salario',
       SQL_VARIANT_PROPERTY(@DataNascimento, 'BaseType') AS 'Tipo de Dados DataNascimento',
       SQL_VARIANT_PROPERTY(@Ativo, 'BaseType') AS 'Tipo de Dados Ativo'

# CAST - Convertendo tipos de dados
SELECT CAST (20 AS VARCHAR(10)) AS 'Convertendo Inteiro para String',
       CAST ('2024-06-15' AS DATETIME) AS 'Convertendo String para Data',
       CAST (5000.00 AS INT) AS 'Convertendo Decimal para Inteiro',
       CAST (1 AS BIT) AS 'Convertendo Inteiro para Booleano'

# TESTE
SELECT SQL_VARIANT_PROPERTY(CAST (20 AS VARCHAR(10)), 'BaseType') AS 'Tipo de Dados Convertido Inteiro para String',
       SQL_VARIANT_PROPERTY(CAST ('2024-06-15' AS DATETIME), 'BaseType') AS 'Tipo de Dados Convertido String para Data',
       SQL_VARIANT_PROPERTY(CAST (5000.00 AS INT), 'BaseType') AS 'Tipo de Dados Convertido Decimal para Inteiro',
       SQL_VARIANT_PROPERTY(CAST (1 AS BIT), 'BaseType') AS 'Tipo de Dados Convertido Inteiro para Booleano'

# FORMAT: Formatação dos Dados
SELECT FORMAT(@Salario, 'C', 'pt-br') AS 'Salário'
SELECT FORMAT('21/03/2004', 'dd/MM/yyyy') AS 'Data Formatada'
SELECT FORMAT (CAST('2024-03-21' AS DATETIME), 'dd/MM/yyyy') AS 'Data Formatada 2'
SELECT FORMAT(@Cpf, '###.###.###-##') AS 'CPF'

# ROUND: Arredondamento
SELECT ROUND(@Salario, 2) AS 'Sálario Formatado'
SELECT ROUND(@Salario, 2, 1) AS 'Sálario Formatado'

# FLOOR: Arrendodamento para baixo
SELECT FLOOR(@Salario) AS 'Sálario Formatado para Baixo'

# CEILING: Arrendodamento para Cima
SELECT CEILING(@Salario) AS 'Sálario Formatado para Cima'


# DECLARE_ e SET_ Comandos de declaração e atribuição de valores
DECLARE @Salario DECIMAL(10,2)
SET @Salario = 5000.00

DECLARE @Data DATETIME 
SET @Data = GETDATE()

SELECT @Salario, @Data

# EXEMPLO DE COMANDO UTILIZANDO AS MÉTRICAS
DECLARE @Data DATETIME
SET @Data >= '2001-12-31'

SELECT
    FirstName AS 'NOME',
    LastName AS 'SOBRENOME',
    BirthDate AS 'NASCIMENTO',
    Cliente AS 'TIPO'
FROM DimCustomer
WHERE BirthDate = @Data

UNION

SELECT
    FirstName AS 'NOME',
    LastName AS 'SOBRENOME',
    BirthDate AS 'NASCIMENTO',
    Cliente AS 'TIPO'
FROM DimCustomer
WHERE BirthDate >= @Data

# Exemplo de armazenamento de valores em consultas
DECLARE @LojasOnlines INT
SET @LojasOnlines = (SELECT COUNT(*) FROM DimStore WHERE StoreType = 'Online')
SELECT @LojasOnlines AS 'Total de Lojas Online'

# COMANDO PRINT: Ele basicamente imprime uma mensagem na tela, que pode ser usada para depuração durante a execução de um script. Ele é útil para exibir informações
PRINT 'Total de Lojas Online: ' + CAST(@LojasOnlines AS VARCHAR(10))


# EXEMPLO
DECLARE @idProdutoMaisVendido VARCHAR(4)
DECLARE @TotalMaisVendido INT

SELECT TOP(1)
    @idProdutoMaisVendido = ProductKey,
    @TotalMaisVendido = SalesQuantity
FROM FactSales
WHERE ProductKey = 2495
ORDER BY @TotalMaisVendido DESC

PRINT 'O produto mais vendido é: ' + CAST(@idProdutoMaisVendido AS VARCHAR(10)) + ' com um total de vendas de: ' + CAST(@TotalMaisVendido AS VARCHAR(10))


# Mais um novo exemplo de armazenamento de valores em consultas
DECLARE @ListaNome VARCHAR(50)
SET @ListaNome = (SELECT TOP(1) FirstName FROM DimCustomer ORDER BY FirstName DESC)
SELECT @ListaNome AS 'Nome do Cliente'

# Outra opção

DECLARE @ListaNome2 VARCHAR(50)
SET @ListaNome2 = ''

SELECT 
    @ListaNome2 = @ListaNome2 + FirstName + ', ' + CHAR(10)
FROM DimCustomer
WHERE DepartamentName = 'Sales' and Gender = 'M'

PRINT LEFT (@ListaNome2, LEN(@ListaNome2) - 2) 
# OU UTILIZANDO O DATALENGTH PARA RETIRAR OS DOIS ÚLTIMOS CARACTERES
PRINT LEFT (@ListaNome2, DATALENGTH(@ListaNome2))

/*
@@ - Variáveis Globais

    @@SERVERNAME: Nome do Servidor
    @@VERSION: Versão do SQL Server
    @@LangID: ID do idioma
    @@LANGUAGE: Idioma do Servidor
    @@ROWCOUNT: Retorna o número de linhas afetadas

    Dentre outros
*/

# EXEMPLOS PRÁTICOS E SIMPLES DE VARIÁVEIS 
DECLARE @X INT
DECLARE @Y INT

SET @X = 10
SET @Y = 20

DECLARE @Soma FLOAT
DECLARE @Subtração FLOAT
DECLARE @Multiplicação FLOAT
DECLARE @Divisão FLOAT

SET @Soma = @X + @Y
SET @Subtração = @X - @Y
SET @Multiplicação = @X * @Y
SET @Divisão = @X / @Y

SELECT 
    @Soma AS 'Soma',
    @Subtração AS 'Subtração',
    @Multiplicação AS 'Multiplicação',
    ROUND(@Divisão,2) AS 'Divisão'


# OUTRO EXEMPLO
DECLARE @Produto VARCHAR(50)
SET @Produto = 'Celular'

DECLARE @Quantity INT
SET @Quantity = 12

DECLARE @Price DECIMAL(10,2)
SET @Price = 9.99

DECLARE @Total DECIMAL(10,2)
SET @Total = @Quantity * @Price

SELECT 
    @Produto AS 'Produto',
    @Quantity AS 'Quantidade',
    ROUND(@Price, 2) AS 'Preço Unitário',
    ROUND(@Total, 2) AS 'Faturamento'


# OUTRO EXEMPLO LISTA
DECLARE @ListaRegistros VARCHAR(MAX)
SET @ListaRegistros = ''

SELECT
    @ListaRegistros = @ListaRegistros + FirstName + ' ' + LastName + ' - ' + BirthDate + CHAR(10)
FROM DimCustomer
WHERE BirthDate >= '2000-01-01'
ORDER BY BirthDate DESC


# MAIS UM EXEMPLO
DECLARE @ListaLojasFechadas VARCHAR(MAX)
SET @ListaLojasFechadas = ''

SELECT
    @ListaLojasFechadas = @ListaLojasFechadas + StoreName + ' - ' + StoreType + CHAR(10)
FROM DimStore
WHERE StoreStatus = 'Fechada'

# SUBQUERY

DECLARE @IdSubCategoria INT
DECLARE @SubCategoria VARCHAR(50)

SET @IdSubCategoria = (SELECT TOP(1) ProductSubcategoryKey FROM DimProductSubcategory WHERE ProductSubcategoryName = 'Mountain Bikes')
SET @SubCategoria = (SELECT ProductSubcategoryName FROM DimProductSubcategory WHERE ProductSubcategoryKey = @IdSubCategoria)