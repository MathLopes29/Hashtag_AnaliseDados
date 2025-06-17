'''
Pandas é  um  pacote  em  Python  desenvolvido  para  disponibilizar estruturas de dados rápidas e flexíveis para se trabalhar com dados "relacionais"  ou  "rotulados"  (ver  Figura  5).  Ele  é  adequado  para  diversos tipos de dados: 

• Dados  tabulares  com  colunas  de  tipos  heterogêneos,  como  em tabelas SQL ou planilhas Excel; 

• Dados de séries temporais ordenados ou não ordenados; 

• Dados matriciais arbitrários, com linhas e colunas rotuladas; 

• Qualquer outro tipo de conjunto de dados estatísticos ou observados. Os dados não necessariamente precisam estar rotulados para serem utilizados com a estrutura de dados do Pandas.

O Pandas utiliza dois tipos principais de estruturas de dados: Series (unidimensional) e DataFrame (bidimensional), que são abstrações de vetores  e  matrizes,  respectivamente,  assim  como  no  numpy,  porém  com características  mais  versáteis  e  mais  próximas  dos  dados  do  mundo  real. 

Essas  duas  estruturas  são  capazes  de  representar  a  maioria  dos  casos  de uso  em  finanças,  em  estatística,  em  ciências  sociais  e  em  várias  áreas  da engenharia.

• Tratamento de dados faltantes (representados por NaN); 
• Tamanhos  mutáveis:  colunas  podem  ser  inseridas  e  excluídas  de DataFrames com facilidade; 
• Grupo  de  funcionalidades  poderoso  e  flexível  para  operações  de split-apply-combine, para agregar e transformar conjuntos de dados; 
• Ferramentas de IO robustas para leitura de dados de arquivos como CSV, Excel, bancos de dados, além da possibilidade de se utilizar o formato HDF5; 
• Entre outros. 

Para  leitura  dos  dados,  existem  diversas  funções,  a  depender  do formato do dado de entrada. Algumas da mais usadas estão listados abaixo: 
• read_csv: leitura de arquivos CSV; 
• read_json: leitura de arquivos JSON; 
• read_html: leitura de arquivos HTML; 
• read_clipboard: leitura de dados da área de transferência (CTRL + C, por exemplo); 
• read_hdf: leitura de arquivos HDF5; 
• read_sql: leitura de arquivos SQL; 
• read_excel: leitura de arquivos Excel. 

Uma  das  principais  características  do  Pandas  é  a  possibilidade  de lidar  com  diferentes  formatos  de  uma  maneira  muito  simples  e  similar  ao que já está implementado no numpy (slicing, indexação, comparações, etc.). 

'''
# Importanto as Bibliotecas - pip install pandas
import numpy as np
import pandas as pd

# Leitura dos Dados
df = pd.read_csv("https://pycourse.s3.amazonaws.com/temperature.csv")

# Visualização das três primeiras linhas
print(df.head(3),"\n")

# Tipos de Dados
print(df.dtypes,'\n')

# Indexação por índice, Selecionando TODAS as linhas e Coluna 1 (Temperatura)
print(df.iloc[:,1],'\n')

# Indexação por Nome
print(df.loc[:,'temperatura'],'\n')

# Indexação Booleana
print(df[df['temperatura'] >= 25],'\n')

# Indexação Boolean com Datetime
print(df[df.index <= '2020-03-01'])

# Ordenação por Valor
print(df.sort_values(by='temperatura'),'\n')

# Ordenação por Índice
print(df.sort_index(ascending=False),'\n')

'''
Note que a coluna date claramente é uma representação de datas, mas  como  não  explicitamos  na  leitura  do  arquivo  quais  os  tipos  de  cada coluna, o Pandas inferiu que essa coluna é do tipo object. Para que possamos usufruir  das  funcionalidades  de  comparações  de  datetimes,  precisamos forçar a conversão da coluna date para o tipo datetime
'''
# Conversão da coluna Date para DateTime
df['date'] = pd.to_datetime(df['date'])

'''
Também é conveniente definir qual coluna do DataFrame será utilizada como “referência” para as demais. No Pandas, essa “referência” é denominada  index  e  é  especialmente  útil  quando  temos  uma  coluna  de datetime, pois ela serve para determinar os labels do eixo de todos os outros objetos do DataFrame: 
'''
# Set do Index
df = df.set_index('date')

# Visualizando Index
print(df.index,'\n')

# Manipulando Estatísticas Básicas
print(df.describe(),'\n')

