"""
* Listas  são  estruturas  de  dados  muito  similares às strings, que por sua vez são sequência de caracteres, apenas. A  diferença é que os elementos de uma lista podem ser de qualquer tipo, ou seja, podem ser homogêneos (todos os valores do mesmo tipo) e heterogêneos (valores com tipos distintos). Diferentemente  das  strings,  uma  lista  é  também  uma  sequência mutável e dinâmica. Uma vez que sejam criadas, é possível: 

● "Alterar o valor de um ou mais elementos." 
● "Os elementos podem ser adicionados, removidos ou substituídos". 
● "A ordem dos elementos pode ser alterada."

Apesar  de  semelhantes,  listas  e  strings  possuem  uma  diferença  muito  importante. 
Enquanto  as  listas  são  tipos  de  dados  mutáveis,  as strings  são  imutáveis.  Portanto, conseguimos  alterar  o  valor  de  um  elemento  na  lista  utilizando  o  operador  [],  mas  não conseguimos fazer o mesmo com aos caracteres de uma string.

"""

# Lista com valores heterogêneos
[2, 'a', 5.44, True]


# Lista com elementos nulos
['um', 'dois', None, 4]


# Listas com outras listas dentro (listas aninhadas)
l = [0, 1]
[l, 'dois', 'três', [4, 5], 'seis']


# Lista vazia
l = []
print(l)

# ********************************************* #
lista = [2, 'a', 5.44, True, None, 'casa']

# acesso por índices
print(lista[0])
print(lista[3])
print(lista[-1])

# acesso por slices
print(lista[1:4])
print(lista[-2:])
print(lista[:])

# ********************************************* #
# cria uma lista para armazenar as 10 idades
idades = [27, 49, 12, 67, 21, 32, 18, 45, 84, 53, 22, 56, 80, 35, 18]

# inicialmente assume que a primeira idade é a maior
# percorre a lista verificando a maior idade
maior_idade = max(idades)

# exibe a maior idade encontrada
print('Maior idade:', maior_idade)

# Criar uma lista inicial, com elementos heterogêneos 
lista = [2, 'a', 'b', 'c', 5.44, True] 
print(lista) 

# Adiciona um novo elemento na lista: Método append 
lista.append(999) 
print(lista) 

# Altera o valor do quarto e o do último elemento 
lista[3] = 'a' 
lista[-1] = lista[-1] + 1 
print(lista) 

# Remove a primeira ocorrência do elemento 'a' 
lista.remove('a') # pop
print(lista) 

#########################################################################

l1 = [30, 10, 20] 
l2 = [2, 'a', 5.44, True] 
 
# Operações de concatenação (+), repetição (*) e filiação (in) 
print(l1 + l2) 
print(l1 * 3) 
print(10 in l1) 
 
# Funções úteis 
print(len(l2)) # len: retorna a quantidade de elementos da lista. 
print(sum(l1)) # sum: retorna a soma dos elementos de uma lista. 
print(max(l1)) # max: retorna o maior elemento da lista (!!!!) 
 
# Métodos que alteram os valores internos da lista 
l2.reverse() # reverse: inverte a ordem dos elementos 
print(l2) 
l1.extend([10, 20, 30, 40, 10]) # extend: adiciona elementos de outra sequência 
print(l1) 
l1.sort() # sort: ordena os valores da lista 
print(l1) 
l2.insert(2, 'novo valor') # insert: adiciona um elemento em um índice especifico 
print(l2) 
l2.pop() # pop: remove o último elemento da lista 
print(l2) 
l2.clear() # clear: limpa a lista, removendo todos os elementos 
print(l2) 
 
# Métodos que retornam valores e não alteram a lista 
print(l1.index(40)) # index: retorna o índice da primeira ocorrência do elemento 
print(l1.count(10)) # count: conta as ocorrências do elemento

idades = [27, 49, 12, 67, 21, 32, 18, 45, 84, 53, 22, 56, 80, 35, 18] 
print('Maior idade:', max(idades))
