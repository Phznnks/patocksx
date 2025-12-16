const express = require('express');
const cors = require('cors');
const mysql = require('mysql');
const session = require('express-session');

const app = express();

// SUA CONEXÃO MYSQL (mantida igual)
const conexao = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'ex01'
});

conexao.connect(erro => {
  if (erro) {
    console.error('Erro ao Conectar: ', erro);
    return;
  }
  console.log('Banco de dados Conectado!');
});

// CONFIGURAÇÕES DO EXPRESS (com CSP corrigido)
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Middleware para CSP mais permissivo
app.use((req, res, next) => {
  res.setHeader(
    'Content-Security-Policy',
    "default-src 'self' http://localhost:3000; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline'"
  );
  next();
});

// Configurar session middleware
app.use(session({
  secret: 'ducksx123',
  resave: false,
  saveUninitialized: false,
  cookie: { 
    secure: false,
    maxAge: 1000 * 60 * 60 * 24
  }
}));

app.set('view engine', 'ejs');

// ROTAS
app.get('/', (req, res) => { 
  res.send('Bem Vindo');
});

app.get('/gerenciador', (req, res) => {
  console.log('=== TENTANDO ACESSAR GERENCIADOR ===');
  console.log('Session:', req.session);
  
  if (!req.session.loggedIn) {
    console.log('❌ USUÁRIO NÃO LOGADO');
    return res.redirect('/login');
  }

  console.log('✅ USUÁRIO LOGADO - RENDERIZANDO');
  res.render('gerenciador', {
    user: req.session.user,
    gmail: req.session.gmail
  });
});

app.post('/register', (req, res) => {
  const dados = req.body;
  const username = dados.username;
  const gmail = dados.email;
  const senha = dados.password;

  conexao.query('INSERT INTO registros (username, gmail, senha) VALUES(?, ?, ?)', 
    [username, gmail, senha], 
    (erro, result) => {
      if (erro) {
        console.log(`Ocorreu algum erro na consulta. ERRO: ${erro}`);
        return res.json({ success: false, error: 'Erro no registro' });
      }
      console.log('Alguém se registrou com Sucesso!');
      res.json({ success: true, message: 'Registro realizado!' });
  });
});


function GmailDoUser(username) {
  return new Promise((resolve, reject) => {
    conexao.query('SELECT gmail FROM registros WHERE username = ? LIMIT 1', [username], (erro, result) => {
      if (erro) {
        reject(erro);
      } else if (!result || result.length === 0) {
        console.log(`O Gmail do ${username} Não foi encontrado!`);
        resolve(null);
      } else {
        const GmailUser = result[0].gmail;
        console.log(`Gmail encontrado: ${GmailUser}`);
        resolve(GmailUser);
      }
    });
  });
}

app.post('/login', async (req, res) => {
  const dados = req.body;
  const username = dados.username;
  const senha = dados.password;

  console.log(`Tentativa de login: ${username}`);

  conexao.query('SELECT username FROM registros', (erro, result) => {
    if (erro) {
      console.log(erro);
      return res.json({ success: false, error: 'Erro no servidor' });
    }

    const usernames = result.map(linha => linha.username);

    if (usernames.includes(username)) {
      conexao.query('SELECT senha FROM registros WHERE username = ? LIMIT 1', [username], async (erro, result) => {
        if (erro) { 
          console.error(erro); 
          return res.json({ success: false, error: 'Erro no servidor' });
        }

        if (!result || result.length === 0) {
          console.log('Usuário não encontrado');
          return res.json({ success: false, error: 'Usuário não encontrado' });
        }

        const SenhaUser = result[0].senha;

        if (SenhaUser === senha) {
          console.log('Sucesso! Você está logado');
          
          try {
            const gmail = await GmailDoUser(username);
            
            console.log('=== SESSION CRIADA ===');
            console.log('User:', username);
            console.log('Gmail:', gmail);
            
            req.session.user = username;
            req.session.gmail = gmail;
            req.session.loggedIn = true;

            // ENVIA success: true PARA O FRONTEND
            res.json({ success: true, redirect: '/gerenciador' });
            
          } catch (erro) {
            console.error('ERRO ao buscar gmail:', erro);
            res.json({ success: false, error: 'Erro ao buscar dados' });
          }
        } else {        
          console.error('Senha Errada!');
          res.json({ success: false, error: 'Senha incorreta' });
        }
      });
    } else {
      console.log('Usuário não existe!');
      res.json({ success: false, error: 'Usuário não encontrado' });
    }
  });
});

const port = 5500;
app.listen(port, () => {
  console.log(`Servidor Rodando Na Port: ${port}`);
});