'''
Visualização:  além  de  ser  escrito  em  cima  do  numpy,  o Pandas também herda os métodos de visualização do matplotlib,  uma  biblioteca  de  visualização  de  dados  muito versátil e utilizada. Alguns plots podem ser feitos com apenas uma linha de código no Pandas - Use o Google Colab
'''

# Plot de Linhas 
# df.plot(style = '-o', figsize=(10,5), grid=True)

# df['classification'].value_counts().plot.pie
#   (autopct='%1.1f%%', shadow=True, figsize=(10,7));

'''
O Scikit-lean é um dos mais utilizados frameworks de aprendizado de máquinas em Python. Ele possui interfaces para a execução de diversas atividades inerentes às atividades de um cientista de dados: 

• Classificação:  identificação  de  qual  categoria  um  novo  exemplo pertence. 

• Regressão: predição de um valor contínuo associado a um determinado exemplo. 

• Agrupamento: agrupamento automático de exemplos em conjuntos. 

• Redução de dimensionalidade: redução do número de variáveis presentes em um dataset. 

• Seleção de modelos: comparação, validação e calibração de parâmetros de modelos. 

• Pré-processamento:  extração/seleção  de  atributos,  normalização  e tratamento de dados faltantes.

Introdução ao machine learning 

No  scikit-learn,  é  comum  adotar  a  nomenclatura  x  para  variáveis preditoras e y para a variável alvo. No nosso exemplo, x é a temperatura e y é  a  classificação. 
'''

# Extração de x e y:
# x, y = df[['temperatura']].values, df[['classification']].values
# print('x:\n',x)
# print('y:\n',y)

'''
A variável resposta é uma string, mas modelos matemáticos  necessitam  de  valores  numéricos  para  funcionarem.  Sendo assim,  umas  das  funcionalidades  presentes  no  scikit-learn  é  a  codificação de  variáveis  categóricas  em  variáveis  numéricas.
'''

# Import
# from sklearn.preprocessing import LabelEncoder
# le = LabelEncoder()
# y = le.fit_transform(y.ravel())
# print('y:\n',y)

'''
Após o pré-processamento, partiremos para o treinamento do modelo. (Existem outras etapas em um fluxo normal de machine learning. 
Aqui, para fins de exemplificação, não as realizaremos): 
''' 

# Modelo & Classificador
# from sklearn.linear_model import LogisticRegression
# clf = LogisticRegression()
# clf.fit(x,y) 

'''
Com  o  modelo  treinado,  podemos  inferir  a  classificação  de  novas temperaturas.  Para  isso,  iremos  gerar  uma  sequência  de  100  valores  de temperatura entre 0  e 45 para avaliarmos  o resultado da generalização do modelo: 
'''

# Gerando 100 Valores de Temp onde Linearmente espaçados entre 0 e 45
# x_test = np.linspace(start=0., stop=45., num=100).reshape(-1, 1)

# Predição desse Valores
# y_pred = clf.predict(x_test)

'''
De  posse  da  predição,  podemos  realizar  a  conversão  inversa  dos valores  numéricos  de  y  para  os  seus  valores  originais  (frio,  confortável, quente, muito quente). Após isso salvaremos os resultados na DataFrame:
'''

# Conversão de y_pred para o Original
# y_pred = le.inverse_transform(y_pred)

# Output
# output = {'new_temp': x_test.ravel(),
# 'new_class': y_pred.ravel()}
# output = pd.DataFrame(output)

# Estatistica
# output.info

'''
De posse dos resultados, vamos visualizar as classificações inferidas pelo modelo através de um plot de caixa (boxplot, em inglês), que nos mostra a distribuição dos valores de cada uma das classes para o novo conjunto de valores de temperatura gerados. Observe que o comportamento está como o  esperado  e  que  o  modelo  conseguiu  aprender  corretamente  partindo  de uma base de dados bem pequena.
'''

# Distribuição do Output produzido + Inferir classificação novas temp, a partir de um dataset com 6 exemplos

# output.boxplot(by='new_class', figsize=(10,5));

"""
JAMES, G. et al. An introduction to statistical learning. New York: Springer, 
2013.  

NUMPY. Disponível em: https://numpy.org/. Acesso em: 01 abr. 2022. 

PANDAS.  Disponível  em:  https://Pandas.pydata.org/.  Acesso  em:  01  abr. 
2022. 

SCIKIT-LEARN.  Disponível  em:  https://scikit-learn.org/stable/.  Acesso  em: 
01 abr. 2022. 

"""