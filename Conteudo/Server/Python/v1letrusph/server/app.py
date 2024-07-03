from flask import Flask, render_template, request
import language_tool_python as lt
import re
import os

app = Flask(__name__, template_folder=os.path.abspath('Conteudo/Server/Python/v1letrusph/client'), static_folder=os.path.abspath('Conteudo/Server/Python/v1letrusph/client'))

def corrigir_texto(texto):
    ferramenta = lt.LanguageTool('pt-BR')

    correcoes = ferramenta.check(texto)
    texto_corrigido = ferramenta.correct(texto)

    padrao = r'\s+(e|ou|mas)\s+'
    texto_corrigido = re.sub(padrao, r', \1 ', texto_corrigido)

    return texto_corrigido

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/corrigir', methods=['POST'])
def corrigir():
    texto = request.form['texto']
    texto_corrigido = corrigir_texto(texto)
    return render_template('index.html', texto_corrigido=texto_corrigido)

if __name__ == '__main__':
    app.run(debug=True)
