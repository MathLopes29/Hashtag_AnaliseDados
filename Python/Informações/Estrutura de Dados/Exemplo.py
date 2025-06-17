"""
Lista
"""
# Criação das listas de alunos das turmas 
ING = ['Gabriel', 'Caio', 'Maria', 'Ana', 'Juliano', 'Flávia', 'Rubens', 'Bruna'] 
ESP = ['Caio', 'Artur', 'Beatriz', 'Carolina', 'Maria', 'Juliano', 'Bruna', 'Rui'] 
FRA = ['Pedro', 'Bruna', 'Paula', 'Tiago', 'Maria', 'Flávia', 'Rui', 'Carolina'] 
 
# Concatenação de todas as listas de alunos 
ALL = ING + ESP + FRA 
 
# Ordenação para melhor visualização 
ALL.sort() 
 
# Exibição do resultado 
print('Relação de todos os alunos da escola:') 
print(ALL)

"""
Conjuntos
"""
# Criação dos conjuntos de alunos das turmas 
ING = {'Gabriel', 'Caio', 'Maria', 'Ana', 'Juliano', 'Flávia', 'Rubens', 'Bruna'} 
ESP = {'Caio', 'Artur', 'Beatriz', 'Carolina', 'Maria', 'Juliano', 'Bruna', 'Rui'} 
FRA = {'Pedro', 'Bruna', 'Paula', 'Tiago', 'Maria', 'Flávia', 'Rui', 'Carolina'} 
 
# Operação de união dos conjuntos (união dos alunos de todas as turmas) 
# Também poderia ser: ALL = ING.union(ESP).union(FRA) 
ALL = ING | ESP | FRA 
 
 
# Exibição do resultado 
print('Relação de todos os alunos da escola:') 
print(ALL)


"""
Conjuntos sets
"""
ING = {'Gabriel', 'Caio', 'Maria', 'Ana', 'Juliano', 'Flávia', 'Rubens', 'Bruna'} 
ESP = {'Caio', 'Artur', 'Beatriz', 'Carolina', 'Maria', 'Juliano', 'Bruna', 'Rui'} 
FRA = {'Pedro', 'Bruna', 'Paula', 'Tiago', 'Maria', 'Flávia', 'Rui', 'Carolina'} 

# 1 – Interseção entre os pares de turmas: (ING & ESP), (ING & FRA) e (ESP & FRA) 
# 2 – Calcula a união das interseções 
ALUNOS_DESCONTO = (ING & ESP) | (ING & FRA) | (ESP & FRA) 
 
# Exibição do resultado 
print('Relação de dos alunos com desconto:') 
print(ALUNOS_DESCONTO)
