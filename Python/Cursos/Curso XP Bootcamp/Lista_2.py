"""
a = int;
a = 4

b = int;
b = 10

c = int;
c = 5

d = int;
d = 1

f = int;
f = 5

print("1º Expressão: ")
if(a == c):
    print("Verdade!")
else:
    print("Mentira!") 

print("\n2º Expressão: ")
if(a < b):
    print("Verdade!")
else:
    print("Mentira!") 

print("\n3º Expressão: ")
if(d > b):
    print("Verdade!")
else:
    print("Mentira!") 

print("\n4º Expressão: ")
if(c != f):
    print("Verdade!")
else:
    print("Mentira!") 

print("\n5º Expressão: ")
if(a == b):
    print("Verdade!")
else:
    print("Mentira!") 

print("\n6º Expressão: ")
if(c < d):
    print("Verdade!")
else:
    print("Mentira!")

print("\n7º Expressão: ")
if(b > a):
    print("Verdade!")
else:
    print("Mentira!")

print("\n8º Expressão: ")
if(c >= f):
    print("Verdade!")
else:
    print("Mentira!")

print("\n9º Expressão: ")
if(f >= c):
    print("Verdade!")
else:
    print("Mentira!")

print("\n10º Expressão: ")
if(c <= c):
    print("Verdade!")
else:
    print("Mentira!")

print("\n11º Expressão: ")
if(c <= f):
    print("Verdade!")
else:
    print("Mentira!")

****************************************************************
    
print("\n1º Expressão: ")
print(True and True)

print("\n2º Expressão: ")
print(False and False)

print("\n3º Expressão: ")
print(not True)

print("\n4º Expressão: ")
print(not False)

print("\n5º Expressão: ")
print(True or False)

print("\n6º Expressão: ")
print(False or True)

print("\n7º Expressão: ")
print(True or True)

print("\n8º Expressão: ")
print(False or False)

*************************************************************

Pagar = float(input("Digite o valor do seu Imposto Mensal: "))
print(f"Valor: {Pagar: .2f}")

if Pagar > 1200 :
    print("Deve pagar um Valor Extra");
    NovoPagar = (((Pagar * 120)/100) - Pagar)
    print(f"Valor Extra: {NovoPagar}")
else:
    print("Pagamento Realizado!");

************************************************************    

Metros = float(input("Digite um valor em Metros: "))
print(f"{Metros} m")

Centimetros = Metros * 100;
print(f"{Centimetros} cm")

Km = Metros / 1000
print(f"{Km} Km")

*****************************************************************

QTD_KM = float(input("Qual foi a quantidade de km percorridos: "))
print(f"{QTD_KM} Km")

Custo_Km = QTD_KM * 0.15
print(f"Custo: {Custo_Km: .2f} Reais")

QTD_Dia = int(input("\nQuantos dias com o carro alugado: "))
print(f"{QTD_Dia} Dias")

Custo_Dia = QTD_Dia * 60.00
print(f"Custo: {Custo_Dia: .2f} Reais")

Custo_Total = Custo_Dia + Custo_Km;
print(f"\nCusto Total: {Custo_Total: .2f}")

***************************************************

Ref = True;

while Ref == True:
    print("\n***************************")
    x = int(input("Insira um Valor: "))
    y = int(input("Insira um Valor: "))
    z = int(input("Insira um Valor: "))

    Ref = int(input("Digite 1/0 para mostrar ou ocultar a resposta: "))
    if Ref == 1:
        Res = x + y + z;
        print(f"\nResposta do calculo:{Res}")
        continue
    else:
        print("\nPrograma Encerrado !")
        Ref == False;
        break 
        
print("**************************************")
Anos = int(input("A quantos Anos você fuma: "))
print(f"{Anos} Anos")

Dias = Anos * 365;
print(f"Convertendo: {Dias} Dias")

print("\n**************************************")
Cigarros = int (input("Quantos Cigarros por Dia: "))
print(f"{Cigarros} Cigarros!")

PerdaDia = Cigarros * 10
print(f"Perda: {PerdaDia} Minutos de sua vida por Dia!")

print("\n**************************************")
PerdaAno = PerdaDia * 365
print(f"Perda: {PerdaAno} Minutos de sua vida por Ano!")

PerdaDiaMin = PerdaAno / 60 
print(f"Perda: {PerdaDiaMin} Horas de sua vida por Ano!")

"""

