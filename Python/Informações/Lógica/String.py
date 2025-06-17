# nome = str;
nome = "Matheus Lopes"
print(nome[1:3])
print('Lopes' in nome)
print('Mateus' in nome)

# Tamanho de String (Lenght) 
print(len(nome))

# Nome em Maiúscula
print(nome.upper())

# Nome me Minúsculo
print(nome.lower())

# Nome começa com a letra ...
print(nome.startswith())

# Nome termina com a letra ...
print(nome.endwith())

# Verifica se o dentro da variável nome temos a str 'Lopes'
print(nome.find('Lopes'))

# Particiona a str em outas, que são separadas por um espaço tornando uma "array"
print(nome.slipt())
print(nome.slipt(';'))
print(nome.slipt('.'))

# Remove os espaços
print(nome.strip())

###################################################################
#################### Exemplo ####################
print('nome'.upper())
print('a, b, c, d'.split(','))
print('Belo Horizonte'.replace('Horizonte', 'Monte'))
