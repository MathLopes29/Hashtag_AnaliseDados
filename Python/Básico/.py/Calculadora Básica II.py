## @author Matheus Lopes 
## Calculadora Python II

print("***********************\n");
print(f"CALCULADORA\n");
print("************************\n");

num1 : float;
num1 = float(input(f"Digite 1º valor: "));
print(f"Valor Escolhido: {num1}\n")

num2 : float;
num2 = float(input(f"Digite 2º valor: "));
print(f"Valor Escolhido: {num2}\n")

soma : float;
soma = (num1 + num2);

subtracao : float;
subtracao = (num1 - num2);

divisao : float;
divisao = (num1 / num2);

multiplicacao: float;
multiplicacao = (num1 * num2);

escolha = int (input(f"Digite o que deseja fazer: 1 - Soma, 2 - Subtração, 3 - Divisão, 4 - Multiplicação ... \nDigite Sua Escolha: "));
print(f"{escolha}\n");


if escolha == 1 :
    print(f"Soma: {soma}");
    pass
elif escolha == 2:
    print(f"Subtração: {subtracao}");
elif escolha == 3:
    print(f"Divisão: {divisao}");
    pass
elif escolha == 4:
    print(f"Multiplicação: {multiplicacao}");
    pass
else:
    print("Valor inválido!");
    pass