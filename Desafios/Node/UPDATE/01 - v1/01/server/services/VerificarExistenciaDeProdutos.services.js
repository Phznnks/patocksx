
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