
const mysql = require('mysql')

const conexao = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ex01'
});

conexao.connect(erro => {
    if (erro) {
        console.error('Erro ao Conectar ao Banco de Dados\n: ', erro)
        return
    }

    console.log('Banco de Dados Conectado com Sucesso!.')
})
