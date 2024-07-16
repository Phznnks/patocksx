// Importando o módulo HTTP do Node.js
const http = require('http');

// Definindo o hostname e a porta
const hostname = '127.0.0.1';
const port = 3000;

// Criando o servidor HTTP
const server = http.createServer((req, res) => {
    // Configurando o cabeçalho da resposta HTTP
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    
    // Enviando a resposta
    res.end('Ola, mundo! Este e um servidor basico em Node.js\n');
});

// Iniciando o servidor para escutar as requisições
server.listen(port, hostname, () => {
    console.log(`Servidor rodando em http://${hostname}:${port}/`);

});