empresa = "FATEC Zona Sul - DSM 3ºSemestre"
nome = "Matheus Lopes"
x = 40-len(nome)


def imprime_cabecalho():
    print(empresa)
    print(len(empresa))
    print(f"{nome}" + " * " * x)

print(imprime_cabecalho())

L = [10, 20, 30, 40, 50]

def soma (L):
    total = 0
    for x in L:
        total += x
    return total


def media(L):
    return soma(L) / len(L)

print(f"Media: {media(L)}")
print(f"Soma: {soma(L)}")
print(f"Soma dos Itens: {sum(L)}")
print(f"Max: {max(L)}")
print(f"Min: {min(L)}")


"""
a = 5
def muda (b):
    c = b+a
    print(c)

a = muda(10)
"""


def fatorial(n):
    if n == 0 or n == 1:
        return 1
    else: 
        return n * fatorial(n-1)

print(fatorial(5))
print(fatorial(17))
print(fatorial(9))
print(fatorial(12))


print("************************************************************")
acesso = 0;
status = 0;

while True:
    x = (input("Digite valor de 0 até 5"))
    
    if x < 0 or x >= 5:
        print("Valor inválido! ")
        continue
    else:
        acesso = 1;
        break 

    if status > 1 or status <= 2:
        print(f"Tentativas: {status}")
    elif status >= 3:
        print("Senha Bloqueada!")
        acesso = 3;
        break

    status = status + 1;

if (acesso == 1 ):
    print("Continuar Programa!")
if (acesso == 3 ):
    print("Acesso Negado")

print(f"Numero: {x}")
print(f"Acesso: {acesso}")
print(f"Status: {status}")


def linha(lin = 30, tipo = "*"):
    print(lin*tipo)

linha(10, "/")
linha(10, "$")
linha(10, "!")
linha(10, "$")
linha(10, "_")


print("******************************************************************")
def soma(a, b):
    print(a + b)
l = [10, 20]
soma(*l)


print("******************************************************************")
lista = ["A", "B", "C", "Y", "X", "Z"]
print(f"Lista: {lista}")
lista.sort()
print(f"Nova Lista: {lista}")


print("******************************************************************")
List = [1, 2, 3, 4, 5]; #Você consegue alterar dados!
List [1] = 54;
type(List)
print(List)

Array = {"Matheus", 29}
type(Array)
print(Array)

ListaNome = ["Lucas", "Matheus", "Thiago"]
print(f"Lista Original: {ListaNome}");

ListaNome[2] = "Marcos"
print(f"Nova Lista: {ListaNome}");

Backup = ListaNome[:]
print(f"Backup: {Backup}")

print("***************************************************************")
Lista = [];
Lista.append("Teste")
Lista.append("Valor 1")
print(lista)

print("****************************************************************")
Lista = [];
print("------------- Antes do Loops -------------")
print(Lista)

print("------------- Depois do Loops -------------")
while True:
     nome = input("Digite seu nome: ");

     Ref = (input("Digite S/N para continuar"))
     if Ref == "S" or Ref == "s":
        valor = (input("Digite um valor: "))
        Lista.insert(valor)
        continue
     elif Ref == "N" or Ref == "n":
        break

print("****************************************************************")
Cadastro = [0, 0, 0, 0]
Cadastro.insert(0,145)
print(Cadastro)



lista = [
    ['Maça', 5.00],
    ['Banana', 3.00],
]

while True:
    resposta = input("Digite S para sair ou qualquer outra tecla para continuar: ")
    if resposta.upper() == "S":
        break
    else:
        nome_produto = input("Digite o nome do produto: ")
        if not nome_produto:
            print("Nome do produto não pode ser vazio.")
            break
        vendas = float(input("Digite o valor das vendas: "))
        lista.append([nome_produto, vendas])
        print(lista)
