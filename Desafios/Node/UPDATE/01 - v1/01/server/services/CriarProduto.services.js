
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
