import copy

class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade
    
    def __str__(self):
        return f'Nome: {self.nome}, Idade: {self.idade}'
    
    def clone(self):
        return copy.copy(self)
    
class PessoaManager:
    def __init__(self):
        self.pessoas = {}
    
    def add_pessoa(self, nome, idade, id):
        pessoa = Pessoa(nome, idade)
        self.pessoas[id] = pessoa
    
    def get_pessoa(self, id):
        return self.pessoas[id].clone()

manager = PessoaManager()

# Adiciona duas pessoas
manager.add_pessoa("João", 30, 1)
manager.add_pessoa("Maria", 25, 2)

# Clona a pessoa de ID=1
pessoa1 = manager.get_pessoa(1)
pessoa1.nome = "Jose"

# Clona a pessoa de ID=1
pessoa2 = manager.get_pessoa(1)
print(f"O seu nome é {pessoa2.nome}? ")

temp = input("Digite S para sim ou N para não: ")
if (temp == "N"):
    pessoa2.nome = input("Entre com seu novo nome: ")
    print("Nome alterado com sucesso ....")

# imprime as duas pessoas
print(manager.get_pessoa(1))
print(manager.get_pessoa(2))
print(pessoa1)
print(pessoa2)