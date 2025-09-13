Quinzena = 
IF(
    DAY(dCalendario[Datas]) <= 15,
    "1ª Quinzena do Mês",
    "2ª Quinzena do Mês"
)

Bimestre = 
SWITCH(
    TRUE(),
    MONTH(dCalendario[Datas]) <= 2, "1ª Bimestre",
    MONTH(dCalendario[Datas]) <= 4, "2ª Bimestre",
    MONTH(dCalendario[Datas]) <= 6, "3ª Bimestre",
    MONTH(dCalendario[Datas]) <= 8, "4ª Bimestre",
    MONTH(dCalendario[Datas]) <= 10, "5ª Bimestre",
    "6ª Bimestre"
)

Faixa Etária = 
SWITCH(
    TRUE(),
    dClientes[Idade] <= 19, "Jovem",
    dClientes[Idade] <= 59, "Adulto",
    "Sênior"
)


/* 
1º Opção: Usando SWITCH com TRUE()

SWITCH(
    TRUE(),
    dClientes[Nivel Escolar] = "Pós Graduação", 0.2,
    dClientes[Nivel Escolar] = "Superior Completo", 0.1,
    dClientes[Nivel Escolar] = "Superior Incompleto", 0.05,
    0
)
*/

-- 2ª Opção: Usando SWITCH com a coluna diretamente (Apenas com sinal de igual)
SWITCH(
    dClientes[Nivel Escolar],
    "Pós Graduação", 0.2,
    "Superior Completo", 0.1,
    "Superior Incompleto", 0.05,
    0
)



Preço Dia das Mães fvendas = 
IF(
    RELATED(dClientes[Genero]) = "Feminino" && RELATED(dClientes[Num Filhos]) >= 1 && MONTH(fVendas[Data da Venda]) = 5,
    ROUND(0.85 * RELATED(dProdutos[Preço Unitario]),2),
    RELATED(dProdutos[Preço Unitario])
) 


Dia Útil / Fim de Semana = 
IF(
    dCalendario[Dia da Semana] = 0 || dCalendario[Dia da Semana] = 6,
    "Fim de Semana",
    "Dia Útil"
)

Lucro fvendas = 
(RELATED(dProdutos[Preço Unitario]) * fVendas[Qtd Vendida]) - // FATURAMENTO
(RELATED(dProdutos[Custo Unitario]) * fVendas[Qtd Vendida]) - // CUSTO UNITÁRIO
((RELATED(dProdutos[Preço Unitario]) * fVendas[Qtd Vendida])*0.1) // IMPOSTO


Lucro Total = SUM(fVendas[Lucro])

Média por Transação = 
AVERAGE(fVendas[Faturamento])

%  Online = 
DIVIDE(
    CALCULATE(
        SUM(fVendas[Qtd Vendida]),
        dLojas[Tipo] = "Online"
    ),
    SUM(fVendas[Qtd Vendida])
)

%  Online = 
DIVIDE(
    SUM(fVendas[Qtd Vendida]),
    CALCULATE(
        SUM(fVendas[Qtd Vendida]),
        ALL (fVendas)
    ),
)

%  Produto = 
DIVIDE(
    [Total Vendas],
    CALCULATE(
        [Total Vendas],
        ALL(dProdutos)
    )
)


%  Produto Subtotal = 
DIVIDE(
    [Total Vendas],
    CALCULATE(
        [Total Vendas],
        ALL(dProdutos[Nome Produto])
    )
)

Fat Total = 
SUMX(
    fVendas,
    fVendas[Qtd Vendida]*fVendas[Preço Unitário]
)

Fat Total = 
SUMX(
    fVendas,
    fVendas[Qtd Vendida]*RELATED(dProdutos[Custo Unitario])
)

Lucro Média= 
AVERAGEX(
    fvendas,
    (fvendas[Qtd Vendida] * RELATED (dProduto[Preço Unitario]))*0.9 --(desconto do imposto)
    - (fvendas[Qtd Vendida] * RELATED (dProduto[Preço Unitario]))
)

CALENDAR (
    DATE(2020,1,31),
    DATE(2025,12,31)
)

CALENDAR (
    DATE(year(MIN(fVendas[data])),1,31),
    DATE(year(MAX(fVendas[data])),12,31)
)

CALENDAR (
    MIN(fVendas[data]),
    MAX(fVendas[data])
)

