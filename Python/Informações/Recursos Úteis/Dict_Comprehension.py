'''
# dict comprenhesion sem condicional 
{chave: valor for item in sequencia} 
 
# dict comprenhesion com  condicional 
{chave: valor for item in sequencia if condicao} 

**************************************************************************

# todos os números elevado à potência 2 
dict_todos = {} 
for item in range(1, 11): 
    dict_todos[item] = item ** 2 
print('Todos numeros:', dict_todos) 
 
# apenas números ímpares elevado à potência 2 
dict_impares = {} 
for item in range(1, 11): 
    if item % 2 != 0: 
        dict_impares[item] = item ** 2 
print('Números ímpares à potência 2:', dict_impares)
'''
# todos os números elevado à potência 2 
dict_todos = {item: item ** 2 for item in range(1, 11)} 
print('Todos numeros:', dict_todos) 
 
# apenas números ímpares elevado à potência 2 
dict_impares = {item: item ** 2 for item in range(1, 11) if item % 2 != 0} 
print('Números ímpares à potência 2:', dict_impares) 

