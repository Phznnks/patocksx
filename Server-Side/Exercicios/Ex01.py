# Exercicio aula 6 


def ex01():

    nome = str(input('Informe o seu nome completo: '))

    print(nome.upper())

    print(nome.lower())

    print(len(nome.replace(' ', '')))

    print(len(nome[0:5]))

#ex01()
    
def ex02():

    num = int(input('Digite um num_strero de 0 a 9999: '))

    u = num // 1 % 10
    d = num // 10 % 10
    c = num // 100 % 10 
    m = num // 1000 % 10

    print(f'Unidade: {u}\nDezena: {d}\nCentena: {c}\nMilhar: {m}')

#ex02()

def ex03():
    estado = str(input('informe o seu estado: ')).strip()
    print(estado[:4].lower() == 'vila')

#ex03()

def ex04():
    nome = str(input('Informe o seu nome completo: '))
    print('silva' in nome.lower())
#ex04()

def ex05():
    frase = str(input('Digite uma frase: ')).lower()
    print(frase)
ex05()