YEAR (fVendas[data])
MONTH (fVendas[data])
DAY (fVendas[data]
FORMAT (fVendas[data]), "mmmm") -- mês em texto
FORMAR (fVendas[data], "YYYY-MM") -- ano mês

STARTOFMONTH(fVendas[data]) -- Data inicio


/* INTELIGÊNCIA DE TEMPO */

/* Acumulado do Ano - Year to Date */
CALCULATE(Medida; DATESYTD(dCalendario[data])) -- LISTA DE DATAS 
TOTALYTD (Medida; dCalendario[data])

/* Acumulado do Mês - Month to Date */
CALCULATE(Medida; DATESMTD(dCalendario[data]))
TOTALMTD(Medida; dCalendario[data])

/* Acumulado do Trimestre - Quarter to Date */
CALCULATE(Medida; DATESQTD(dCalendario))
TOTALQTD(Medida; dCalendario[Date])

/* Year over Year */
CALCULATE(
    Medida,
    PARALLELPERIOD(Calendario[Datas], -12; MONTH )
)
    
/* Month over Month */
CALCULATE(
    Medida,
    PARALLELPERIOD(Calendario[Datas], -1; MONTH )
)

/* Calcular dias úteis - Parecido com Excel / DIAS DA SEMANA*/
NETWORKDAYS (fBase [ínicio], fBase[fim], 1, dCalendário - uma tabela com apenas uma coluna!)

1-Sáb.Dom
2-Dom.Segu
3-Seg.Terça
4-Ter-Qua
    até
7-Sex.Sáb
    ...
11-Somente Domingo
    ...
17-Somente Sábado

/* Calcula o valor no mês anterior */
CALCULATE(
    Medida,
    DATEADD(
        dCalendario[Data],
        -1;
        MONTH
    )
)

/* Calcula o Acumulado dos últimos 15 dias */
CALCULATE(
    Medida,
    DATESINPERIOD(
        MAX(
            dCalendario[data]
        ),
        -15,
        DAY
    )
)


CALCULATE(
    [Faturamento],
    DATESYTD(dCalendario[Data])
)

TOTALYTD(
    [Faturamento],
    dCalendario[Data],
    dLojas[Tipo] = "Online"
)


TOTALYTD(
    [Faturamento],
    dCalendario[Data],
    "12/25"
)

Faturamento Mês Anterior =
CALCULATE(
    [Faturamento],
    DATEADD(
        dCalendario[Data],
        -1,
        MONTH
    )
)


% Crescimento Mês Anterior MoM =
DIVIDE(
    ([Faturamento] -
    CALCULATE(
        [Faturamento],
        DATEADD(
            dCalendario[Data],
            -1,
            MONTH
        )
    )), 
    CALCULATE(
        [Faturamento],
        DATEADD(
            dCalendario[Data],
            -1,
            MONTH
        )
    ), 0
)


Faturamento Ano Anterior =
CALCULATE(
    [Faturamento],
   DATEADD(
        dCalendario[Data],
        -1,
        YEAR
    )
)

% Crescimento Ano Anterior YoY =
DIVIDE(
    [Faturamento] - [Faturamento Ano Anterior],
    [Faturamento Ano Anterior],
    0
)

-- Ajuste na matriz de datas para evitar erro de divisão por zero
IF(
    HASONEVALUE(dCalendario[Ano]),
    DIVIDE(
        [Faturamento] - [Faturamento Ano Anterior],
        [Faturamento Ano Anterior],
        0
    ),
    0
)

CALENDAR (
    DATE(year(MIN(fVendas[data])),1,31),
    DATE(year(MAX(fVendas[data])),12,31)
)

-- Filtra as Datas Corretas para os dados onde messes não possuem registro de venda
DATA VIGENTE =
IF(
    dCalendario[Datas] <= MAX(fVendas[Data da Venda]),
    "Vigente",
    "Data Futura"
)



Faturamento YTD Acumulado =
TOTALYTD (Medida; dCalendario[data])

Faturamento YTD LY =
CALCULATE(
    TOTALYTD (Medida; dCalendario[data]),
    DATEADD(dCalendario[data], -1, YEAR)
)

IF(
    HASONEVALUE(dCalendario[Ano]),
    DIVIDE(
        [Faturamento YTD Acumulado] - [Faturamento YTD LY],
        [Faturamento YTD LY],
        0
    ),
    0
)


--Quantidade Acumulada dos Últimos 15 Dias =
CALCULATE(
    [Inscricao],
    DATESINPERIOD(
        dCalendario[Data],
        MAX(dCalendario[Data]),
        -15,
        DAY
    )
)

