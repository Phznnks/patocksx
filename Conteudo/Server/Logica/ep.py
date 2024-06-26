# Analise de dados por array/list

quantinome = int(input('Informe o total de nomes que estará na lista do banco de dados: '))
verificador = 0
tablenome = []

while quantinome > verificador:
    listanomes = [str(input('Informe o nome da pessoa, para analiser de dados: '))]
    tablenome = tablenome + listanomes 
    verificador = verificador + 1
print('fim do loop')
print(tablenome)

print(tablenome[1])