import pandas as pd

# Criando um DataFrame de exemplo
dados = pd.DataFrame({'A': [1, 2, 3, 4, 5],
                      'B': [6, 7, 8, 9, 10]})

# Calculando a média
media = dados.mean()
print("Média:")
print(media)

# Calculando a mediana
mediana = dados.median()
print("Mediana:")
print(mediana)
