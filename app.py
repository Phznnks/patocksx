from flask import Flask, request, render_template
import requests

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
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
    app.run(debug=True)TemplateNotFound
jinja2.exceptions.TemplateNotFound: index.html

Traceback (most recent call last)
File "/home/codespace/.python/current/lib/python3.10/site-packages/flask/app.py", line 1488, in __call__
return self.wsgi_app(environ, start_response)
File "/home/codespace/.python/current/lib/python3.10/site-packages/flask/app.py", line 1466, in wsgi_app
response = self.handle_exception(e)
File "/home/codespace/.python/current/lib/python3.10/site-packages/flask/app.py", line 1463, in wsgi_app
response = self.full_dispatch_request()
File "/home/codespace/.python/current/lib/python3.10/site-packages/flask/app.py", line 872, in full_dispatch_request
rv = self.handle_user_exception(e)
File "/home/codespace/.python/current/lib/python3.10/site-packages/flask/app.py", line 870, in full_dispatch_request
rv = self.dispatch_request()
File "/home/codespace/.python/current/lib/python3.10/site-packages/flask/app.py", line 855, in dispatch_request
return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)  # type: ignore[no-any-return]
File "/workspaces/patocksx/app.py", line 25, in index
return render_template('index.html')
File "/home/codespace/.python/current/lib/python3.10/site-packages/flask/templating.py", line 149, in render_template
template = app.jinja_env.get_or_select_template(template_name_or_list)
File "/home/codespace/.local/lib/python3.10/site-packages/jinja2/environment.py", line 1081, in get_or_select_template
return self.get_template(template_name_or_list, parent, globals)
File "/home/codespace/.local/lib/python3.10/site-packages/jinja2/environment.py", line 1010, in get_template
return self._load_template(name, globals)
File "/home/codespace/.local/lib/python3.10/site-packages/jinja2/environment.py", line 969, in _load_template
template = self.loader.load(self, name, self.make_globals(globals))
File "/home/codespace/.local/lib/python3.10/site-packages/jinja2/loaders.py", line 125, in load
source, filename, uptodate = self.get_source(environment, name)
File "/home/codespace/.python/current/lib/python3.10/site-packages/flask/templating.py", line 65, in get_source
return self._get_source_fast(environment, template)
File "/home/codespace/.python/current/lib/python3.10/site-packages/flask/templating.py", line 99, in _get_source_fast
raise TemplateNotFound(template)
jinja2.exceptions.TemplateNotFound: index.html
The debugger caught an exception in your WSGI application. You can now look at the traceback which led to the error.
To switch between the interactive traceback and the plaintext one, you can click on the "Traceback" headline. From the text traceback you can also create a paste of it. For code execution mouse-over the frame you want to debug and click on the console icon on the right side.

You can execute arbitrary Python code in the stack frames and there are some extra helpers available for introspection:

dump() shows all variables in the frame
dump(obj) dumps all that's known about the object
Brought to you by DON'T PANIC, your friendly Werkzeug powered traceback interpreter.