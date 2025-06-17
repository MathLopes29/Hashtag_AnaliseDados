'''

hora: int;

hora = int(input("Digite uma hora do dia: "))

if hora < 12:
 print("Bom dia!")
else:
 print("Boa tarde!"); 
 
 '''
 # idade 22 anos, faixa etária: Adulto
idade = 22
if idade < 12:
 faixa_etaria = 'Criança'
elif idade < 18:
 faixa_etaria = 'Adolescente'
elif idade < 60:
 faixa_etaria = 'Adulto'
else:
 faixa_etaria = 'Idoso'
print('Faixa Etária: ', faixa_etaria)