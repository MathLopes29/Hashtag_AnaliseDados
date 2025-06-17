"""
Um  módulo  em  Python  nada  mais  é  do  que  um  arquivo  texto contendo códigos com declarações de variáveis e ou funções. Estes arquivos de módulos devem sempre ser salvos com a extensão .py, que simboliza um arquivo do Python.  

Nós utilizamos módulos para poder organizar (modularizar) os nossos  códigos  de  acordo  com  as  funcionalidades  de  cada  conjunto  de funções. 
"""

# Define o valor de PI 
PI = 3.141592 
 
# Calcula a área do quadrado 
def quadrado(l):  
    return l ** 2 
 
# calcula a área de um triângulo 
def triangulo(b, h):     
    return (b * h)/2 
 
# calcula a área de um círculo 
def circulo(r):     
    return PI * (r ** 2) 
 
# calcula a área de uma elipse 
def circulo(a, b):     
    return PI * a * b 
 
# calcula a área de um trapézio 
def trapezio(B, b, h):     
    return  (B + b) * h / 2 

# Importe de Todos Métodos:
from Modulos import * 
quadrado(2)

# Import Básico e Melhor:
import Modulos as mod
mod.circulo(2)

"""
Módulos Embutidos: Estes  módulos são desenvolvidos e mantidos pela comunidade responsável pela linguagem e são exaustivamente testados  e otimizados antes de serem lançados aos usuários finais.
"""

# modulo com funções matemáticas para cálculos mais complexos 
import math 
print('Função cosseno:', math.cos(100)) 
print('Função log:', math.log(10))

# modulo para construção de sequências elaboradas 
import itertools 
print(list(itertools.combinations('ABCD', 3))) # combinação de 3 em 3 print(list(itertools.permutations(['a', 'b', 'c'], 2))) 
# permutação de 2 em 2

# modulo para manipulação de timestamps (datas, horários, deltas etc.) 
from datetime import datetime, timedelta 
print('Datetime atual:', datetime.now()) 
print('Datetime após 7 dias:',  datetime.now() + timedelta(days=7)) 

# modulo para criação de números e sequências randômicas 
import random 
print('Numero aleatório entre 0 e 1:', random.random()) 
print('Inteiro aleatório entre 50 e 100:', random.randint(50, 100))

# modulo para funcionalidades que dependem do sistema operacional Linux ou Windows
import os 
os.mkdir('pasta') # cria um diretório chamado pasta  
print('Caminho completo:', os.path.join('/home/antonio', 'pasta', 'arquivo.txt')) 

"""
Instalando Módulos: pip install <pacote>

* Tutorial oficial com um guia sobre o empacotamento de códigos em Python: https://packaging.python.org/en/latest/tutorials/packaging-projects/ 
* Repositório oficial de pacotes Python: https://pypi.org/ 
* Página oficial do pacote pandas: https://pandas.pydata.org/
* Tutorial de instalação pip: https://pip.pypa.io/en/stable/installation/ 
 

* pip install pandas
* pip install --upgrade pandas
* pip install colorama 

from colorama import Fore, Back, Style
 print ("Texto Normal!")
 print (Fore.BLUE + "Azul!")
 print (Fore.RED + Back.WHITE + 'Texto Vermelho')
 print (Style.RESET_ALL + "Normal!")
"""

