# Marca, Memória Ram, Placa de Vídeo
class Computador:
    def __init__(self, marca, ram, placa):
        self.marca=marca
        self.memoriaRam=ram
        self.placaVideo=placa
    pass

    def Ligar(self):
        print('Ligando ....')
        
    def Desligar(self):
         print('Desligando .....')   
    
    def ExibirInformacao(self):
        print(self.marca, self.memoriaRam, self.placaVideo)

comp1 = Computador('Asus','8GB','Nvidia')
comp1.Ligar()
comp1.ExibirInformacao()
comp1.Desligar()