# Somente Leitura  
arquivo = open('D:\Python Complementar\Prática\Codes\Aulas\Manipulação de Arquivos\cidades.txt', 'r') 
for linha in arquivo: 
    print(linha.rstrip( )) 
arquivo.close()

# Add Dados
linhas = [ 
    "AL; Maceio; 1005319\n", 
    "RJ; Duque de Caxias; 878402\n", 
    "RN; Natal; 862044\n", 
    "MS; Campo Grande; 843120\n" 
] 
arquivo = open('D:\Python Complementar\Prática\Codes\Aulas\Manipulação de Arquivos\cidades.txt', 'a') 
arquivo.writelines(linhas) 
arquivo.close()


# Print Tudo
arquivo = open('D:\Python Complementar\Prática\Codes\Aulas\Manipulação de Arquivos\cidades.txt', 'r')
for linha in arquivo:
    print(linha.split(' '))
arquivo.close() 

'''
# Somando População
arquivo = open('D:\Python Complementar\Prática\Codes\Aulas\Manipulação de Arquivos\cidades.txt', 'r')
soma = 0
i = -2
for linha in arquivo:
    cidade = linha.split(' ')
    populacao = int(cidade[i])
    print(populacao)
    soma = soma + populacao
arquivo.close()
print('Total: ', soma)
'''