# Exercicios Especial 01

import random

def forca():
    comida = ['arroz', 'feijao', 'carne']
    carro = ['bmw', 'ford', 'ferrari']
    pais = ['canada', 'suica', 'gracia']
    
    tudo = comida + carro + pais

    # valor_inicial = 1

    print(random.choice(tudo))

forca()