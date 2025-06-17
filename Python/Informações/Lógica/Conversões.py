#conversão do tipo int
print(float(10)) # 10.0
print(bool(1)) # True
print(bool(0)) # False

#conversão do tipo float
print(int(9.999)) # 9
print(bool(-0.99)) # True
print(str(-0.99)) # '-0.99'

#conversão do tipo bool
print(int(True)) # 1
print(float(False)) # 0.0
print(str(True)) # 'True'

#conversão do tipo str
print(int('-99')) # 99
print(float('0.01')) # 0.00001
print(bool('palavra')) # True
print(bool('')) # False

#########################
orcamento = 5000
vlr_gasto = 430
pct = (vlr_gasto/orcamento)
print(f'Porcentagem já gasta do orçamento: {pct:.2%}')