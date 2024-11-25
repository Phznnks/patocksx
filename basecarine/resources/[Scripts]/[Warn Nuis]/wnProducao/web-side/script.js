var itemType = ''

$(document).ready(function(){

    window.addEventListener("message", function(event){

        switch (event.data.action) {
            case 'open':
                $('body').fadeIn(1000)
                itemType = event.data.type
                OpenNUI(event.data.config)
            break;
        }
        document.onkeyup = function(data){
            if(data.which == 27) {
                $('body').toggle('slide')
                $.post("https://wnProducao/close")
            }
        }
    })
})


function OpenNUI(event){

    $('.c-2').empty()
    event.forEach((value,key) => {
        value.forEach((value,key) => {

            if(value.img) {
                $('.c-2').append(` 



                <div class="item">
                    <div class="imagem"><img src="nui://wnInventory_v2/nui/images/${value.img}.png" alt=""></div>
                    <div class="title-item">${value.index} <ss style="color: rgb(43, 105, 221);">x${value.quantidade}</ss></div>
                    <div class="c-3" id="${key}"></div>
                    <div data-type = "${itemType}"" data-config = "${value.item}" onclick = CriarItem(this) class="criar">CRIAR</div>
                </div>
                
            `)

            value.ingrediente.forEach((value) => {
                // $(`#${key}`).append(`<small>${value.qtd}X ${value.img}</small>`)
                $(`#${key}`).append(`
                    <div class="item-3">
                        <img src="nui://wnInventory_v2/nui/images/${value.img}.png" alt="">
                        <div class="quantidade">${value.qtd}x</div>
                    </div>
                `)

            })

             } else {

                $('.c-2').append(` 



                <div class="item">
                    <div class="imagem"><img src="nui://wnInventory_v2/nui/images/${value.item}.png" alt=""></div>
                    <div class="title-item">${value.img} <ss style="color: rgb(43, 105, 221);">x${value.quantidade}</ss></div>
                    <div class="c-3" id="${key}"></div>
                    <div data-type = "${itemType}"" data-config = "${value.item}" onclick = CriarItem(this) class="criar">CRIAR</div>
                </div>
                
            `)
            value.ingrediente.forEach((value) => {
                // $(`#${key}`).append(`<small>${value.qtd}X ${value.img}</small>`)
                $(`#${key}`).append(`
                    <div class="item-3">
                        <img src="nui://wnInventory_v2/nui/images/${value.img}.png" alt="">
                        <div class="quantidade">${value.qtd}x</div>
                    </div>
                `)

            })

            }
        })
    })
}


function CriarItem(action){
    $('body').toggle('slide')
    $.post("https://wnProducao/CraftItem",JSON.stringify({config : action.dataset.config, type : action.dataset.type}))
    $.post("https://wnProducao/close")
}