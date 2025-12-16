const express = require('express')
const app = express()


app.get('/index', (req, res) => {
    res.send('Bem Vindo(a)!.')
})



const port = 3000
app.listen(port, ()=> {
    console.log('Servidor Iniciador na Port: ', port)
})