let corridasPredefinidas = [];

// Eventos do NUI
window.addEventListener('message', function(event) {
    const data = event.data;
    
    switch(data.action) {
        case 'abrirPainel':
            abrirPainel(data.corridas);
            break;
        case 'atualizarPainelCorrida':
            atualizarPainelCorrida(data);
            break;
        case 'mostrarResultados':
            mostrarResultados(data.vencedores);
            break;
        case 'fecharTodosPainels':
            fecharTodosPainels();
            break;
    }
});

// Funções do painel
function abrirPainel(corridas) {
    corridasPredefinidas = corridas || [];
    mostrarPagina('menuPrincipal');
    carregarCorridasPredefinidas();
}

function fecharPainel() {
    fetch(`https://${GetParentResourceName()}/fecharPainel`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    });
    fecharTodosPainels();
}

function fecharTodosPainels() {
    document.querySelectorAll('.pagina, .painel-corrida, .painel-resultados').forEach(el => {
        el.style.display = 'none';
    });
    SetNuiFocus(false);
}

function mostrarPagina(idPagina) {
    fecharTodosPainels();
    document.getElementById(idPagina).style.display = 'flex';
    SetNuiFocus(true);
}

function voltarMenu() {
    mostrarPagina('menuPrincipal');
}

// Corridas Predefinidas
function abrirCorridasPredefinidas() {
    mostrarPagina('corridasPredefinidas');
}

function carregarCorridasPredefinidas() {
    const container = document.getElementById('listaCorridasPredefinidas');
    container.innerHTML = '';

    corridasPredefinidas.forEach((corrida, index) => {
        const div = document.createElement('div');
        div.className = 'corrida-item';
        div.innerHTML = `
            <h3>${corrida.nome}</h3>
            <p>${corrida.checkpoints ? corrida.checkpoints.length : 0} checkpoints</p>
            <p>Dificuldade: ${corrida.dificuldade || 'Média'}</p>
        `;
        div.onclick = () => iniciarCorridaPredefinida(index);
        container.appendChild(div);
    });
}

function iniciarCorridaPredefinida(index) {
    fetch(`https://${GetParentResourceName()}/iniciarCorridaPredefinida`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            corridaIndex: index
        })
    });
    fecharTodosPainels();
}

// Corrida Personalizada
function abrirCorridaPersonalizada() {
    mostrarPagina('corridaPersonalizada');
}

function iniciarCorridaPersonalizada() {
    const nomeCorrida = document.getElementById('nomeCorrida').value;
    const numeroVoltas = document.getElementById('numeroVoltas').value;

    if (!nomeCorrida) {
        // Aqui você pode adicionar uma notificação de erro
        return;
    }

    fetch(`https://${GetParentResourceName()}/iniciarCorridaPersonalizada`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            nome: nomeCorrida,
            voltas: parseInt(numeroVoltas)
        })
    });
    fecharTodosPainels();
}

function adicionarCheckpoint() {
    fetch(`https://${GetParentResourceName()}/adicionarCheckpoint`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    });
}

// Painel Durante Corrida
function atualizarPainelCorrida(data) {
    const painel = document.getElementById('painelCorrida');
    painel.style.display = 'block';

    // Atualizar informações
    document.getElementById('posicaoAtual').textContent = data.posicao;
    document.getElementById('checkpointsAtual').textContent = `${data.checkpointAtual}/${data.totalCheckpoints}`;
    document.getElementById('totalParticipantes').textContent = data.totalParticipantes;

    // Atualizar lista de participantes
    const lista = document.getElementById('listaParticipantes');
    lista.innerHTML = '';

    if (data.participantes && Array.isArray(data.participantes)) {
        data.participantes.forEach(participante => {
            const div = document.createElement('div');
            div.className = 'participante';
            div.innerHTML = `
                <span>${participante.nome}</span>
                <span>${participante.checkpointAtual}/${data.totalCheckpoints}</span>
            `;
            lista.appendChild(div);
        });
    }
}

// Resultados
function mostrarResultados(vencedores) {
    document.getElementById('primeiroLugar').textContent = vencedores[0] || '---';
    document.getElementById('segundoLugar').textContent = vencedores[1] || '---';
    document.getElementById('terceiroLugar').textContent = vencedores[2] || '---';
    
    document.getElementById('painelResultados').style.display = 'block';
    SetNuiFocus(true);
}

function fecharResultados() {
    document.getElementById('painelResultados').style.display = 'none';
    SetNuiFocus(false);
    
    fetch(`https://${GetParentResourceName()}/fecharResultados`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    });
}

// Tecla ESC para fechar
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        const resultadosAberto = document.getElementById('painelResultados').style.display === 'block';
        const menuAberto = document.getElementById('menuPrincipal').style.display === 'flex';
        
        if (resultadosAberto) {
            fecharResultados();
        } else if (menuAberto) {
            fecharPainel();
        } else {
            voltarMenu();
        }
    }
});

// Função para comunicação com o FiveM
function SetNuiFocus(hasFocus) {
    fetch(`https://${GetParentResourceName()}/setNuiFocus`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            hasFocus: hasFocus
        })
    });
}