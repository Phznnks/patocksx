#IMPORTAÇÕES DE BIBLIOTECAS/FRAMEWORK
from flask import Flask, render_template, request
import requests, os, json

#INICIALIZAÇÃO DO FLASK E DEFINIÇÃO DOS LOCAIS DOS TEMPLATES
app = Flask(__name__, template_folder=os.path.abspath('Tools/Painel-Ducksx/v2/client'), static_folder=os.path.abspath('Tools/Painel-Ducksx/v2/client'))

#ROTA DA FUNÇÃO INDEX()
@app.route('/', methods=['GET', 'POST'])
def index():
    """
    Função que renderiza a página inicial (index.html) e processa os dados do formulário.

    Returns:
    - Se o método for POST, processa os dados do formulário e renderiza a página de resultado correspondente.
    - Se o método for GET, simplesmente renderiza a página inicial.
    """
    render_template('index.html')
    if request.method == 'POST':
        nome = request.form['nome']
        opcao = request.form['opcao']
        
        urls = {
            '1': f"https://dbftools.pro/api/tools/name?q={nome}",
            '2': f"https://dbftools.pro/api/tools/search-cpf/{nome}",
            '3': f"https://dbftools.pro/api/tools/search-cnpj/{nome}",
            '4': f"https://dbftools.pro/api/tools/phone?q={nome}",
            '5': f"https://dbftools.pro/api/tools/email?q={nome}",
            '6': f"https://dbftools.pro/api/tools/generate-person",
            '7': 'Em Desenvolvimento!'
        }

        url = urls.get(opcao)

        response = requests.get(url)

        try:
            dados = response.json()
            if not isinstance(dados, list):
                dados = [dados]  # Se não for uma lista, converte para uma lista
        except json.decoder.JSONDecodeError:
            dados = []  # Se ocorrer um erro ao decodificar JSON, retorna uma lista vazia

        if response.status_code == 200:
            if opcao == '1':
                dados_formatado = [{
                    'nome': item.get('nome'),
                    'cpf': item.get('cpf'),
                    'idade': item.get('idade'),
                    'nomeMae': item.get('nomeMae')
                } for item in dados]
                return render_template('result.html', dados=dados_formatado)
            if opcao == '2':
                #Processamento dos dados para a opção 2.
                return render_template('resultcpf.html', dados=dados)
            if opcao == '3':
                return render_template('resultcnpj.html', dados=dados)
        else: 
            #Se nao funcionar retorna essa mensagem
            return "ERRO: Parece que algo deu errado!."
    else:
        return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
