"""
    @author Matheus Lopes

    O que são PEP's?
    - São arquivos que apresentam propostas de melhorias para a Linguagem Python
    - https://peps.python.org/pep-0008/
    - https://wiki.python.org.br/GuiaDeEstilo
    - https://medium.com/gbtech/pep-8-e-imports-em-python-78a6fbf53475


    Regras mais utilizadas:
    1) O pycharm vem com o código padrão de reconhecimento em inglês
    - Para o pycharm reconhecer em português faça:
    File - Settings - Inspections - Proofreding - Desmarque Typo

    2) Identação (Organização do Código)
    - Utilize 4 espaços para cada código dentro de blocos como funções, condicionais, dentre outros.

    if x < 10:
        if y > 10:
            y = 5  

    OBS: Sempre utilize TAB

    3) Linhas em Branco
    - Seu programa deve sempre ter uma linha branca no final
    - Separe as funções e classes com duas linhas

    def x():
        pass

    def y():
        pass

    4) Importação 
    - Se deseja importar um biblioteca ou mais, importe de uma só vez e logo no início do programa (Após os comentários)

    Modo Certo
    import x
    import y

    Modo Errado
    import x, y

    5) Uso de Espaços
    - Nunca utilize espaço Antes ou Depois de chaves, colchetes ou parenteses.
    - Use um espaço antes e depois quando declarar uma variável ou usar um operador do tipo (<, >, ==, etc.)

    def x():
        pass

    y = 10

    6) Nomeclatura de variáveis
    - Utilizar Minúsculas separadas de undeline
    - Utilizar Maiúsculas separadas de underline
    - Utilizar palavras começando com Maiúsculas

    idadeJoao = 17
    idade_Joao = 18
    IDADE_JOAO = 18
"""