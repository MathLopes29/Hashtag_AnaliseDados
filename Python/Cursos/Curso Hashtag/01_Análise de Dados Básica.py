'''
    @author: Matheus Lopes Lourenço
    @date: 2025-06-17
    @description: Script para análise de dados com Pandas e visualização com Matplotlib e Seaborn
    @version: 1.0
'''
# -*- coding: utf-8 -*-
import pandas as pd
import matplotlib.pyplot as plt 
import seaborn as sns
import statistics as sts

df = pd.read_csv('data/hashtag.csv')
df.info()

df.loc[:,'Data']
df.loc['Data'] = pd.to_datetime(df['Data'], format='%d/%m/%Y')
df.set_index('Data', inplace=True)
df

print(df.head(10))

# Importação e Letura em Pasta
import pandas as pd
import os

pasta = 'C:/Users/matheus.lopes/Desktop/ARQUIVOS/PYTHON/002_Bacen/CSV/' 

dfs = []
for arquivo in os.listdir(pasta):
    if arquivo.endswith('.csv'):
        caminho = os.path.join(pasta, arquivo)
        df_temp = pd.read_csv(caminho)
        dfs.append(df_temp)

if dfs:
    df_combinado = pd.concat(dfs, ignore_index=True)
    print(df_combinado.head())
else:
    print("Nenhum arquivo CSV encontrado na pasta especificada.")


# Localização / Conversão de Data / Indexação
df['Data'] = pd.to_datetime(df['Data'], format='%d/%m/%Y')
df.set_index('Data', inplace=True)
print(df.index())

#Estatística
print("Média:", df['Valor'].mean())
print("Mediana:", df['Valor'].median())
print("Desvio Padrão:", df['Valor'].std())
print("Moda:", sts.mode(df['Valor']))
print("Amplitude:", df['Valor'].max() - df['Valor'].min())

# Visualização
df.describe()
df.head(10)
df.tail(10)
df.shape() 
df.isnull().sum()  # Verifica valores nulos
df.dropna(inplace=True)  # Remove valores nulos
df_filtro = df[df['Valor'] > 1000]  # Filtra valores maiores que 1000
df_groupby = df.groupby('Categoria').mean()  # Agrupa por categoria e faz a média dos valores
df['coluna'].fillna('média/mediana/moda/0', inplace=True) # Substituição de Valores NULL
df.to_csv('saida.csv', index=False) # Exportação de Dados

sts.median(df['coluna']).size()  # Verifica o tamanho da mediana
#df.loc[df['coluna'] = 123] = ''


# LINK PARA COLOR DO MATPLOTLIB.PYPLOT: https://abrir.link/FiziS=
# Gráfico de Linhas
df['Coluna'].plot(kind='line', color='blue', figsize=(10, 5))
plt.title('Título do Gráfico de Linhas')
plt.xlabel('Eixo X')
plt.ylabel('Eixo Y')
plt.legend(['Legenda'])
plt.grid(True)
plt.show()

# Gráfico de Barras 
df['Coluna'].value_counts().plot(kind='bar', color='green', figsize=(10, 5))
plt.title('Título do Gráfico de Barras')
plt.xlabel('Eixo X')
plt.ylabel('Eixo Y')
plt.legend(['Legenda'])
plt.grid(True)
plt.show()

# Gráfico de Linhas com Marcadores
df['Coluna'].plot(kind='-o', color='red', figsize=(10, 5), linewidth=2.5, markersize=5, grid=True)
plt.title('Título do Gráfico de Linhas com Marcadores')
plt.xlabel('Eixo X')    
plt.ylabel('Eixo Y')
plt.legend(['Legenda'])
plt.show()