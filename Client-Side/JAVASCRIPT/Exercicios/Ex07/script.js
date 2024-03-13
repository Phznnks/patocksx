var div = document.querySelector('.box')
var txt = document.querySelector('.txt')

div.style.backgroundColor = 'green'
div.style.width = '250px'
div.style.height = '200px'
div.style.margin = '10%'
div.style.marginLeft = '40%'
div.style.color = 'white'
div.style.textAlign = 'center'
div.style.fontSize = '25px'
div.style.paddingTop = '110px'
div.style.fontFamily = 'Arial'

div.addEventListener('click', clicar)
div.addEventListener('mouseenter', hover)
div.addEventListener('mouseout', hoverout)

function clicar(){
    div.style.backgroundColor = 'red'
    txt.innerHTML = 'Clicou'
}

function hover() {
    div.style.backgroundColor = 'yellow'
    txt.innerHTML = 'Entrou'
}

function hoverout() {
    div.style.backgroundColor = 'green'
    txt.innerHTML = 'Clicar'
}
