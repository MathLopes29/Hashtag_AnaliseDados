'''
Funções Anônimas - Lambda
'''

def area_quadrado(lado):
 return lado*lado

# Área:
area_quadrado = lambda lado: lado * lado
area_quadrado(4)

# Triplo
triplo = lambda x: x * 3 
triplo(2)

# Potência:
pot = lambda n: n**3 
pot(5)

'''
Lista = []
Limite = int(input("Digite um limite de repetição: "))

for x in range(1, Limite):
 n = int(input("Digite Valores Númericos: "))
 Lista.append(n*3)
print(Lista)


OBS: função map(), que permite que apliquemos uma função em todos os elementos de uma lista.

# Função Tripla:
triplo = lambda x: x * 3

lista = [4, 6, 9, 10, 15]
print(list(map(triplo, lista)))
''' 

# Mais Pythonico!
lista = [4, 6, 9, 10, 15]
print(list(map(lambda x: x * 3, lista)))