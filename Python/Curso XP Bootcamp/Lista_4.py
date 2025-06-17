"""
 Lista Final do Módulo 1:
 @author Matheus Lopes

* Atividade 01. Execute e analise a saída do seguinte código no Google Colab1. 
  # relação dos nomes
  nomes = ['Maria', 'Julieta', 'Fernando', 'Cristiano', 'Julieta', 'Maria', 'Fernando', 'Cláudio']  
  
  # estrutura que irá armazenar o número de letras de cada nome 
  qtd_letras = {}  

  # calcula o tamanho de cada nome (em número de letras) e armazena o valor na estrutura 
  for nome in nomes:     
    qtd_letras[nome] = len(nome) 
"""

# Exercício 1º
nomes = ['Maria','Julieta','Fernando','Cristiano', 'Julieta', 'Maria', 'Fernando', 'Cláudio'] 
qtd_letras  = {nome:len(nome) for nome in nomes } 
print(qtd_letras)

# Exercício 2º e 3º 
def area1(r, pi = 3.14159265359):
    return print('Resultado: ',(pi*(r**2)))
area1(5)

def area2(r, pi):
    return print('Resultado: ',(pi*(r**2)))
area2(5, 3.14)

# Exercício 4º
area3 = lambda x: x*(x**2) 
print(area3(5))

# Encontra e retorna o maior número impar presente na lista 

def maior_impar(lista):
    print(list(map(lambda x: x % 2 == 0, lista)))
    print(list(map(lambda x: x % 2 == 1, lista)))
maior_impar(lista = [1,2,3,4,5])

teste = [n/2 for n in range(0, 10) if n > 3]
print(teste)


