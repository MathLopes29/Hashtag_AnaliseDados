'''
● Análise  inteligente  de  imagens:  as  imagens  poderão  ser geradas por meio de uma câmera e em seguida armazenadas no disco rígido do computador, para uma posterior análise. 

● Gerenciador  financeiro:  pode  ser  necessária  a  leitura  de arquivos  no  disco  que  contém  uma  lista  de  transações  e/ou planilhas de cálculos do balanço financeiro de uma empresa. 

● Processador  de  texto:  poderíamos  criar  um  editor  de  texto, capaz  de  abrir,  alterar  e  salvar  as  edições  em  um  arquivo  no disco.

                        DETERMINANDO TIPOS DE ARQUIVOS:

'r' Modo somente leitura (modo padrão). 

'w' Modo  de  escrita.  Cria  um  arquivo,  caso  ainda  não  exista,  ou  substitui  o arquivo atual. 

'x' Modo de escrita. Cria um arquivo e, se o arquivo já existir, retorna um erro. 

'a' Modo  de  escrita.  Cria  um  arquivo,  caso  ainda  não  exista.  Se  o  arquivo  já existir, novas escritas serão adicionadas ao final dele. 

't' Abre o arquivo no modo texto (modo padrão). 

'b' Abre o arquivo no modo binário.

SP; São Paulo; 11895893 
RJ; Rio de Janeiro; 6453682 
BA; Salvador; 2902927 
DF; Brasília; 2852372 
CE; Fortaleza; 2571896 
MG; Belo Horizonte; 2491109 
AM; Manaus; 2020301 
PR; Curitiba; 1864416 
PE; Recife; 1608488 
RS; Porto Alegre; 1472482 
PA; Belém; 1432844 
GO; Goiânia; 1412364 
SP; Guarulhos; 1312197 
SP; Campinas; 1154617 
MA; São Luís; 1064197
'''
# Leitura
arquivo_valores = open('valores.txt', 'r') 

# Escrita e Binário
arquivo_valores = open('valores.txt', 'wb') 

# Fechar Arquivo
arquivo_valores.close()

'''
O nome do arquivo de exemplo é cidades.txt e possuí a lista das 15 maiores cidades do país, conforme ilustrado a seguir: 

SP; São Paulo; 11895893 
RJ; Rio de Janeiro; 6453682 
BA; Salvador; 2902927 
DF; Brasília; 2852372 
CE; Fortaleza; 2571896 
MG; Belo Horizonte; 2491109 
AM; Manaus; 2020301 
PR; Curitiba; 1864416 
PE; Recife; 1608488 
RS; Porto Alegre; 1472482 
PA; Belém; 1432844 
GO; Goiânia; 1412364 
SP; Guarulhos; 1312197 
SP; Campinas; 1154617 
MA; São Luís; 1064197

Existem três maneiras simples de lermos os dados de um arquivo. 

PS = método rstrip() remove caracteres em branco e quebras de linha ao final de uma string. 

'''

# PRIMEIRA MANEIRA *
arquivo = open('cidades.txt', 'r') 
linhas = arquivo.read() 
arquivo.close() 
print(linhas)

# SEGUNDO MANEIRA
arquivo = open('cidades.txt', 'r') 
linhas = arquivo.readlines() 
arquivo.close() 
print(linhas)

# TERCEIRO MANEIRA
novas_linhas = [] 
for linha in linhas: 
    novas_linhas.append(linha.rstrip()) 
print(novas_linhas)

# QUARTA MANEIRA *
arquivo = open('cidades.txt', 'r') 
for linha in arquivo: 
    print(linha.rstrip()) 
arquivo.close()

'''
Escrita de Arquivos 

Considere  novamente  o  mesmo  arquivo  das  maiores  cidades  do Brasil (cidades.txt), apresentado na seção anterior. Desejamos agora adicionar as informações das próximas cidades no final deste arquivo. Para tanto,  podemos  utilizar  dois  métodos.  Mas  antes  é  necessário  abrirmos  o arquivo em modo de escrita e de adição de dados no seu final (modo 'a') 

* O primeiro método é o write(texto), que recebe como parâmetro uma string contendo o texto a ser inserido no final do arquivo. Porém existe o segundo método, chamado de Writelines: 
'''

# PRIMEIRA FORMA:
arquivo = open('cidades.txt', 'a') 
arquivo.write('RJ; São Gonçalo; 1031903\n') 
arquivo.close()

# SEGUNDA FORMA:
inhas = [ 
    'AL; Maceió; 1005319\n', 
    'RJ; Duque de Caxias; 878402\n', 
    'RN; Natal; 862044\n', 
    'MS; Campo Grande; 843120\n' 
] 
arquivo = open('cidades.txt', 'a') 
arquivo.writelines(linhas) 
arquivo.close()