--Média Móvel Diária dos Últimos 15 Dias =
CALCULATE(
    AVERAGE([Inscricao]),
    DATESINPERIOD(
        dCalendario[Data],
        MAX(dCalendario[Data]),
        -15,
        DAY
    )
)

-- Crescimento Lucro Mês Anterior MoM =
% Crescimento Lucro YoY = 
VAR lucroAnterior =
    CALCULATE(
        [Lucro Total],
        DATEADD(dCalendario[Datas], -12, MONTH)
    )

VAR crescimento = 
    DIVIDE(
        [Lucro Total] - lucroAnterior,
        lucroAnterior
    )

RETURN
    IF(
        HASONEVALUE(dCalendario[Ano]) && NOT ISBLANK(crescimento),
        crescimento,
        "N/A"
    )

Faturamento YTD LY = 
VAR Cond = 
CALCULATE(
    [Faturamento YTD],
    DATEADD(dCalendario[Datas],-12, MONTH)
)

RETURN 
IF(
    HASONEVALUE(dCalendario[Ano]),
    Cond
)



Período Selecionado = 
VAR qtdAnosSelecionados = CALCULATE(DISTINCTCOUNT(dCalendario[Ano]))
VAR qtdMesesSelecionados = CALCULATE(DISTINCTCOUNT(dCalendario[Mês]))

RETURN
IF(
    qtdAnosSelecionados = 0 && qtdMesesSelecionados = 0,
    "Nenhum Filtro Aplicado",
    "Ano: " &
        IF(
            qtdAnosSelecionados = 1,
            SELECTEDVALUE(dCalendario[Ano]),
            "Vários Anos"
        ) &
        UNICHAR(10) &
    "Mês: " &
        IF(
            qtdMesesSelecionados = 1,
            SELECTEDVALUE(dCalendario[Mês]),
            "Vários Meses"
        )
)



"Produção Filtrada: " &
IF(/*CONDIÇÃO*/
    ISBLANK(SELECTEDVALUE(Calendario[ANO])) && ISBLANK(SELECTEDVALUE(Calendario[Nome do Mês]))
    && ISBLANK(SELECTEDVALUE(dRegionais_PontoVenda[Regional]))&& ISBLANK(SELECTEDVALUE(dRegionais_PontoVenda[NM_Tipo_Ponto_Venda])) 
    && ISBLANK(SELECTEDVALUE(dRegionais_PontoVenda[NM_Fantasia])),
    "Nenhum Filtro Aplicado",
    /*ELSE*/
    " Ano >> " & IF(
                /* CONDIÇÃO */
                ISBLANK(SELECTEDVALUE(Calendario[ANO])),
                "Vários Anos " & UNICHAR(10),
                /*ELSE*/
                SELECTEDVALUE(Calendario[ANO])&" "
            ) & UNICHAR(10) &
    " Mês >> " & IF(
                /* CONDIÇÃO */
                ISBLANK(SELECTEDVALUE(Calendario[Nome do Mês])),
                "Vários Meses " & UNICHAR(10),
                /* ELSE */
                SELECTEDVALUE(Calendario[Nome do Mês])&" "
            ) 
    )


Tabela Produtos = /*ALL(dProdutos[Nome Produto])*/ TOPN(5,ALL(dProdutos[Nome Produto]),[Total Vendas])

--Ranking Equipe por Hierarquia =
IF(
    ISINSCOPE(dEquipe[NM_Comissionado]),
    RANKX(
    ALL(dEquipe[NM_Comissionado]),
    [Fat_Total],
    ,
    DESC,
    Dense),
    BLANK()
)

IF(
    ISINSCOPE(dCalendario[Mês]),
        RANKX(
            ALLSELECTED(dCalendario[Mês]),
            [Fat_Total],
            ,
            DESC,
            Dense
    ),
    
    RANKX(
        ALLSELECTED(dCalendario[Ano]),
        [Fat_Total],
        ,
        DESC,
        Dense
    )
)    

    
/* Modelo Normal */
OBS: Vendas * 1.000.000 + Fat * 1 -> Critério de Desempate 
    
IF(
    HASONEVALUE(dEquipe[NM_Comissionado]),
    RANKX(
    ALL(dEquipe[NM_Comissionado]), /*ALLSELECTED(dEquipe[NM_Comissionado])*/
    [Fat_Total],
    ,
    DESC,
    Dense),
    BLANK()
)
    
