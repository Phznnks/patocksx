const express = require('express')
const mysql = require('mysql')
const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: true}))
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

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


app.get('/', (req, res) => {
    VerificarExistenciaDeProdutos(req, res)
})


app.post('/criarproduto', (req, res) => {
    const dados = req.body
    //console.log(dados)

    CadastraProduto(dados)
    res.json({
        success: true,
        message: 'Produto Cadastrado com Sucesso', 
        messageErro: 'Obs, Parece que algo deu errado!. ENTRE EM CONTATO AO DucksX!.',
        //dadosRecebidos: dados
    })
})



const CadastraProduto = (dados) => {

    const nome = dados.nome
    const preco = dados.preco 
    const foto = dados.foto
    const tamanhos = dados.tamanhos
    const cores =  dados.cores
    const tipo_peca = dados.tipo_peca
    const moda = dados.moda

    conexao.query('INSERT INTO produtos (nome, preco, foto, tamanhos, cores, tipo_peca, moda) VALUES (?, ?, ?, ?, ?, ?, ?)', 
        [nome, preco, foto, tamanhos, cores, tipo_peca, moda], 
        function(erro, result){
            if(erro){
                console.error(erro)
                return
            }           
        //console.log(result)
    })

}


/* A promise eu coloquei para fazer a api de editarproduto, mas tive que pesquisa e ter ajuda ao chatgpt, 
Consegui entendo um pouco sobre as promise e o try, mas ainda estou com muita duvida relaciodo a criacao da promise, 
e na ora de sucesso({ vazio: true, message: 'Nenhum produto encontrado!.'}), nao entendi para que de fato esse json serve. 
mas esta funcionando da forma que eu quero entao deixei mas futuramente tenho que estuda essa parte, aprofunda em promise kkkk.
 
*/
const VerificarExistenciaDeProdutos = (req, res) => {
    return new Promise((sucesso, rejeitada) => {
        conexao.query('SELECT * FROM produtos', (error, result) => {
            if (!error) {
                //Verificar ser o banco de dados esta vazio
                if (!result.length) {
                    console.log('Nenhum Produto Ainda foi Castrado, no Momento!.')

                    if (res) {
                        res.json({ erro: '<h1> Nenhum Produto Ainda foi Castrado, no Momento!.</h1>' })
                    }
                    sucesso({ vazio: true, message: 'Nenhum produto encontrado!.'})
                    return
                }
                if(!res) {
                    sucesso(result)
                }else {
                    res.json({ dados: result })
                    sucesso(result)
                }
                
            } else {
                console.error(error)
                if (res) {
                    res.status(500).json({ erro: 'Erro no banco de dados'})
                }
                rejeitada(error)
            }

        })
    })    
}

app.put('/atualizarproduto', (req, res) => {
    const dados = req.body
    //console.log(dados)

    atualizarproduto(dados, res)
})

const atualizarproduto = (dados, res) => {
    const id = dados.id
    const nome = dados.nome
    const preco = dados.preco 
    const foto = dados.foto
    const tamanhos = dados.tamanhos
    const cores =  dados.cores
    const tipo_peca = dados.tipo_peca
    const moda = dados.moda

    conexao.query('UPDATE produtos SET nome = ?, preco = ?, foto = ?, tamanhos = ?, cores = ?, tipo_peca = ?, moda = ? WHERE id = ?', 
        [nome, preco, foto, tamanhos, cores, tipo_peca, moda, id], 
        (error, result) => {
            if (error){
                console.error(`Ops, Nos pedimos descupas, mas Ocorreu um Erro: ${error}`)
                return
            }

            res.json({
                sucesso: true,
                message: `O Produto com o Nome: ${nome} e o Id: ${id} Foi Atualizador Com Sucesso!.`,
                messageErro: `Ops, Nos pedimos descupas, mas Ocorreu um Erro: ${error}`
            })
        }
    )
}

app.delete('/deletarproduto/:id', async (req, res) => {
    const id = parseInt(req.params.id)
    console.log(id)

    try {
        const dados = await VerificarExistenciaDeProdutos()        
        console.log(dados)

        const buscarid = dados.find(dado => {
            return dado.id === id
        })
        console.log('Teste id: ',buscarid)

        DeleteProduto(id)
        res.send('teste')
    } catch (error) {
        console.log('Parece que Algo deu errado!. \n Error: ', error)
    }
})

const DeleteProduto = (id) => { 
    conexao.query('DELETE FROM produtos WHERE id = ? ', 
        [id], (error, result) => {
             if(error) {
                console.error('Parece que algo deu errado!. ERRO: ', error)
                return
             }

             console.log('Sucesso Produto Deletado!. O RESULT: ', result)
        })
}


