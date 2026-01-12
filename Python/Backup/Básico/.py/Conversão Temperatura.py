"""
@author Matheus Lopes
Convertor de Temperatura em Python
"""

print("==============================");
print("\n CONVERTOR DE TEMPERATURA \n");
print("==============================\n");

### F = (C * 1.8) + 32
TempC : float;
TempC = float(input("Digite a Temperatura (Cº): "));
print("\n");

TempT : float;
TempF = (TempC * 1.8) + 32;
print(f"Temperatura em Fº: {TempF}\n");


### K = C + 273.15
TempK : float;
TempK = (TempC + 273.15);
print(f"Temperatura em Kº: {TempK}\n");