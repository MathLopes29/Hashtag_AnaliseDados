"""
@author Matheus Lopes
Calculadora em Python Básico
"""

print("===================================\n");
print(" CALCULADORA PYTHON \n");
print("===================================\n");


num1 = float(input("Digite o 1ºValor: "));
print(f"Valor Escolhido: {num1}\n")

num2 = float(input("Digite o 2ºValor: "));
print(f"Valor Escolhido: {num2}\n")

print(f"Soma: {num1+num2}")
print(f"Subtração: {num1-num2}")
print(f"Multiplicação: {num1*num2}")
print(f"Divisão: {num1/num2}\n")

media : float;
media = ((num1 + num2) / 2);

if media > num1 / num2:
    print(f"A média é superior: {media}, onde a divisão tem o valor de: {num1 / num2}")
    pass
else:
    print(f"A média {media} não é superior a divisão dos dois números: {num1 / num2}");
    pass