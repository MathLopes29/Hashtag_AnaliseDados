-- Principais Fórmulas DAX


/*******************************************************

                    MATEMÁTICAS E LÓGICAS

*******************************************************/
SUM('Tabela'[Coluna])
AVERAGE('Tabela'[Coluna])
COUNT('Tabela'[Coluna])
COUNTROWS('Tabela')
DISTINCTCOUNT('Tabela'[Coluna])

CALCULATE(
    SUM('Tabela'[Coluna]),
    'Tabela'[Coluna] > 10
)

DIVIDE(
    SUM('Tabela'[Coluna1]),
    SUM('Tabela'[Coluna2])
)

MAX('Tabela'[Coluna])
MIN('Tabela'[Coluna])


/*******************************************************

                    FÓRMULA LÓGICAS

*******************************************************/

IF(
    'Tabela'[Coluna] > 10,
    "Maior que 10",
    "Menor ou igual a 10"
)

SWITCH(
    TRUE(),
    'Tabela'[Coluna] = 1, "Opção 1",
    'Tabela'[Coluna] = 2, "Opção 2",
    "Outro"
)

AND(
    'Tabela'[Coluna1] > 10,
    'Tabela'[Coluna2] < 20
)

OR(
    'Tabela'[Coluna1] > 10,
    'Tabela'[Coluna2] < 20
)

IFERROR(
    DIVIDE(SUM('Tabela'[Coluna1]), SUM('Tabela'[Coluna2])),
    0
)

NOT(
    'Tabela'[Coluna] = "Valor"
)


/*******************************************************

                    FÓRMULA ITERADORAS - TABELAS FATOS NORMALMENTE

*******************************************************/

COALESCE(
    'Tabela'[Coluna1],
    'Tabela'[Coluna2],
    0
)

SUMX(
    'Tabela',
    'Tabela'[Coluna1] * 'Tabela'[Coluna2]
)

AVERAGEX(
    'Tabela',
    'Tabela'[Coluna1] * 'Tabela'[Coluna2]
)

MAXX(
    'Tabela',
    'Tabela'[Coluna]
)

MINX(
    'Tabela',
    'Tabela'[Coluna]
)

COUNTX(
    'Tabela',
    'Tabela'[Coluna]
)

RANKX(
    'Tabela',
    'Tabela'[Coluna],
    ,
    DESC
)


/*******************************************************

                    FÓRMULA DE FILTRO E TABELA

*******************************************************/

CALCULATETABLE(
    'Tabela',
    'Tabela'[Coluna] > 10
)

CALCULATE(
    SUM('Tabela'[Coluna]),
    FILTER(
        'Tabela',
        'Tabela'[Coluna] > 10
    )
)

FILTER(
    'Tabela',
    'Tabela'[Coluna] > 10
)

ALL(
    'Tabela'[Coluna]
)

ALLSELECTED(
    'Tabela'[Coluna]
)

ALLEXCEPT(
    'Tabela',
    'Tabela'[Coluna1],
    'Tabela'[Coluna2]
)

RELATED(
    'OutraTabela'[Coluna]
)

DISTINCT(
    'Tabela'[Coluna]
)

VALUES(
    'Tabela'[Coluna]
)

EARLIER(
    'Tabela'[Coluna]
)

HASONEVALUE(
    'Tabela'[Coluna]
)

HASONEFILTER(
    'Tabela'[Coluna]
)

ISFILTERED(
    'Tabela'[Coluna]
)

USERELATIONSHIP(
    'Tabela'[Coluna1],
    'OutraTabela'[Coluna2]
)

CROSSJOIN(
    'Tabela1',
    'Tabela2'
)

ADDCOLUMNS(
    'Tabela',
    "NovaColuna", 'Tabela'[Coluna1] + 'Tabela'[Coluna2]
)

TOPN(
    'Tabela',
    10
)


/*******************************************************

                    DATA E HORA

*******************************************************/


DATEDIFF(
    'Tabela'[Data1],
    'Tabela'[Data2],
    DAY
)

YEAR(
    'Tabela'[Data]
)

MONTH(
    'Tabela'[Data]
)

DAY(
    'Tabela'[Data]
)

HOUR(
    'Tabela'[Data]
)

MINUTE(
    'Tabela'[Data]
)

SECOND(
    'Tabela'[Data]
)

TODAY()

NOW()


DATESYTD(
    'Tabela'[Data]
)

DATESQTD(
    'Tabela'[Data]
)

DATESMTD(
    'Tabela'[Data]
)

TOTALYTD(
    SUM('Tabela'[Coluna]),
    'Tabela'[Data]
)

TOTALQTD(
    SUM('Tabela'[Coluna]),
    'Tabela'[Data]
)

TOTALMTD(
    SUM('Tabela'[Coluna]),
    'Tabela'[Data]
)

DATEADD(
    'Tabela'[Data],
    1,
    DAY
)

DATESINPERIOD(
    'Tabela'[Data],
    LASTDATE('Tabela'[Data]),
    -30,
    DAY
)

DATESBETWEEN(
    'Tabela'[Data],
    DATE(2023, 1, 1),
    DATE(2023, 12, 31)
)

PARALLELPERIOD(
    'Tabela'[Data],
    -1,
    YEAR
)