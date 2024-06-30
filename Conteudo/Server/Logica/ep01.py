'''
A ideia da logica e criar um programa que orgraniza uma lista
em x ordem, Exemplo: Se fosse uma lista de nomes de pessoas, ela vai se
organizar de A a Z, ou gerar numeros aleatorios de x em x e enverte para a ordem deles.
'''

''' SIGNIFICADO DAS VARIAVEIS
TOTALN -- TOTAL DE NOMES QUE A PESSOA QUE COLOCA.}
VALORAT -- VALOR ATUAL 
'''

valorat = 0
totaln = int(input('Informe a quantidade de pessoa que estará na lista: '))
nomes = []

while totaln > valorat: 
    nomes = nomes + [str(input('Informe o nome da pessoa: '))]
    valorat = valorat + 1
print(nomes)