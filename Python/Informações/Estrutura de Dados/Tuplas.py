"""
As  tuplas  são  estruturas  de  dados  ordenadas  do  tipo  tuple  e  são semelhantes às listas, com uma diferença fundamental: tuplas são imutáveis. Pelo conceito de imutabilidade, uma vez que criarmos uma tupla, não  será  mais  possível  adicionar,  alterar  ou  remover  seus  elementos.  Este tipo  de  estrutura  é  utilizado,  frequentemente,  para  armazenar  sequências de diferentes informações, porém, com a quantidade de elementos definidos e que não irá requerer alterações ao longo da execução do código. 

A criação das tuplas é semelhante às listas, entretanto, são utilizados parênteses e não colchetes, para delimitar os elementos. Tuplas também armazenam  elementos de diferentes tipos de dados, podendo ser homogêneas ou heterogêneas. O acesso é realizado da mesma forma que as listas. 

● "Tuplas  são  mais  rápidas  que  listas.  Se  você  está  definindo uma sequência constante de valores e você vai ter que iterar sobre ele, utilize uma tupla ao invés de uma lista." 

● "Tuplas  tornam  o  seu  código  mais  seguro,  uma  vez  que  eles protegem  contra  gravações,  os  dados  que  não  precisam  ser alterados. Usar uma tupla em vez de uma lista é como ter uma declaração implícita de que esses dados são constantes e que uma função específica será necessária para sobrescrevê-los." 

● "Tuplas podem ser utilizadas como chaves de dicionários. As listas nunca podem ser utilizadas como chaves de dicionário, porque as listas não são imutáveis."

Com  os  pontos  apresentados,  conseguimos  entender  que  existem situações adequadas para cada tipo de estrutura de dados (lista ou tupla).
"""

# Criação de uma tupla homogênea 
tupla = (0, 1, 2, 3, 4) 
print(tupla) 
 
# Tupla heterogênea 
tupla2 = (2, 'a', 5.44, True, None) 
print(tupla2) 
 
# Tupla vazia 
tupla3 = () 
print(tupla3) 
 
# acesso por índices 
print(tupla[0]) 
print(tupla[3]) 
print(tupla[-1]) 
 
# acesso por slices 
print(tupla2[1:4]) 
print(tupla2[-2:]) 
print(tupla2[:])

# Exemplo
t1 = (30, 10, 20) 
t2 = (2, 'a', 5.44, True) 
 
# Operações de concatenação (+), repetição (*) e filiação (in) 
print(t1 + t2) 
print(t1 * 3) 
print(10 in t1) 
 
# Funções úteis 
print(len(t2)) # len: retorna a quantidade de elementos da tupla 
print(min(t1)) # min: retorna o menor elemento da tupla 
print(max(t1)) # max: retorna o maior elemento da tupla 
print(sum(t1)) # sum: retorna a soma dos elementos da tupla 
  
# Métodos que retornam valores 
print(t1.index(20)) # index: retorna o índice da primeira ocorrência do elemento 
print(t2.count('a')) # count: conta as ocorrências do elemento
