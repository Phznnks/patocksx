from flask import Flask, render_template, request
import language_tool_python as lt
import re

app = Flask(__name__)
ferramenta = lt.LanguageTool('pt-BR')

def corrigir_texto(texto):
    correcoes = ferramenta.check(texto)
    texto_corrigido = ferramenta.correct(texto)

    padrao = r'\s+(e|ou|mas)\s+'
    texto_corrigido = re.sub(padrao, r', \1 ', texto_corrigido)

    return texto_corrigido

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        texto_entrada = request.form['texto_entrada']
        texto_corrigido = corrigir_texto(texto_entrada)
        return '''
            <!DOCTYPE html>
            <html lang="pt-BR">
            <head>
                <meta charset="UTF-8">
                <title>Resultado da Correção</title>
            </head>
            <body>
                <h2>Texto Corrigido:</h2>
                <p>{}</p>
                <br>
                <a href="/">Corrigir outro texto</a>
            </body>
            </html>
        '''.format(texto_corrigido)
    else:
        return '''
            <!DOCTYPE html>
            <html lang="pt-BR">
            <head>
                <meta charset="UTF-8">
                <title>Corretor de Texto</title>
            </head>
            <body>
                <h2>Corretor de Texto em Português</h2>
                <form action="/" method="post">
                    <textarea name="texto_entrada" rows="10" cols="80"></textarea><br><br>
                    <input type="submit" value="Corrigir Texto">
                </form>
            </body>
            </html>
        '''

if __name__ == '__main__':
    app.run(debug=True)