app.get('/editarproduto/:id', async (req, res) => {
    const idbuscar = parseInt(req.params.id)
    //console.log(idbuscar)
    

    try {
        const dados = await VerificarExistenciaDeProdutos();

        const encontrarid = dados.find(dado => {
            return  dado.id === idbuscar
        })

        //console.log(encontrarid)

        if (!encontrarid){
            console.log(`❌ Produto com ID ${idbuscar} não existe`)
            res.send(`❌ Produto com ID ${idbuscar} não existe`)
            return
        } 
        res.send(`
            <!DOCTYPE html>
            <html lang="pt-br">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Edicao de Produtos - DucksX</title>
                <style>
                    /* Reset e configurações básicas */
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    }
                    
                    body {
                        background-color: #f5f5f5;
                        color: #333;
                        line-height: 1.6;
                        padding: 20px;
                        max-width: 1200px;
                        margin: 0 auto;
                    }
                    
                    /* Cabeçalho */
                    header {
                        text-align: center;
                        margin-bottom: 30px;
                        padding-bottom: 20px;
                        border-bottom: 2px solid #ddd;
                    }
                    
                    h1 {
                        color: #222;
                        font-size: 2.5rem;
                        margin-bottom: 10px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                    }
                    
                    .subtitle {
                        color: #666;
                        font-size: 1.1rem;
                    }
                    
                    /* Container principal */
                    .container {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 30px;
                        margin-bottom: 40px;
                    }
                    
                    /* Estilos do formulário */
                    .form-container {
                        flex: 1;
                        min-width: 300px;
                        background-color: white;
                        padding: 30px;
                        border-radius: 8px;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                        border: 1px solid #ddd;
                    }
                    
                    .form-group {
                        margin-bottom: 25px;
                    }
                    
                    label {
                        display: block;
                        margin-bottom: 8px;
                        font-weight: 600;
                        color: #222;
                        font-size: 1rem;
                    }
                    
                    input, select, textarea {
                        width: 100%;
                        padding: 12px 15px;
                        border: 2px solid #ddd;
                        border-radius: 4px;
                        font-size: 1rem;
                        transition: all 0.3s;
                        background-color: #fafafa;
                    }
                    
                    input:focus, select:focus, textarea:focus {
                        outline: none;
                        border-color: #555;
                        background-color: white;
                    }
                    
                    textarea {
                        min-height: 100px;
                        resize: vertical;
                    }
                    
                    /* Estilos para as seções dinâmicas (tamanhos e cores) */
                    .dynamic-section {
                        background-color: #f9f9f9;
                        padding: 20px;
                        border-radius: 6px;
                        margin-top: 10px;
                        border-left: 3px solid #ccc;
                    }
                    
                    .dynamic-section h3 {
                        font-size: 1.1rem;
                        margin-bottom: 15px;
                        color: #333;
                    }
                    
                    .option-list {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 10px;
                        margin-bottom: 15px;
                    }
                    
                    .option-tag {
                        background-color: #e9e9e9;
                        color: #333;
                        padding: 8px 15px;
                        border-radius: 20px;
                        display: flex;
                        align-items: center;
                        font-size: 0.9rem;
                    }
                    
                    .option-tag button {
                        background: none;
                        border: none;
                        color: #777;
                        margin-left: 8px;
                        cursor: pointer;
                        font-weight: bold;
                        font-size: 1.1rem;
                    }
                    
                    .option-tag button:hover {
                        color: #ff4444;
                    }
                    
                    .add-option {
                        display: flex;
                        gap: 10px;
                    }
                    
                    .add-option input {
                        flex: 1;
                        min-width: 100px;
                    }
                    
                    .btn-add {
                        background-color: #555;
                        color: white;
                        border: none;
                        padding: 10px 20px;
                        border-radius: 4px;
                        cursor: pointer;
                        font-weight: 600;
                        transition: background-color 0.3s;
                    }
                    
                    .btn-add:hover {
                        background-color: #333;
                    }
                    
                    /* Botões principais */
                    .form-actions {
                        display: flex;
                        justify-content: space-between;
                        margin-top: 30px;
                        padding-top: 20px;
                        border-top: 1px solid #eee;
                    }
                    
                    .btn {
                        padding: 12px 25px;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                        font-weight: 600;
                        font-size: 1rem;
                        transition: all 0.3s;
                    }
                    
                    .btn-submit {
                        background-color: #222;
                        color: white;
                        flex: 1;
                        margin-right: 15px;
                    }
                    
                    .btn-submit:hover {
                        background-color: #000;
                    }
                    
                    .btn-clear {
                        background-color: white;
                        color: #222;
                        border: 2px solid #ddd;
                        flex: 1;
                    }
                    
                    .btn-clear:hover {
                        background-color: #f5f5f5;
                        border-color: #bbb;
                    }
                    
                    /* Preview do produto */
                    .preview-container {
                        flex: 1;
                        min-width: 300px;
                        background-color: white;
                        padding: 30px;
                        border-radius: 8px;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                        border: 1px solid #ddd;
                    }
                    
                    .preview-title {
                        font-size: 1.5rem;
                        margin-bottom: 25px;
                        color: #222;
                        text-align: center;
                    }
                    
                    .product-preview {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 20px;
                    }
                    
                    .product-image {
                        width: 100%;
                        max-width: 300px;
                        height: 300px;
                        background-color: #f0f0f0;
                        border-radius: 8px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        overflow: hidden;
                        border: 2px solid #ddd;
                    }
                    
                    .product-image img {
                        max-width: 100%;
                        max-height: 100%;
                        display: none;
                    }
                    
                    .image-placeholder {
                        color: #999;
                        font-size: 1rem;
                        text-align: center;
                    }
                    
                    .product-details {
                        width: 100%;
                    }
                    
                    .detail-row {
                        display: flex;
                        justify-content: space-between;
                        padding: 12px 0;
                        border-bottom: 1px solid #eee;
                    }
                    
                    .detail-label {
                        font-weight: 600;
                        color: #333;
                    }
                    
                    .detail-value {
                        color: #555;
                    }
                    
                    /* Responsividade */
                    @media (max-width: 768px) {
                        .container {
                            flex-direction: column;
                        }
                        
                        .form-actions {
                            flex-direction: column;
                            gap: 15px;
                        }
                        
                        .btn-submit, .btn-clear {
                            margin-right: 0;
                        }
                    }
                    
                    /* Mensagens de validação */
                    .error-message {
                        color: #ff4444;
                        font-size: 0.85rem;
                        margin-top: 5px;
                        display: none;
                    }
                    
                    .required::after {
                        content: " *";
                        color: #ff4444;
                    }
                </style>
            </head>
            <body>
                <header>
                    <h1> Atualizando Produto </h1>
                    <p class="subtitle">Editando o Produto Com ID: ${encontrarid.id}</p>
                </header>
                
                <main class="container">
                    <section class="form-container">
                        <h2>Informações do Produto</h2>
                        
                        <form id="productForm" method="PUT" action='/atualizarproduto'>
                        
                            <div class="form-group">
                                <label for="nome" class="required">Nome do Produto</label>
                                <input type="text" id="nome" name="nome" value="${encontrarid.nome}" required>
                                <div class="error-message" id="nomeError">Por favor, insira um nome para o produto.</div>
                            </div>
                            
                            <div class="form-group">
                                <label for="preco" class="required">Preço (R$)</label>
                                <input type="number" id="preco" name="preco" min="0" step="0.01" value="${encontrarid.preco}" required>
                                <div class="error-message" id="precoError">Por favor, insira um preço válido.</div>
                            </div>
                            
                            <div class="form-group">
                                <label for="foto">URL da Foto</label>
                                <input type="url" id="foto" name="foto" value="${encontrarid.foto}">
                                <div class="error-message" id="fotoError">Por favor, insira uma URL válida.</div>
                            </div>
                            
                            <div class="form-group">
                                <label for="tipo_peca" class="required">Tipo de Peça</label>
                                <select id="tipo_peca" name="tipo_peca" required>
                                    <option value="">Selecione o tipo</option>
                                    <option value="Camiseta">Camiseta</option>
                                    <option value="Calça">Calça</option>
                                    <option value="Vestido">Vestido</option>
                                    <option value="Saia">Saia</option>
                                    <option value="Jaqueta">Jaqueta</option>
                                    <option value="Blusa">Blusa</option>
                                    <option value="Shorts">Shorts</option>
                                    <option value="Bermuda">Bermuda</option>
                                    <option value="Outro">Outro</option>
                                </select>
                                <div class="error-message" id="tipoError">Por favor, selecione um tipo de peça.</div>
                            </div>
                            
                            <div class="form-group">
                                <label for="moda" class="required">Estilo</label>
                                <select id="moda" name="moda" required>
                                    <option value="">Selecione o estilo</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Feminino">Feminino</option>
                                </select>
                                <div class="error-message" id="modaError">Por favor, selecione um estilo.</div>
                            </div>
                            
                            <div class="form-group">
                                <label>Tamanhos Disponíveis</label>
                                <div class="dynamic-section">
                                    <h3>Tamanhos selecionados:</h3>
                                    <div class="option-list" id="tamanhosList">
                                        <!-- Tamanhos serão adicionados aqui dinamicamente -->
                                        <span class="option-tag">P<button type="button" onclick="removeOption('tamanhos', 'P')">×</button></span>
                                        <span class="option-tag">M<button type="button" onclick="removeOption('tamanhos', 'M')">×</button></span>
                                        <span class="option-tag">G<button type="button" onclick="removeOption('tamanhos', 'G')">×</button></span>
                                    </div>
                                    <div class="add-option">
                                        <input type="text" id="novoTamanho" placeholder="Ex: GG, XG, 42">
                                        <button type="button" class="btn-add" onclick="addOption('tamanhos')">Adicionar</button>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label>Cores Disponíveis</label>
                                <div class="dynamic-section">
                                    <h3>Cores selecionadas:</h3>
                                    <div class="option-list" id="coresList">
                                        <!-- Cores serão adicionadas aqui dinamicamente -->
                                        <span class="option-tag">Vermelho<button type="button" onclick="removeOption('cores', 'Vermelho')">×</button></span>
                                        <span class="option-tag">Azul<button type="button" onclick="removeOption('cores', 'Azul')">×</button></span>
                                        <span class="option-tag">Preto<button type="button" onclick="removeOption('cores', 'Preto')">×</button></span>
                                    </div>
                                    <div class="add-option">
                                        <input type="text" id="novaCor" placeholder="Ex: Branco, Verde, Amarelo">
                                        <button type="button" class="btn-add" onclick="addOption('cores')">Adicionar</button>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-actions">
                                <button type="submit" class="btn btn-submit">Atualizar Produto</button>                                
                                <button type="button" class="btn btn-clear" id="delete" > Deleta Produto</button>
                            </div>
                        </form>
                    </section>
                    
                    <section class="preview-container">
                        <h2 class="preview-title">Pré-visualização do Produto</h2>
                        <div class="product-preview">
                            <div class="product-image" id="productImagePreview">
                                <img id="imagePreview" src="" alt="Preview da imagem">
                                <div class="image-placeholder">Imagem do produto será exibida aqui</div>
                            </div>
                            
                            <div class="product-details">
                                <div class="detail-row">
                                    <span class="detail-label">Nome:</span>
                                    <span class="detail-value" id="previewNome">-</span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Preço:</span>
                                    <span class="detail-value" id="previewPreco">-</span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Tipo:</span>
                                    <span class="detail-value" id="previewTipo">-</span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Estilo:</span>
                                    <span class="detail-value" id="previewModa">-</span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Tamanhos:</span>
                                    <span class="detail-value" id="previewTamanhos">P, M, G</span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Cores:</span>
                                    <span class="detail-value" id="previewCores">Vermelho, Azul, Preto</span>
                                </div>
                            </div>
                        </div>
                    </section>
                </main>
                
                <script>
                    // Arrays para armazenar os tamanhos e cores
                    let tamanhos = ["P", "M", "G"];
                    let cores = ["Vermelho", "Azul", "Preto"];
                    
                    // Função para atualizar a pré-visualização
                    function updatePreview() {
                        // Atualizar informações básicas
                        document.getElementById('previewNome').textContent = document.getElementById('nome').value || '-';
                        document.getElementById('previewPreco').textContent = document.getElementById('preco').value ? 'R$ ' + parseFloat(document.getElementById('preco').value).toFixed(2) : '-';
                        document.getElementById('previewTipo').textContent = document.getElementById('tipo_peca').value || '-';
                        document.getElementById('previewModa').textContent = document.getElementById('moda').value || '-';
                        
                        // Atualizar tamanhos
                        document.getElementById('previewTamanhos').textContent = tamanhos.length > 0 ? tamanhos.join(', ') : '-';
                        
                        // Atualizar cores
                        document.getElementById('previewCores').textContent = cores.length > 0 ? cores.join(', ') : '-';
                        
                        // Atualizar imagem
                        const fotoUrl = document.getElementById('foto').value;
                        const imagePreview = document.getElementById('imagePreview');
                        const placeholder = document.querySelector('.image-placeholder');
                        
                        if (fotoUrl) {
                            imagePreview.src = fotoUrl;
                            imagePreview.style.display = 'block';
                            placeholder.style.display = 'none';
                        } else {
                            imagePreview.style.display = 'none';
                            placeholder.style.display = 'block';
                        }
                    }
                    
                    // Função para adicionar uma nova opção (tamanho ou cor)
                    function addOption(tipo) {
                        const inputId = tipo === 'tamanhos' ? 'novoTamanho' : 'novaCor';
                        const input = document.getElementById(inputId);
                        const valor = input.value.trim();
                        
                        if (!valor) {
                            alert('Por favor, insira um ' + (tipo === 'tamanhos' ? 'tamanho' : 'cor') + ' válido.');
                            return;
                        }
                        
                        // Verificar se já existe
                        const array = tipo === 'tamanhos' ? tamanhos : cores;
                        if (array.includes(valor)) {
                            alert('Este ' + (tipo === 'tamanhos' ? 'tamanho' : 'cor') + ' já foi adicionado.');
                            return;
                        }
                        
                        // Adicionar ao array
                        array.push(valor);
                        
                        // Atualizar a visualização
                        updateOptionList(tipo);
                        
                        // Limpar o campo de entrada
                        input.value = '';
                        
                        // Atualizar a pré-visualização
                        updatePreview();
                    }
                    
                    // Função para remover uma opção
                    function removeOption(tipo, valor) {
                        const array = tipo === 'tamanhos' ? tamanhos : cores;
                        const index = array.indexOf(valor);
                        
                        if (index !== -1) {
                            array.splice(index, 1);
                            updateOptionList(tipo);
                            updatePreview();
                        }
                    }
                    
                    // Função para atualizar a lista de opções na interface
                    function updateOptionList(tipo) {
                        const array = tipo === 'tamanhos' ? tamanhos : cores;
                        const listId = tipo === 'tamanhos' ? 'tamanhosList' : 'coresList';
                        const listElement = document.getElementById(listId);
                        
                        // Limpar a lista atual
                        listElement.innerHTML = '';
                        
                        // Adicionar cada item como um "tag"
                        array.forEach(item => {
                            const tag = document.createElement('span');
                            tag.className = 'option-tag';
                            tag.innerHTML = item + '<button type="button" onclick="removeOption(\\'' + tipo + '\\', \\'' + item + '\\')">×</button>';
                            listElement.appendChild(tag);
                        });
                    }
                    
                    // Função para limpar o formulário
                    function clearForm() {
                        document.getElementById('productForm').reset();
                        
                        // Resetar arrays para valores padrão
                        tamanhos = ["P", "M", "G"];
                        cores = ["Vermelho", "Azul", "Preto"];
                        
                        // Atualizar as listas
                        updateOptionList('tamanhos');
                        updateOptionList('cores');
                        
                        // Atualizar a pré-visualização
                        updatePreview();
                        
                        // Limpar mensagens de erro
                        document.querySelectorAll('.error-message').forEach(el => {
                            el.style.display = 'none';
                        });
                    }
                    
                    // Função para validar o formulário
                    function validateForm() {
                        let isValid = true;
                        
                        // Validar nome
                        const nome = document.getElementById('nome').value.trim();
                        if (!nome) {
                            document.getElementById('nomeError').style.display = 'block';
                            isValid = false;
                        } else {
                            document.getElementById('nomeError').style.display = 'none';
                        }
                        
                        // Validar preço
                        const preco = document.getElementById('preco').value;
                        if (!preco || parseFloat(preco) <= 0) {
                            document.getElementById('precoError').style.display = 'block';
                            isValid = false;
                        } else {
                            document.getElementById('precoError').style.display = 'none';
                        }
                        
                        // Validar tipo de peça
                        const tipo = document.getElementById('tipo_peca').value;
                        if (!tipo) {
                            document.getElementById('tipoError').style.display = 'block';
                            isValid = false;
                        } else {
                            document.getElementById('tipoError').style.display = 'none';
                        }
                        
                        // Validar moda
                        const moda = document.getElementById('moda').value;
                        if (!moda) {
                            document.getElementById('modaError').style.display = 'block';
                            isValid = false;
                        } else {
                            document.getElementById('modaError').style.display = 'none';
                        }
                        
                        return isValid;
                    }
                    
                    // Função para formatar dados para envio
                    function formatFormData() {
                        return {
                            id: ${idbuscar},
                            nome: document.getElementById('nome').value.trim(),
                            preco: parseFloat(document.getElementById('preco').value).toFixed(2),
                            foto: document.getElementById('foto').value.trim(),
                            tamanhos: JSON.stringify(tamanhos),
                            cores: JSON.stringify(cores),
                            tipo_peca: document.getElementById('tipo_peca').value,
                            moda: document.getElementById('moda').value
                        };
                    }
                    
                    // Event listeners
                    document.addEventListener('DOMContentLoaded', function() {
                        // Inicializar as listas de opções
                        updateOptionList('tamanhos');
                        updateOptionList('cores');
                        
                        // Atualizar a pré-visualização inicial
                        updatePreview();
                        
                        // Adicionar evento de input para atualização em tempo real
                        document.querySelectorAll('#productForm input, #productForm select').forEach(element => {
                            element.addEventListener('input', updatePreview);
                        });
                        
                        // Adicionar evento de submit ao formulário           
                        document.getElementById('productForm').addEventListener('submit', async function(e) {
                            e.preventDefault();
                            
                            if (validateForm()) {
                                const formData = formatFormData();
                                
                                console.log('📤 Dados que serão enviados para a rota /atualizarproduto:', formData); // DEBUG
                                
                                try {
                                    const response = await fetch('http://localhost:5500/atualizarproduto', {
                                        method: 'PUT',
                                        headers: {
                                            'Content-Type': 'application/json'
                                        },
                                        body: JSON.stringify(formData)
                                    });
                                    
                                    const result = await response.json();
                                    console.log('📥 Resposta do servidor:', result); // DEBUG
                                    
                                    if (result.sucesso === true) {
                                        alert('✅ ' + result.message);
                                        clearForm();
                                    } else {
                                        alert('❌ Erro: ' + result.messageErro);
                                    }
                                } catch (error) {
                                    console.error('🔥 Erro na requisição:', error); // DEBUG
                                    alert('❌ Erro ao conectar com o servidor');
                                }
                            }
                        });




                        
                        
                        // Adicionar evento ao botão de delete
                        document.getElementById('delete').addEventListener('click', async function(e) {
                            
                            
                                
                            try {
                                const response = await fetch('http://localhost:5500/deletarproduto/${encontrarid.id}', {
                                    method: 'DELETE',
                                    headers: {
                                        'Content-Type': 'application/json'
                                    },
                                    body: JSON.stringify({ id: ${encontrarid.id} })
                                });
                                alert('✅ ' + 'O produto foi deletado com Sucesso!.');    
                                location.href = '/'

                            } catch (error) {
                                console.error('🔥 Erro na requisição:', error); // DEBUG
                                alert('❌ Erro ao conectar com o servidor');
                            }
                        });


                        
                        // Permitir adicionar opções com Enter
                        document.getElementById('novoTamanho').addEventListener('keypress', function(e) {
                            if (e.key === 'Enter') {
                                e.preventDefault();
                                addOption('tamanhos');
                            }
                        });
                        
                        document.getElementById('novaCor').addEventListener('keypress', function(e) {
                            if (e.key === 'Enter') {
                                e.preventDefault();
                                addOption('cores');
                            }
                        });
                    });
                </script>
            </body>
        </html>
        `); 
        return

    } catch (error) {
        console.error('Erro: ', error)
        return
    }
})



























