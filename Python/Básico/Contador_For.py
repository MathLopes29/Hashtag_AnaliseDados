'''
soma = 0;
numero = int(input("Digite um numero: "));

for num in range(1, numero + 1):
    if numero % num == 0:
        soma = soma + num
        print(f"Soma: {soma}");
print(f"Num: {num}");
'''

numero = int(input("Digite quantas vezes deseja multiplicar seu numero: "));
for num in range (1, numero + 1):
    print(f'{num * 10}');


