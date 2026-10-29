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
SELECT SQL_VARIANT_PROPERTY(@Nome, 'BaseType') AS 'Tipo de Dados Nome',
       SQL_VARIANT_PROPERTY(@Idade, 'BaseType') AS 'Tipo de Dados Idade',
       SQL_VARIANT_PROPERTY(@Cidade, 'BaseType') AS 'Tipo de Dados Cidade',
       SQL_VARIANT_PROPERTY(@Salario, 'BaseType') AS 'Tipo de Dados Salario',
       SQL_VARIANT_PROPERTY(@DataNascimento, 'BaseType') AS 'Tipo de Dados DataNascimento',
       SQL_VARIANT_PROPERTY(@Ativo, 'BaseType') AS 'Tipo de Dados Ativo'