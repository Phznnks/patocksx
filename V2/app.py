from flask import Flask, request, render_template
import requests
import os

app = Flask(__name__, template_folder=os.path.abspath('templates'))

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
                return render_template('result.html', data=response.json())
            elif opcao == '2':
                data = response.json()
                formatted_data = [{'nome': item.get('nome'), 'cpf': item.get('cpf'), 'idade': item.get('idade')} for item in data]
                return render_template('result.html', data=formatted_data)
            else:
                return "Escolha 1 ou 2!"
        else:
            return "Erro ao fazer a requisição."
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)