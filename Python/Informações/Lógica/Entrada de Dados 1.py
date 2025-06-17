"""
Input (Input) e Output (Print)

OBS: Os dados recebidos ambos são do tipo String, desse modo devemos converter para o tipo que deseja (Int, Float, Double, Char, etc.)
"""

print(f"Mensagem!", end='\n')

x = int(input("Digite um numero: "))
## print(f"Valor digitado: %", x)
print(f"Valor digitado: {x}", end='\n')


y = int(input("Digite um numero: "))
## print(f"Valor digitado: %", y)
print(f"Valor digitado: {y}", end='\n')

print(f"Soma dos valores: {x+y}", end='\n')