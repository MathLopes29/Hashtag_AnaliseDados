vendas_tecnologia = {'notebook asus': 2450, 'iphone': 15000, 'samsung galaxy': 12000, 'tv samsung': 10000, 'ps5': 14300, 'tablet': 1720, 'notebook dell': 17000, 'ipad': 1000, 'tv philco': 2500, 'notebook hp': 1000}

list_ordenado = list(vendas_tecnologia.keys())
list_ordenado.sort()

for chave in list_ordenado:
    print({chave: vendas_tecnologia[chave]})
