maior = []
menor = []

valor = int(input('Digite um valor para ser comparado: ')) 
limite = int(input('Digite o limite para o loop: '))

for i in range(limite):
    if(i < valor):
        menor.append(i)
    elif (i > valor):
        maior.append(i)
    elif (i == valor):
        print(f"{valor} é Igual !")

print('\nResultado Final')
print('Maiores: ', maior)
print('Menores: ', menor)