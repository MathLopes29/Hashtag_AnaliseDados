'''

range (inicio, fim, condição)

x: int
soma: int

N = int(input("Quantos numeros serao digitados? "))

soma = 0
for i in range(0, N):
 x = int(input("Digite um numero: "))
 soma = soma + x

print("SOMA = ", soma) 

seriado = "Todo mundo odeia o Chris";
for letra in seriado:
    print(letra, end=" ");
    pass

num = range(2,20);
for numero in num:
    if numero % 2 == 0:
        print(f"Achei um número Par: {numero}\n");
        break
    else:
        print(f"Achei um número Ímpar: {numero}\n");
        break
'''

print("***************************************");
heroi = "Batman"
for valor in enumerate(heroi):
    print(f"{valor}")
    pass

print("\n");

for contador,letra in enumerate(heroi):
    print(f"{contador + 1} letra: {letra}");
    pass

print("\n");

for valor in enumerate(range (3,7)):
    print(valor);

print("\n");

for contador,letra in enumerate(range(3,7)):
    print(f"{contador + 1} numero: {letra}");
    pass

print("\n");

# Realiza a busca na faixa de 250 e 300
for num in range(250, 301):
    # verifica se o número é divisível por 21
    if num % 21 == 0:
        print('Número encontrado:', num)
        # se for divísivel por 21, interrompe a busca
        break
        
while num >= 250 and num < 301:
    if num % 21 == 0:
        print('Número encontrado', num)
        break
    else:
        print('Número não encontrado!')