app.get('/criarproduto', (req, res) => {
    res.send(`
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Produtos - DucksX</title>
    <style>
        /* Reset e configurações básicas */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        /* Cabeçalho */
        header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #ddd;
        }
        
        h1 {
            color: #222;
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .subtitle {
            color: #666;
            font-size: 1.1rem;
        }
        
        /* Container principal */
        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            margin-bottom: 40px;
        }
        
        /* Estilos do formulário */
        .form-container {
            flex: 1;
            min-width: 300px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border: 1px solid #ddd;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #222;
            font-size: 1rem;
        }
        
        input, select, textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            transition: all 0.3s;
            background-color: #fafafa;
        }
        
        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #555;
            background-color: white;
        }
        
        textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        /* Estilos para as seções dinâmicas (tamanhos e cores) */
        .dynamic-section {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 6px;
            margin-top: 10px;
            border-left: 3px solid #ccc;
        }
        
        .dynamic-section h3 {
            font-size: 1.1rem;
            margin-bottom: 15px;
            color: #333;
        }
        
        .option-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .option-tag {
            background-color: #e9e9e9;
            color: #333;
            padding: 8px 15px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            font-size: 0.9rem;
        }
        
        .option-tag button {
            background: none;
            border: none;
            color: #777;
            margin-left: 8px;
            cursor: pointer;
            font-weight: bold;
            font-size: 1.1rem;
        }
        
        .option-tag button:hover {
            color: #ff4444;
        }
        
        .add-option {
            display: flex;
            gap: 10px;
        }
        
        .add-option input {
            flex: 1;
            min-width: 100px;
        }
        
        .btn-add {
            background-color: #555;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        
        .btn-add:hover {
            background-color: #333;
        }
        
        /* Botões principais */
        .form-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .btn-submit {
            background-color: #222;
            color: white;
            flex: 1;
            margin-right: 15px;
        }
        
        .btn-submit:hover {
            background-color: #000;
        }
        
        .btn-clear {
            background-color: white;
            color: #222;
            border: 2px solid #ddd;
            flex: 1;
        }
        
        .btn-clear:hover {
            background-color: #f5f5f5;
            border-color: #bbb;
        }
        
        /* Preview do produto */
        .preview-container {
            flex: 1;
            min-width: 300px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border: 1px solid #ddd;
        }
        
        .preview-title {
            font-size: 1.5rem;
            margin-bottom: 25px;
            color: #222;
            text-align: center;
        }
        
        .product-preview {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }
        
        .product-image {
            width: 100%;
            max-width: 300px;
            height: 300px;
            background-color: #f0f0f0;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border: 2px solid #ddd;
        }
        
        .product-image img {
            max-width: 100%;
            max-height: 100%;
            display: none;
        }
        
        .image-placeholder {
            color: #999;
            font-size: 1rem;
            text-align: center;
        }
        
        .product-details {
            width: 100%;
        }
        
        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }
        
        .detail-label {
            font-weight: 600;
            color: #333;
        }
        
        .detail-value {
            color: #555;
        }
        
        /* Responsividade */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .form-actions {
                flex-direction: column;
                gap: 15px;
            }
            
            .btn-submit, .btn-clear {
                margin-right: 0;
            }
        }
        
        /* Mensagens de validação */
        .error-message {
            color: #ff4444;
            font-size: 0.85rem;
            margin-top: 5px;
            display: none;
        }
        
        .required::after {
            content: " *";
            color: #ff4444;
        }
    </style>
</head>
<body>
    <header>
        <h1>Cadastro de Produtos</h1>
        <p class="subtitle">Sistema de gerenciamento de produtos</p>
    </header>
    
    <main class="container">
        <section class="form-container">
            <h2>Informações do Produto</h2>
            
            <form id="productForm" method="POST" action='/criarproduto'>
                <div class="form-group">
                    <label for="nome" class="required">Nome do Produto</label>
                    <input type="text" id="nome" name="nome" placeholder="Ex: Camiseta Básica Algodão" required>
                    <div class="error-message" id="nomeError">Por favor, insira um nome para o produto.</div>
                </div>
                
                <div class="form-group">
                    <label for="preco" class="required">Preço (R$)</label>
                    <input type="number" id="preco" name="preco" min="0" step="0.01" placeholder="Ex: 59.90" required>
                    <div class="error-message" id="precoError">Por favor, insira um preço válido.</div>
                </div>
                
                <div class="form-group">
                    <label for="foto">URL da Foto</label>
                    <input type="url" id="foto" name="foto" placeholder="https://exemplo.com/foto-produto.jpg">
                    <div class="error-message" id="fotoError">Por favor, insira uma URL válida.</div>
                </div>
                
                <div class="form-group">
                    <label for="tipo_peca" class="required">Tipo de Peça</label>
                    <select id="tipo_peca" name="tipo_peca" required>
                        <option value="">Selecione o tipo</option>
                        <option value="Camiseta">Camiseta</option>
                        <option value="Calça">Calça</option>
                        <option value="Vestido">Vestido</option>
                        <option value="Saia">Saia</option>
                        <option value="Jaqueta">Jaqueta</option>
                        <option value="Blusa">Blusa</option>
                        <option value="Shorts">Shorts</option>
                        <option value="Bermuda">Bermuda</option>
                        <option value="Outro">Outro</option>
                    </select>
                    <div class="error-message" id="tipoError">Por favor, selecione um tipo de peça.</div>
                </div>
                
                <div class="form-group">
                    <label for="moda" class="required">Estilo</label>
                    <select id="moda" name="moda" required>
                        <option value="">Selecione o estilo</option>
                        <option value="Masculino">Masculino</option>
                        <option value="Feminino">Feminino</option>
                    </select>
                    <div class="error-message" id="modaError">Por favor, selecione um estilo.</div>
                </div>
                
                <div class="form-group">
                    <label>Tamanhos Disponíveis</label>
                    <div class="dynamic-section">
                        <h3>Tamanhos selecionados:</h3>
                        <div class="option-list" id="tamanhosList">
                            <!-- Tamanhos serão adicionados aqui dinamicamente -->
                            <span class="option-tag">P<button type="button" onclick="removeOption('tamanhos', 'P')">×</button></span>
                            <span class="option-tag">M<button type="button" onclick="removeOption('tamanhos', 'M')">×</button></span>
                            <span class="option-tag">G<button type="button" onclick="removeOption('tamanhos', 'G')">×</button></span>
                        </div>
                        <div class="add-option">
                            <input type="text" id="novoTamanho" placeholder="Ex: GG, XG, 42">
                            <button type="button" class="btn-add" onclick="addOption('tamanhos')">Adicionar</button>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label>Cores Disponíveis</label>
                    <div class="dynamic-section">
                        <h3>Cores selecionadas:</h3>
                        <div class="option-list" id="coresList">
                            <!-- Cores serão adicionadas aqui dinamicamente -->
                            <span class="option-tag">Vermelho<button type="button" onclick="removeOption('cores', 'Vermelho')">×</button></span>
                            <span class="option-tag">Azul<button type="button" onclick="removeOption('cores', 'Azul')">×</button></span>
                            <span class="option-tag">Preto<button type="button" onclick="removeOption('cores', 'Preto')">×</button></span>
                        </div>
                        <div class="add-option">
                            <input type="text" id="novaCor" placeholder="Ex: Branco, Verde, Amarelo">
                            <button type="button" class="btn-add" onclick="addOption('cores')">Adicionar</button>
                        </div>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-submit">Cadastrar Produto</button>
                    <button type="button" class="btn btn-clear" id="clearBtn">Limpar Formulário</button>
                </div>
            </form>
        </section>
        
        <section class="preview-container">
            <h2 class="preview-title">Pré-visualização do Produto</h2>
            <div class="product-preview">
                <div class="product-image" id="productImagePreview">
                    <img id="imagePreview" src="" alt="Preview da imagem">
                    <div class="image-placeholder">Imagem do produto será exibida aqui</div>
                </div>
                
                <div class="product-details">
                    <div class="detail-row">
                        <span class="detail-label">Nome:</span>
                        <span class="detail-value" id="previewNome">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Preço:</span>
                        <span class="detail-value" id="previewPreco">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Tipo:</span>
                        <span class="detail-value" id="previewTipo">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Estilo:</span>
                        <span class="detail-value" id="previewModa">-</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Tamanhos:</span>
                        <span class="detail-value" id="previewTamanhos">P, M, G</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Cores:</span>
                        <span class="detail-value" id="previewCores">Vermelho, Azul, Preto</span>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    <script>
        // Arrays para armazenar os tamanhos e cores
        let tamanhos = ["P", "M", "G"];
        let cores = ["Vermelho", "Azul", "Preto"];
        
        // Função para atualizar a pré-visualização
        function updatePreview() {
            // Atualizar informações básicas
            document.getElementById('previewNome').textContent = document.getElementById('nome').value || '-';
            document.getElementById('previewPreco').textContent = document.getElementById('preco').value ? 'R$ ' + parseFloat(document.getElementById('preco').value).toFixed(2) : '-';
            document.getElementById('previewTipo').textContent = document.getElementById('tipo_peca').value || '-';
            document.getElementById('previewModa').textContent = document.getElementById('moda').value || '-';
            
            // Atualizar tamanhos
            document.getElementById('previewTamanhos').textContent = tamanhos.length > 0 ? tamanhos.join(', ') : '-';
            
            // Atualizar cores
            document.getElementById('previewCores').textContent = cores.length > 0 ? cores.join(', ') : '-';
            
            // Atualizar imagem
            const fotoUrl = document.getElementById('foto').value;
            const imagePreview = document.getElementById('imagePreview');
            const placeholder = document.querySelector('.image-placeholder');
            
            if (fotoUrl) {
                imagePreview.src = fotoUrl;
                imagePreview.style.display = 'block';
                placeholder.style.display = 'none';
            } else {
                imagePreview.style.display = 'none';
                placeholder.style.display = 'block';
            }
        }
        
        // Função para adicionar uma nova opção (tamanho ou cor)
        function addOption(tipo) {
            const inputId = tipo === 'tamanhos' ? 'novoTamanho' : 'novaCor';
            const input = document.getElementById(inputId);
            const valor = input.value.trim();
            
            if (!valor) {
                alert('Por favor, insira um ' + (tipo === 'tamanhos' ? 'tamanho' : 'cor') + ' válido.');
                return;
            }
            
            // Verificar se já existe
            const array = tipo === 'tamanhos' ? tamanhos : cores;
            if (array.includes(valor)) {
                alert('Este ' + (tipo === 'tamanhos' ? 'tamanho' : 'cor') + ' já foi adicionado.');
                return;
            }
            
            // Adicionar ao array
            array.push(valor);
            
            // Atualizar a visualização
            updateOptionList(tipo);
            
            // Limpar o campo de entrada
            input.value = '';
            
            // Atualizar a pré-visualização
            updatePreview();
        }
        
        // Função para remover uma opção
        function removeOption(tipo, valor) {
            const array = tipo === 'tamanhos' ? tamanhos : cores;
            const index = array.indexOf(valor);
            
            if (index !== -1) {
                array.splice(index, 1);
                updateOptionList(tipo);
                updatePreview();
            }
        }
        
        // Função para atualizar a lista de opções na interface
        function updateOptionList(tipo) {
            const array = tipo === 'tamanhos' ? tamanhos : cores;
            const listId = tipo === 'tamanhos' ? 'tamanhosList' : 'coresList';
            const listElement = document.getElementById(listId);
            
            // Limpar a lista atual
            listElement.innerHTML = '';
            
            // Adicionar cada item como um "tag"
            array.forEach(item => {
                const tag = document.createElement('span');
                tag.className = 'option-tag';
                tag.innerHTML = item + '<button type="button" onclick="removeOption(\\'' + tipo + '\\', \\'' + item + '\\')">×</button>';
                listElement.appendChild(tag);
            });
        }
        
        // Função para limpar o formulário
        function clearForm() {
            document.getElementById('productForm').reset();
            
            // Resetar arrays para valores padrão
            tamanhos = ["P", "M", "G"];
            cores = ["Vermelho", "Azul", "Preto"];
            
            // Atualizar as listas
            updateOptionList('tamanhos');
            updateOptionList('cores');
            
            // Atualizar a pré-visualização
            updatePreview();
            
            // Limpar mensagens de erro
            document.querySelectorAll('.error-message').forEach(el => {
                el.style.display = 'none';
            });
        }
        
        // Função para validar o formulário
        function validateForm() {
            let isValid = true;
            
            // Validar nome
            const nome = document.getElementById('nome').value.trim();
            if (!nome) {
                document.getElementById('nomeError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('nomeError').style.display = 'none';
            }
            
            // Validar preço
            const preco = document.getElementById('preco').value;
            if (!preco || parseFloat(preco) <= 0) {
                document.getElementById('precoError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('precoError').style.display = 'none';
            }
            
            // Validar tipo de peça
            const tipo = document.getElementById('tipo_peca').value;
            if (!tipo) {
                document.getElementById('tipoError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('tipoError').style.display = 'none';
            }
            
            // Validar moda
            const moda = document.getElementById('moda').value;
            if (!moda) {
                document.getElementById('modaError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('modaError').style.display = 'none';
            }
            
            return isValid;
        }
        
        // Função para formatar dados para envio
        function formatFormData() {
            return {
                nome: document.getElementById('nome').value.trim(),
                preco: parseFloat(document.getElementById('preco').value).toFixed(2),
                foto: document.getElementById('foto').value.trim(),
                tamanhos: JSON.stringify(tamanhos),
                cores: JSON.stringify(cores),
                tipo_peca: document.getElementById('tipo_peca').value,
                moda: document.getElementById('moda').value
            };
        }
        
        // Event listeners
        document.addEventListener('DOMContentLoaded', function() {
            // Inicializar as listas de opções
            updateOptionList('tamanhos');
            updateOptionList('cores');
            
            // Atualizar a pré-visualização inicial
            updatePreview();
            
            // Adicionar evento de input para atualização em tempo real
            document.querySelectorAll('#productForm input, #productForm select').forEach(element => {
                element.addEventListener('input', updatePreview);
            });
            
            // Adicionar evento de submit ao formulário           
            document.getElementById('productForm').addEventListener('submit', async function(e) {
                e.preventDefault();
                
                if (validateForm()) {
                    const formData = formatFormData();
                    
                    console.log('📤 Dados que serão enviados:', formData); // DEBUG
                    
                    try {
                        const response = await fetch('http://localhost:5500/criarproduto', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(formData)
                        });
                        
                        const result = await response.json();
                        console.log('📥 Resposta do servidor:', result); // DEBUG
                        
                        if (result.success === true) {
                            alert('✅ ' + result.message);
                            clearForm();
                        } else {
                            alert('❌ Erro: ' + result.messageErro);
                        }
                    } catch (error) {
                        console.error('🔥 Erro na requisição:', error); // DEBUG
                        alert('❌ Erro ao conectar com o servidor');
                    }
                }
            });
            
            // Adicionar evento ao botão de limpar
            document.getElementById('clearBtn').addEventListener('click', clearForm);
            
            // Permitir adicionar opções com Enter
            document.getElementById('novoTamanho').addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    addOption('tamanhos');
                }
            });
            
            document.getElementById('novaCor').addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    addOption('cores');
                }
            });
        });
    </script>
</body>
</html>`);
});


const port = 5500
app.listen(port, () => {
    console.log(`O Servidor iniciou com Sucesso na port: ${port}`)
})