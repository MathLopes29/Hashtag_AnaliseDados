
# Declaração das Variáveis
inicio = 0
fim = 100
divisor = 5

# Verifica quais números são divísiveis por x e exibir aqueles que são:
for numero in range (inicio, fim):
    if numero % divisor == 0:
        print(numero)


# Variáveis do tipo String 
nome = 'João da Silva' 
cidade = 'São Paulo' 
cpf = '123.456.789-00' 

letra = []
for letra in nome:
    letra = nome
    print(letra[2])
    break

print(True and False)
print(True or False)

numero = '127957'
x = int(numero) + 1.0
print (x)

y = '5'+'5'
print(y)
print(type(y))


'''

    l1 = [30, 10, 20] 
    l2 = [2, 'a', 5.44, True] 
    
    # Operações de concatenação (+), repetição (*) e filiação (in) 
    print(l1 + l2) 
    print(l1 * 3) 
    print(10 in l1) 
    
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

'''