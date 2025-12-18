
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
