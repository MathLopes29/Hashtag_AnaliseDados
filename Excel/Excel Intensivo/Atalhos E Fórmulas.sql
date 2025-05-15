CRTL + SPACE -- SELECIONE COLUNA
Shift + SPACE -- SELECIONE LINHA 
CRTL + Shift + SPACE -- SELECIONE TABELA
CRTL + T -- SELECIONAR A TABELA
CRTL + Shift + '+' -- NOVA COLUNA / LINHA
CRTL + '-' -- REMOVER COLUNA / LINHA
CRTL + E -- AUTOCOMPLETAR
F5 -- BUSCAR
CRTL + Shift + L -- FILTRO
CRTL + ALT + L -- REAPLICAR FILTRO
CRTL + Shift + A -- INSERIR FUNÇÃO
ALT + Seta Baixo -- SELECIONAR FILTRO
CRTL + PAGE UP -- ABA DA ESQUERDA
CRTL + PAGE DOWN -- ABA DA DIREITA
CRTL + ALT + T -- TABELA DINÂMICA
CRTL + 1 -- PERSONALIZAR FONTE E ALINHAMENTO
ALT + F1 -- GRÁFICO RÁPIDO
Shift + SPACE + Mouse -- MOVER E COLOCA UMA LINHA ENTRE DOIS REGISTROS 
CRTL + ; -- DIA
CRTL + Shift + ; -- HORA DE ATUALIZAÇÃO
TECLAS ALT -- PARA MAPEAR
F4 -- TRUNCATE
ALT + = -- SOMA RÁPIDA
CRTL + D -- DUPLICAR
CRTL + F3 -- GERERNCIADOR DE NOMES


INDIRETO
SOMA
SE
SEEROR
PROCV
SUBTOTAL
ÍNDICE ***** Busca / Procura
CORRESP ***** Posição
MAX
MIN
MAIOR
MENOR
CONT.VALORES
CONT.NUM
CONT.VAZIO
CONT.SE
E

/*******************************/
PROCX VERSUS PROCV + CORRESP

    =PROCV($B16;$B$2:$H$13;CORRESP(D$15;$B$2:$H$2;0);0)
    =PROCX($B16;$B$3:$B$13;$C$3:$H$13;0;0;1)
/***********************************/


=ÍNDICE(B3:B13;CORRESP(L5;INDIRETO(K2))) ---- alt + U1 + P
=ÍNDICE(C2:I2;0;CORRESP(L11;INDIRETO(K8);0))
=SOMARPRODUTO(C2:C8*D2:D8*(B2:B8=B10))
=SOMARPRODUTO((B2:B8=B10)*(C2:C8)*(C2:C8>B11)*(D2:D8))
=CONT.SE(INDIRETO(B3&"!B:B");"Saída")
=INDIRETO(B3&"!E2")
=SOMA(INDIRETO(B3&"!C:C"))
=DESLOC(A1;CORRESP(J2;A2:A21;0);CORRESP(J1;B1:G1;0))
=ÍNDICE($D:$D;CORRESP($G$1;$B:$B;0))
=PROCX(1;($B$7:$B$405=B4)*($C$7:$C$405=A4)*($A$7:$A$405=C4);$D$7:$D$405;0;0;1)
=SEERRO(SE(PROCV($B$7;Base!D:D;1;0)=$B$7;"Encontrado");"Não encontrado")
=CONT.SES(A:A;A1)<2
=CONT.SES(E:E;">31/12/2018")
=SE(SOMA($B$2:$B$8)<=$B$11; SOMA($B$2:$B$8); 0)
=SE(OU(B2="";C2="");"";SE(E(B2<>"";C2<>"");B2*C2;""))
=SE(E(B2<>"";C2<>"");B2*C2;"")
=SOMASES($E:$E;$B:$B;"*Alemanha*";$D:$D;"*Puma*")
=SOMASES($E:$E; $D:$D; I$23; $B:$B; $H24)



/*************************************/

ESQUERDA -- Retorna os caracteres mais à esquerda de um texto
DIREITA -- Retorna os caracteres mais à direita de um texto
NÚM.CARACT -- Retorna o número de caracteres de um texto
CONCATENAR -- Agrupa vários textos em uma única célula (nesse caso você deve selecionar uma célula de cada vez)
CONCAT -- Agrupa vários textos em uma única célula (nesse caso você pode selecionar várias células de uma vez)
LOCALIZAR -- Localiza um valor de texto dentro de outro (não diferencia maiúsculas de minúsculas)
PROCURAR -- Retorna a posição de um texto dentro de outro
EXT.TEXTO -- Retorna pedaço de um texto, começando na posição especificada, com base no número de caracteres especificado
MINÚSCULA -- Converte um texto em minúsculas
MAIÚSCULA -- Converte um texto em maiúsculas
SUBSTITUIR -- Substitui parte de um texto por outro texto
PRI.MAIÚSCULA -- Converte o primeiro caractere de cada palavra em maiúscula
ARRUMAR -- Remove espaços extras de um texto
TEXTO -- Formata um número e converte em texto (https://support.microsoft.com/pt-br/office/texto-fun%C3%A7%C3%A3o-texto-20d5ac4d-7b94-49fd-bb38-93d29371225c)

/********************/
=PROCV(ARRUMAR(EXT.TEXTO($B2;10;3));$S$2:$T$8;2;0)
/*******************/