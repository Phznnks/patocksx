import requests

nome = input("Digite o nome para pesquisar: ")

nome_formatado = nome.replace(" ", "+")

url = f"https://dbftools.pro/api/tools/name?q={nome_formatado}"

response = requests.get(url)

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
    else: 
        print('Escolha 1 ou 2!.')
else:
    print("Erro ao fazer a requisição.")