import time 

print('Jogo da Forca PATOCKSX!')

começar = input('Digite "jogar" para começar: ')

def forca():
    if começar == "jogar":
        print('ESCOLHA A CATEGORIA!')
        print(' 1 | Comidas\n 2 | frutas\n 3 | Animais\n 4 | Carro\n 5 | País\n 6 | Aleatorio\n 7 | Tudo')
        Comidas = []
        Frutas = []
        Animais = []
        Carro = []
        categoria = int(input('Digitar o numero da categoria:'))
    else:
        print('vocÊ não inicializou o jogo! :(')
forca()