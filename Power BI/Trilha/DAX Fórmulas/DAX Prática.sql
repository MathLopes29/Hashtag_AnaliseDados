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

