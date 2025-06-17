anterior = 0;
proximo = 1;
parada = 1;
soma = 0;

while parada <= 5:
    proximo = proximo + anterior;
    anterior = proximo - anterior;
    divisor = 1;
    num_divisor_inteiro = 0
    while divisor <= proximo:
        
        if proximo / divisor == 0:
            num_divisor_inteiro == 1
        divisor == 1
        
        if num_divisor_inteiro == 2:
            soma = soma + proximo
            print(proximo);
            parada ++ 1

print(soma/5)