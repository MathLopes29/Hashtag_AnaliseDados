from asyncio.windows_events import NULL
from abc import ABC, abstractmethod
import copy

class Pessoa:
    @abstractmethod
    def __init__(self, ra, nome, idade, curso):
        self.ra = ra
        self.nome = nome
        self.idade = idade
        self.curso = curso
    
    def __str__(self):
        return f'RA: {self.ra} - Nome: {self.nome} - Idade: {self.idade} - Curso: {self.curso}'
    
    def returnCopy(self):
        return copy.copy(self)


class PessoaManager:
    def __init__(self):
        self.pessoas = {}

    def add_pessoa(self, ra, nome, idade, curso, id):
        pessoa = Pessoa(ra, nome, idade, curso)
        self.pessoas[id] = pessoa

    def get_pessoa(self, id):
        return self.pessoas[id].returnCopy()    

manager = PessoaManager()

if(True):
    CadRa = int(input("Digite seu RA: "))
    while 0 > CadRa :
        print("Digite novamente!")
        CadRa = input("Digite seu RA: ")

    CadNome = input("Nome: ")
    while CadNome == NULL:
        print("Digite novamente!")
        CadNome = input("Nome: ")

    CadIdade = int(input("Idade: "))
    while CadIdade == 0:
         print("\nDigite novamente!")
         CadIdade = int(input("Idade: "))
         
    CadCurso = input("Curso: ")

    CadID = 1
    while CadID == 0:
        print("Erro!")

    manager.add_pessoa(CadRa, CadNome, CadIdade, CadCurso, CadID)
# endif

print(manager.get_pessoa(1))