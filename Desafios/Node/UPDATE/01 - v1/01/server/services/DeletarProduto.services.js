
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
