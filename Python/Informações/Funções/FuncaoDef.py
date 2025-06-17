'''
 Uma  função  é basicamente um bloco de código, que realiza uma determinada tarefa e que pode ser reutilizado várias vezes. As funções auxiliam na divisão do programa em partes menores e modulares, e à medida que o código cresce cada vez mais, as funções o tornam mais organizado e gerenciável. 


Sua sintaxe é formada pelos seguintes componentes: 

● A palavra-chave def, que define o início da declaração de uma função. 

● O  identificador  da  função  (nome_da_funcao),  que  deve  ser único e que será utilizado para chamar esta função. Os nomes de  funções  devem  seguir  as  mesmas  regras  dos  nomes  de variáveis,  apresentados  na  Seção  Regras  para  Nomeação  de Variáveis. 

● Os argumentos (argumento1, argumento2, ...), que são opcionais, são utilizados para repassar valores paras as funções.  Mesmo  que  não  for  passado  nenhum  argumento 
para a função, é necessário declarar os parênteses (nome_da_funcao()). 

● O tradicional dois pontos (:) para marcar o fim da declaração e o início de um bloco indentado. 
 
● O  <bloco  de  código>,  que  irá  compor  o  corpo  da  função,  é  o conjunto de instruções responsável por realizar as computações que a função irá desempenhar. 

● Por fim, uma instrução de retorno (return), que é responsável por  retornar  o  resultado  da  função.  Uma  vez  que  existem funções que não retornam valores, sua declaração é opcional.
'''

# define as listas com os números a serem somados 
l1 = [1, 2, 3, 4, 5] 
l2 = [3, 1, 5, 9, 0, 8, 2, 3, 4] 
l3 = [12, 43, 23, 12, 789] 
 
# declaraca a função que soma os elementos da lista 
def soma_lista(lista): 
    soma = 0 
    for item in lista: 
        soma = soma + item 
    return soma 
 
# chama a função para cada lista 
soma_l1 = soma_lista(l1) 
soma_l2 = soma_lista(l2) 
soma_l3 = soma_lista(l3) 
 
print(f'Resultado: l1={soma_l1}, l2={soma_l2}, l3={soma_l3}')


##########################################################################

# exibe mensagem de boas vindas à uma pessoa 
def boas_vindas(nome): 
    print(f'Olá {nome}. Seja bem-vindo (a)!') 
 
# calcula a área de um quadrado: l x l 
def area_quadrado(lado):  
    return lado * lado 
 
# calcula a área de um triângulo: (b x h) / 2 
def area_triangulo(base, altura):  
    return (base * altura)/2 
 
# Realiza as chamadas das funções 
boas_vindas('Priscila') 
print(area_triangulo(4, 5)) 
 
boas_vindas('Maria') 
boas_vindas('Joana') 
 
print(area_quadrado(4)) 
print(area_quadrado(10)) 
 
boas_vindas('Antônio') 
print(area_quadrado(10)) 
 
print(area_triangulo(5, 2)) 
print(area_triangulo(4, 5)) 

##########################################################################

# Verifica se é um divisor inválido (divisor == 0) 
def divisor_invalido(divisor): 
    if divisor == 0: 
        print('ERRO: Divisor igual à zero!') 
        return True 
    return False 

# Realiza uma divisão. Se o divisor é zero, retorna uma mensagem de erro.  
def div(dividendo, divisor): 
    if divisor_invalido(divisor):
        return 
    return dividendo / divisor 
 
# Função similar à função div, mas que retorna o dividendo e o resto da divisão. 
def div_qr(dividendo, divisor): 
    if divisor_invalido(divisor):
        return
    quociente =  dividendo // divisor 
    resto = dividendo % divisor 
    return (quociente, resto) 
 
print('div(10, 4) ==>', div(10, 4)) # dividento=10 e divisor=4 
print('div_qr(10, 4) ==>', div_qr(10, 4)) # dividento=10 e divisor=4 
print('div(10, 0) ==>', div(10, 0)) # dividento=10 e divisor=0

# atribuição dos múltiplos valores em uma variável única do tipo tupla 
resultado = div_qr(21, 5) 
print('resultado:', resultado, type(resultado)) 
 
# atribuição dos múltiplos valores em variáveis separadas 
quociente, resto = div_qr(21, 5) 
print('quociente:', quociente, type(quociente)) 
print('resto:', resto, type(resto))

##########################################################################
# calcula a área de um triângulo: (b x h) / 2 
def area_triangulo(base, altura):  
    return (base * altura)/2 
 
print(area_triangulo(5, 10))
print(area_triangulo(altura=10, base=5))

##########################################################################

def exibe_pessoa(nome, idade=30):  
    print(f'Meu nome é {nome} e tenho {idade} anos.') 
 
exibe_pessoa('Antônio') 
exibe_pessoa('Antônio', 36)