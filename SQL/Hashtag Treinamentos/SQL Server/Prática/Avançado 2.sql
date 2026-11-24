/* 
    SUBQUERY - CONSULTA DENTRO DE OUTRA CONSULTA 

    UTILIZAR DENTRO DE WHERE, SELECT OU DENTRO DE UM FROM.
    EXISTEM VÁRIAS FORMAS DE UTILIZAR, PORTANTO O IDEAL É 
    FICAR DE OLHO.
*/

SELECT 
    AVG(UnitCost)
FROM DimProduct
WHERE StoreKey IN (
    SELECT 
        StoreKey
    FROM
        DimStore
    WHERE EmployeeCount >= 100
)

# ANY e SOME
SELECT * FROM Funcionários WHERE idade >= ANY(SELECT idade FROM Funcionários WHERE sexo = 'M')

#ALL
SELECT * FROM Funcionários WHERE idade > ALL(SELECT idade FROM Funcionários WHERE sexo = 'M')
