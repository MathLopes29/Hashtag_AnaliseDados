'''
# Estrutura:[expr(item) for item in sequencia if condicao)]

# Lista Original:
potencias = []
for item in range(1, 11):
    if item % 2 == 0:
     potencias.append(item ** 2)
print(potencias)
'''
# Exemplo de Compreensão de ArrayList - Potência:
potencias1 = [f'Valor: {item ** 2}' for item in range(1, 11)]
print(potencias1)

# Multiplicação:
valor = [n * 10 for n in range (1,11)]
print(valor)

# Letras:
letra = [c.upper() for c in 'mario']
print(letra)

# Par ou Ímpar:
verf = [(n % 2 == 0) for n in range (1,10)]
print(verf)

# Potência + Par:
potencias2 = [item ** 2 for item in range (1,11) if item % 2 == 0]
print(potencias2)

