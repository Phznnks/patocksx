import requests

urlcpf = f"https://dbftools.pro/api/tools/search-cpf/07068093868"
responsecpf = requests.get(urlcpf)
print(responsecpf.json())

'''
if response.status_code == 200:
    opcao = int(input('Escolha a forma 1 ou a 2 mais bonita!.'))
    if opcao == 1:
        print(response.json())
    elif opcao == 2:
        data = response.json()
        for item in data:
            print(f'NOME: {item.get("nome")}', ' ' ,end="")
            print(f'IDADE: {item.get("idade")}', ' ' ,end="")
            print(f'CPF: {item.get("cpf")}')
    elif opcao == 3: 
        if responsecpf.status_code == 200:
            print(responsecpf.json())
    else: 
        print('Escolha 1 ou 2!.')
else:
    print("Erro ao fazer a requisição.")
'''