# Numpy - Importa objetos Arrays Multidimensional de Alta Performace e Diversas ferramentas para se trabalhar com esses objetos:

# Lembrando que Array é uma estrutura de dados que serve para a manipulação de dados em forma de vetores ou matrizes, tendo uma alta perfoemance

'''
Para instalar: 
image.png
1º Crie uma pasta e logo após execute esse código no terminal: python3.11 -m venv studysession
2º pip install numpy ou conda install numpy
3º Pronto

'''
# Import
import numpy as np 

# Axis - Eixos || Shape: Tuplas de Linha ou Coluna
new_matrix = np.array([[1,2,3], [4,5,6], [7,8,9]])
print("Array criada:\n",new_matrix)
print("Shape:", new_matrix.shape)

# Matriz 3x3 Nula:
vazia = np.zeros((3,3))
print(f'Martiz Criada:\n{vazia}\n')

# Matriz 3x3 1's:
um = np.ones((3,3))
print(f'Matriz Criada:\n{um}\n')

# Matriz identidade 3x3:
print('Matriz Criada:\n', np.eye(3), "\n")

# Matriz Aleatória:
print('Matriz Aleatória:\n', np.random.random(size = (3,3)), "\n")

# Vetor Linespace:
print('Matriz LineSpace:\n', np.linspace(0,20,5),"\n")

# Size + Ones
size = 5
h = np.ones(size)
print('Vetor Criado:\n',h,"\n")

x = [10,20,30,40,50,60,70,80,90,100]
print('Primeiro Elemento: ', x[0])
print('Segundo Elemento: ', x[1])
print('Último Elemento: ', x[-1])
print('Último Elemento: ', x[9])
print('Dois Primeiros Elementos: ', x[:2])
print('Dois Últimos Elementos: ', x[-2:],"\n")

# Matriz Bidimensional (3,4)
A = np.array([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
print('Matriz Criada:\n',A)
print('Dimenssão: ',A.shape,"\n")

'''
Indexação de Arrays: Assim como listas em Python, arrays em numpy podem ser fatiadas (slicing, termo comum em inglês). Dado que arrays podem ser multidimensionais,  é  necessário  especificar  uma  fatia  para  cada  uma  das dimensões da array
'''

# Matriz Indexada: Nesse caso apenas as duas primeiras LINHAS e a 2º e 3º COLUNAS são Mostradas ([1:k, 1:l] (k-1 | l-1)) 
B = A[0:2, 1:3]
print('Dois Primeiros Elementos + Coluna 1 até 2:\n',B,"\n")

C = A[2, 1:3]
print('Linha Dois + Coluna 1 até 2:\n',C,"\n")

# Slicing em Array 2D - 
z = np.linspace(start = 10, stop = 100, num = 10)
print('z: ', z)
print('Shape: ',z.shape,"\n")

z = z.reshape(2,5) # Reshape de x para 2 linhas e 5 colunas
print('z:\n', z,"\n")

# Slicing: Extração de Subarrays
print('Primeira Linha Inteira: ', z[0,:])
print('Segunda Linha Inteira: ', z[1,:])
print('Primeira Linha Inteira + Segunda até Quarta Coluna: ', z[0, 1:4])
print('Terceira Coluna Inteira:\n',z[:, [2]],"\n")
print('Última Coluna Inteira:\n', z[:, [-1]],"\n")

# Compartilhamento de Memória em Subarrays
p = np.array([1,2,3])
print('p antes: ',p)
t = p[:2]
t[0] = -100 # Alteração do Valor em t altera p
print('p depois: ',p,"\n") 

'''
Para a criação de um sub-array que não compartilha memória com o array  original,  faz-se  necessária  a  utilização  do  método  copy()  durante  a indexação (slicing)
'''
o = np.array([1,2,3])
print('o antes: ', o)
w = o[:2].copy()
w[0] = -100 # Alteração do Valor em w altera o
print('o depois: ', o,"\n")

'''
Função Aritméticas: Funções aritméticas básicas operam sobre cada elemento em arrays, e  estão  disponíveis  tanto  como  sobrecarga  de  operadores  quanto  como funções  no  módulo  numpy.  Elas  podem  ser  implementadas  tanto  entre arrays quanto entre um array e um escalar (exemplo: int e float).
'''

# Soma:
x = np.array([[1,2],[3,4]])
y = np.array([[5,6],[7,8]])

print('Sobrecarga de Operador:\n',x+y,"\n")
print('Função do Módulo:\n',np.add(x,y),"\n")
print('Soma entre uma array e um escalar:\n', x+10,"\n")

# Subtração:
print('Subtração:\n',x-y,"\n")
print(np.subtract(x,y),"\n")

# Multiplicação:
# Repare que o operador * representa a multiplicação por elemento, e não a multiplicação de matrizes.
print('Multiplicação:\n',x*y,"\n")
print(np.multiply(x,y),"\n")

# Para calcular o produto interno de vetores, multiplicar  um  vetor  por  uma  matriz  ou  multiplicar  matrizes,  a  função utilizada é dot
v = np.array([5,5])
q = np.array([2,3])

print(v.dot(q))
print(np.dot(v,q))

# Produto de um Vetor (v) e uma Matriz (x)
print(x.dot(v))
print(np.dot(x,v))

# Produto de Matrizes
print(x.dot(y))
print(np.dot(x,y))

# Divisão por Elementos
print(x/y,"\n")
print(np.divide(x,y),"\n")

# Raiz Quadrada por Elemento
print(np.sqrt(x))

# Exponenciação por Elemento
print(x**2)

# Log por Elemneto
print(np.log(x))


"""
Comparações booleanas  também são possíveis em numpy arrays e são executadas elemento por elemento, retornando um outro numpy array com o resultado da comparação.
"""
A = np.array([1,2,3])
B = np.array([4,5,6])
s = 3

# Maior ou Igual
print('Comparação Maior:\n', A > B)
print('Comparação Maior:\n', A >= B)

print('Comparação Maior:\n', A < s)
print('Comparação Maior:\n', B < s)

# Menor ou Igual
print('Comparação Menor:\n', A < B)
print('Comparação Menor:\n', A <= B)

# Igualdade de Elemento
print('Comparação Menor:\n', A == B)
print('Comparação Maior:\n', A == s)

# Indexação Booleana, tendo uma nova subarray (D) onde temos uma condição
cond = A <= 2
D = A[cond]
print('A: ',A)
print('Condição: ', cond)
print('D: ',D,'\n') 

# Exemplo
m = np.array([[1,3,7],[4,11,21],[42,8,9]])
print('m:\n',m)

cond = m > 10
print('Condição: ',cond,'\n')
print('Elementos Maiores que a Condição: ', m[cond])
print('Numero de Elementos: ', len(m[cond]),'\n')

cond = m % 2 == 0
print('Condição: ',cond)
print('Números Pares: ', m[cond],'\n')

cond = m % 2 == 1
print('Condição: ',cond)
print('Números Impares: ', m[cond])