from flask import Flask, render_template, request, redirect
import pandas as pd
import os

app = Flask(__name__, template_folder=os.path.abspath('Projetos/Flask/client'))

# Lista para armazenar os dados das inscrições
inscricoes = []

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/inscricao', methods=['POST'])

def inscrever():
    nome = request.form['nome']
    email = request.form['email']
    telefone = request.form['telefone']
    inscricao = {'nome': nome, 'email': email, 'telefone': telefone}
    inscricoes.append(inscricao) 

    # Salvar os dados em um arquivo Excel
    df = pd.DataFrame(inscricoes)
    df.to_excel('inscricoes.xlsx', index=False)

    return redirect('/')

@app.route('/dados')
def listar_dados():
    return render_template('dados.html', inscricoes=inscricoes)

@app.route('/dados/<int:index>')
def detalhar_dado(index):
    inscricao = inscricoes[index]
    return render_template('detalhe.html', inscricao=inscricao)

if __name__ == '__main__':
    app.run(debug=True)