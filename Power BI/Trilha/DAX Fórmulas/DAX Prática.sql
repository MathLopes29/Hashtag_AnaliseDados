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