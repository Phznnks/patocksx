from flask import Flask, request, render_template
import requests
import os

app = Flask(__name__, template_folder=os.path.abspath('HatRed/Painel-Ducksx/client'), static_folder=os.path.abspath('HatRed/Painel-Ducksx/client'))

@app.route('/', methods=['GET', 'POST'])
def index():
    render_template('index.html')
    if request.method == 'POST':
        nome = request.form['nome']
        nome_formatado = nome.replace(" ", "+")
        url = f"https://dbftools.pro/api/tools/name?q={nome_formatado}"
        response = requests.get(url)
        if response.status_code == 200:
            opcao = request.form.get('opcao')
            if opcao == '1':
                data = response.json()
                formatted_data = [{'nome': item.get('nome'), 'cpf': item.get('cpf'), 'idade': item.get('idade')} for item in data]
                return render_template('result.html', data=formatted_data)
            elif opcao == '2':
                print('ainda em desenvolvimento')
                return render_template('resultcpf.html')
            else:
                return "Escolha 1 ou 2!"
        else:
            return "Erro ao fazer a requisição."
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
    