-- TOPN Produto Mais Vendido
Produtos mais Vendido = CALCULATE(
    MAX(dProdutos[Nome Produto]),
    TOPN(1,ALL(dProdutos[Nome Produto]),[Total Vendas])
)

Produtos mais Vendido % = DIVIDE(
    CALCULATE(
        [Total Vendas],
        TOPN(1,ALL(dProdutos[Nome Produto]),[Total Vendas])
    ),
    [Total Vendas],
    0
)

Produtos mais Vendido QTD = CALCULATE(
    [Total Vendas],
    TOPN(1,ALL(dProdutos[Nome Produto]),[Total Vendas])
)


ADDCOLUMMS(
    TOPN(15, ALL(dClientes[Nome]),[Fat]),
    "Total",
    [Fat]
)


SUMX(
    TOPN(5, ALL(dClientes[Marcas]),[Fat]),
    [Fat]
)

    OU
    
CALCULATE(
    [Total Vendas],
    TOPN(1,ALL(dProdutos[Nome Produto]),[Total Vendas])
)



-- FILTER & VALUES

COUNTROWS(
    FILTER(
        VALUES('Produtos'[Marca]),
        [% Devoluções] <= 0.0115 
    )
)




-- CROSSJOIN -> LISTA OS VALORES (VALUES) COM BASE EM CONEXÕES PRÉVIAS
TABELA:
CROSSJOIN (
    VALUES('Base Vendas'[ID_Cliente]),
    VALUES('Calendário'[Ano])
)


MAXX(
    CROSSJOIN (
        VALUES('Base Vendas'[ID_Cliente]),
        VALUES('Calendário'[Ano])
    ),
    [FAT TOTAL]
)



CALCULATE(
    [Total Fat],
    FILTER ( 'Cadastro Prod.',
    'Cadastro Prod' [Nome da Marca] = "1234Zap",
    'Cadastro Prod' [Tipo] = "Luxo"
    )
)

CALCULATE(
    [Total Fat],
    FILTER ( 'Cadastro Prod.',
        CONSTAINSSTRING('Cadastro Prod.'[Nome], "Bluetooth")
    )
)


CALCULATE(
    [Total de Vendas],
    FILTER(
        'Cadastro Promocoes',
        CONSTAINSSTRING('Cadastro Promocoes'[Nome], "Férias")
    )
)


CALCULATE (
    [Faturamento Total],
    FILTER(
        ALL(CALENDARIO),
        Calendario[Datas] <= MAX (Calendario [Datas])
    )
)


/* Agrupar Tabelas - Ele resume os dados exemplo temos vários pedidos de um cliente.... com essa fórmula eu consigo reumir e obter o total! */
SUMMARIZE( 
    fPedidos, 
    fPedidos [id_pedido],
    fPedidos [cliente],
    fPedidos [marca],
    "TOTAL PAGO", SUM(fPedidos [faturamento])
)

/* Tabela Filtrada */
SUMMARIZE(
    FILTER(
        fBase,
        DATEDIFF(
            fBase[Data_Venda],
            TODAY(),
            MONTH
        ) > fBase[Total_Parcelas]
    ),
    fPedidos [id_pedido],
    fPedidos [cliente],
    fPedidos [marca],
    "TOTAL PAGO", SUM(fPedidos [faturamento])
)

/* Valor Médio */
AVERAGEX(
    SUMMARIZE(
        FILTER(
            fBase,
            DATEDIFF(
                fBase[Data_Venda],
                TODAY(),
                MONTH
            ) > fBase[Total_Parcelas]
        ),
        fPedidos [id_pedido],
        fPedidos [cliente],
        fPedidos [marca],
        "TOTAL PAGO", SUM(fPedidos [faturamento])
    ),
    [TOTAL PAGO]
)


/* Valor a Ser Pago */
Fat * Total de Parcelas

VAR faltante = CALCULATE ([TOTAL A SER PAGO] - [TOTAL PAGO])
VAR pago = SUM(fPedidos [faturamento])
VAR a_ser_pago = Fat * Total de Parcelas
VAR inadimplência = DIVIDE([FALTANTE],[TOTAL A SER PAGO],0)

RETURN

SUMMARIZE( 
    fPedidos, 
    fPedidos [cliente],
    "TOTAL PAGO", pago,
    "TOTAL A SER PAGO", a_ser_pago,
    "FALTANTE", faltante,
    "% INADIMPLÊNCIA", inadimplência
)
