"""
Conjuntos 

Em Python os conjuntos (sets) são estruturas de dados do tipo set, não-ordenadas, que representam uma coleção de itens únicos, ou seja, itens sem  repetições.  Assim  como  a  lista,  o  conjunto  também  é  uma  estrutura mutável, suportando operações de inserção, alteração e remoção de elementos.  

A  diferença  fundamental  entre  as  listas  e  os  conjuntos  é  que  os elementos dos conjuntos são únicos e a sua ordem dentro da estrutura não importa. Por isso eles são ditos como estruturas não-ordenadas. Adicionalmente, o tipo set suporta operações matemáticas entre conjuntos como união, interseção e diferença. 

Os  conjuntos  também  são  criados  de  forma  semelhante  às  listas, mas com chaves sendo utilizadas ao invés dos colchetes. Outra diferença é que, nos conjuntos, a ordem de declaração dos itens não importa.
"""

# Criação de um conjunto homogêneo 
c1 = {3, 0, 1, 4, 3} 
print(c1) 
 
# Criação do mesmo conjunto, porém com uma ordenação diferente dos itens 
c2 = {2, 1, 4, 3, 0} 
print(c2) 
 
# Conjunto heterogêneo 
c3 = {2, 'a', 5.44, True, None} 
print(c3)

"""
Os conjuntos não possuem uma maneira direta de acessar os seus elementos.  Isso  pode  não  fazer  sentido  agora,  mas  o  tipo set  é  uma estrutura  projetada  para  não  fornecer  acesso  aos  elementos,  e  sim  para representar  os  dados  em  forma  de  conjuntos  e  oferecer  suas  operações matemáticas tradicionais.
"""

# Criação dos conjuntos A e B 
A = {1, 2, 3, 4, 5} 
B = {4, 5, 6, 7, 8} 
print('A:', A) 
print('B:', B) 
 
# Operação de União: (A ∪ B) 
print('A | B =>', A | B) 
print('A.union(B) =>', A.union(B)) 
 
# Operação de Interseção: (A ∩ B) 
print('A & B =>', A & B) 
print('A.intersection(B) =>', A.intersection(B)) 
 
# Operação de Diferença: (A - B) e (B - A) 
print('A - B =>', A - B) 
print('A.difference(B) =>', A.difference(B)) 
print('B - A =>', B - A) 
print('B.difference(A) =>', B.difference(A)) 

"""
Exemplo:
"""

# Criação dos conjuntos A e B 
c1 = {1, 2, 3, 4, 5} 
c2 = {4, 5} 
c3 = {91, 92, 93} 
 
# Adiciona um elemento ao conjunto 
c1.add(6) 
print(c1) 
 
# Adiciona os elementos de uma sequência iterável 
c1.update([2, 4, 6, 8]) 
print(c1) 
 
# Descarta um elemento do conjunto,  
c1.discard(8) 
print(c1) 
# Diferentemente do set.remove(), o discard não gera um erro  
# se o elmento a ser removido não existir 
c1.discard(99) 
print(c1) 
 
# Verifica se os conjuntos são disjuntos, ou seja, 
# se não possuem nenhum elemento em comum 
print(c1.isdisjoint(c2)) 
print(c1.isdisjoint(c3)) 
 
# Verifica se o conjunto é subconjunto de outro 
print(c1.issubset(c2)) 
print(c2.issubset(c1)) 
 
# Verifica se o conjunto contém outro conjunto (superset) 
print(c1.issuperset(c2)) 
print(c2.issuperset(c1))