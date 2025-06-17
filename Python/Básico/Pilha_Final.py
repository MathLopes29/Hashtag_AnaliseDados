# Variáveis Globais
PilhaList = [];
Pares = [];
Impares = [];


# Layout de Tela
def Layout():
  print("*********************************************")
  print("------------- Bem Vindo a Pilha! ------------")
  print("*********************************************")


# Estrutura da Pilha
def Pilha():
 Acesso = int(input("0 - Sair \n1 - Inserir \n2 - Verificar \n3 - FIFO \n4 - LIFO \n5 - Maior Valor \n6 - Menor Valor \n7 - Tamanho \n Escolha: ")) 

 if Acesso == 1:
   Senha = int(input("\nDigite sua Senha (Valor Interio): "))
   PilhaList.append(Senha)
   
   Escolha = str(input("\nDeseja Inserir mais ? S/N: "))
   
   while Escolha == "S" or Escolha == "s":
       Senha = int(input("Digite sua Senha: "))
       PilhaList.append(Senha)
       Escolha = str(input("\nDeseja Inserir mais ? S/N: "))
       continue
   
   if Escolha == "N" or Escolha == "n":
    print("Encerrado a Pilha!")
    print("------------------")
    Acesso = int(input("\n0 - Sair \n1 - Inserir \n2 - Verificar \n3 - FIFO \n4 - LIFO \n5 - Maior Valor \n6 - Menor Valor \n7 - Tamanho \n Escolha: ")) 
     
 if Acesso == 0:
    print("\nFinalizando Programa!")

 if Acesso == 2:
   Verificador()
   print("------------------")
   Pilha()
   
 if Acesso == 3:
   FIFO()
   print("------------------")
   Pilha()

 if Acesso == 4:
   LIFO()
   print("------------------")
   Pilha()

 if Acesso == 5:
   MaiorValor()
   print("------------------")
   Pilha() 

 if Acesso == 6:
   MenorValor()
   print("------------------")
   Pilha() 

 if Acesso == 7:
   Tamanho()
   print("------------------")
   Pilha() 
   
 if Acesso > 7:
  print("\nERRO: Digite um Valor Valido!")


# Verificador de Par e Impar
def Verificador():
  for x in PilhaList:
   if x % 2 == 0:
     Pares.append(x)
   elif x % 2 == 1:
     Impares.append(x)

  print("\n------ Verificador ------")
  print(f"Pilha: {PilhaList}")
  print(f"Pares: {Pares}")
  print(f"Impares: {Impares}")


# FIFO - First In and First Out
def FIFO():
  print("\nFirst In and First Out")
  PilhaList.pop(0)
  print(f"Nova Pilha: {PilhaList}")


# LIFO - Last In and First Out
def LIFO():
  print("\nLast In and First Out")
  PilhaList.pop(-1)
  print(f"Nova Pilha: {PilhaList}")  


# Maior Valor
def MaiorValor():
  maior = max(PilhaList)
  print(f"\nMaior Valor na Pilha: {maior}")


# Menor Valor
def MenorValor():
  menor = min(PilhaList)
  print(f"\nMenor Valor na Pilha: {menor}")


# Tamanho da Pilha
def Tamanho():
  tamanho = len(PilhaList)
  print(f"\nTamanho da Pilha: {tamanho}")


# Programa Python
Layout()
Pilha()     
