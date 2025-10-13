'''
x = True;
while x == True:
    print("Estou Acordado!");
    x = False;
'''

contador = 0;

while contador < 10:
    contador = contador + 1;
    print(f"{contador}\n");
    
    if contador == 10:
        break
        continue
