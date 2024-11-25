cfg = {}


cfg.imagem = "https://cdn.discordapp.com/attachments/755933469955195015/951639146357735464/gardencity.png"

cfg.menu = {

    locs = { -- Tipos: arma,municao,utilitario
        { ['x'] = 744.61, ['y'] = -829.42, ['z'] = 24.92, ['tipo'] = "autocenter", ['permissao'] = 'autocenter.permissao', ['webhook'] = ''},
        { ['x'] = -1296.24, ['y'] = -285.7, ['z'] = 40.74, ['tipo'] = "autosport", ['permissao'] = 'autosport.permissao', ['webhook'] = ''},
        { ['x'] = -2403.75, ['y'] = 1805.19, ['z'] = 208.01, ['tipo'] = "franca", ['permissao'] = 'franca.permissao', ['webhook'] = ''},
        { ['x'] = -1493.08, ['y'] = 843.69, ['z'] = 181.6, ['tipo'] = "mafia", ['permissao'] = 'mafia.permissao', ['webhook'] = ''},
        { ['x'] = -128.27, ['y'] = 2790.13, ['z'] = 53.11, ['tipo'] = "roxos", ['permissao'] = 'roxos.permissao', ['webhook'] = ''},
        { ['x'] = 1519.36, ['y'] = -43.07, ['z'] = 151.42, ['tipo'] = "verdes", ['permissao'] = 'verdes.permissao', ['webhook'] = ''},
        { ['x'] = -892.06, ['y'] = -1441.99, ['z'] = 7.53, ['tipo'] = "tokyo", ['permissao'] = 'tokyo.permissao', ['webhook'] = ''},
        { ['x'] = -903.04, ['y'] = -1445.32, ['z'] = 7.53, ['tipo'] = "tokyo2", ['permissao'] = 'tokyo.permissao', ['webhook'] = ''},
        { ['x'] = 151.22, ['y'] = 331.44, ['z'] = 111.9, ['tipo'] = "motoclub", ['permissao'] = 'motoclub.permissao', ['webhook'] = ''},
        { ['x'] = -1320.09, ['y'] = -567.27, ['z'] = 31.73, ['tipo'] = "policia", ['permissao'] = 'policia.permissao', ['webhook'] = ''},
        { ['x'] = -629.5, ['y'] = 223.54, ['z'] = 81.89, ['tipo'] = "restaurante", ['permissao'] = 'restaurante.permissao', ['webhook'] = ''},
    },

    config = {

        ['restaurante'] = {

            {['quantidade'] = 1, ['index'] = "Coco", ['item'] = "coco", ['img'] = "coco", ['ingrediente'] = {
                {['index'] = "ingre-coco", ['item'] = "ingre-coco", ['img'] = "ingre-coco", ['qtd'] = 1},
                }
            },

            {['quantidade'] = 1, ['index'] = "Cafe", ['item'] = "cafe", ['img'] = "cafe", ['ingrediente'] = {
                {['index'] = "ingre-cafe", ['item'] = "ingre-cafe", ['img'] = "ingre-cafe", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Pizza", ['item'] = "pizza", ['img'] = "pizza", ['ingrediente'] = {
                {['index'] = "ingre-farinha", ['item'] = "ingre-farinha", ['img'] = "ingre-farinha", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Pipoca", ['item'] = "pipoca", ['img'] = "pipoca", ['ingrediente'] = {
                {['index'] = "ingre-milho", ['item'] = "ingre-milho", ['img'] = "ingre-milho", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Hotdog", ['item'] = "hotdog", ['img'] = "hotdog", ['ingrediente'] = {
                {['index'] = "ingre-salsicha", ['item'] = "ingre-salsicha", ['img'] = "ingre-salsicha", ['qtd'] = 2},
                {['index'] = "ingre-pao", ['item'] = "ingre-pao", ['img'] = "ingre-pao", ['qtd'] = 4},
                }
            },

            {['quantidade'] = 1, ['index'] = "Burger", ['item'] = "burger", ['img'] = "burger", ['ingrediente'] = {
                {['index'] = "ingre-hamburger", ['item'] = "ingre-hamburger", ['img'] = "ingre-hamburger", ['qtd'] = 2},
                {['index'] = "ingre-pao", ['item'] = "ingre-pao", ['img'] = "ingre-pao", ['qtd'] = 4},
                }
            },

            {['quantidade'] = 1, ['index'] = "Donut", ['item'] = "donut", ['img'] = "donut", ['ingrediente'] = {
                {['index'] = "ingre-acucar", ['item'] = "ingre-acucar", ['img'] = "ingre-acucar", ['qtd'] = 2},
                {['index'] = "ingre-farinha", ['item'] = "ingre-farinha", ['img'] = "ingre-farinha", ['qtd'] = 4},
                {['index'] = "ingre-leite", ['item'] = "ingre-leite", ['img'] = "ingre-leite", ['qtd'] = 3},
                }
            },


        },


        ['policia'] = {

            {['quantidade'] = 1, ['index'] = "Spray de Tinta", ['item'] = "spray", ['img'] = "spray", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 1},
                {['index'] = "tinta", ['item'] = "tinta", ['img'] = "tinta", ['qtd'] = 3},
                }
            },

            {['quantidade'] = 1, ['index'] = "Kit Attachs", ['item'] = "attachs", ['img'] = "attachs", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 5},
                }
            },

        },


        ['autocenter'] = {

            {['quantidade'] = 1, ['index'] = "Kit de Reparo", ['item'] = "repairkit", ['img'] = "repairkit", ['ingrediente'] = {
                {['index'] = "ferramentas", ['item'] = "ferramentas", ['img'] = "ferramentas", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Module Xenon", ['item'] = "moduloxenon", ['img'] = "moduloxenon", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "controle", ['item'] = "controle", ['img'] = "controle", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Module Neon", ['item'] = "moduloneon", ['img'] = "moduloneon", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "controle", ['item'] = "controle", ['img'] = "controle", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Suspensao Ar", ['item'] = "suspensaoar", ['img'] = "suspensaoar", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "borracha", ['item'] = "borracha", ['img'] = "borracha", ['qtd'] = 5},
                {['index'] = "controle", ['item'] = "controle", ['img'] = "controle", ['qtd'] = 5},
                }
            },
        },

        ['autosport'] = {

            {['quantidade'] = 1, ['index'] = "Kit de Reparo", ['item'] = "repairkit", ['img'] = "repairkit", ['ingrediente'] = {
                {['index'] = "ferramentas", ['item'] = "ferramentas", ['img'] = "ferramentas", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Module Xenon", ['item'] = "moduloxenon", ['img'] = "moduloxenon", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "controle", ['item'] = "controle", ['img'] = "controle", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Module Neon", ['item'] = "moduloneon", ['img'] = "moduloneon", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "controle", ['item'] = "controle", ['img'] = "controle", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Suspensao Ar", ['item'] = "suspensaoar", ['img'] = "suspensaoar", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "borracha", ['item'] = "borracha", ['img'] = "borracha", ['qtd'] = 5},
                {['index'] = "controle", ['item'] = "controle", ['img'] = "controle", ['qtd'] = 5},
                }
            },

        },

        ['franca'] = {

            {['quantidade'] = 1, ['index'] = "HK P7M10", ['item'] = "wbody|WEAPON_SNSPISTOL", ['img'] = "fajuta", ['ingrediente'] = {
                {['index'] = "pecadehk", ['item'] = "pecadehk", ['img'] = "pecadehk", ['qtd'] = 60},
                }
            },

            {['quantidade'] = 1, ['index'] = "Five Seven", ['item'] = "wbody|WEAPON_PISTOL_MK2", ['img'] = "fiveseven", ['ingrediente'] = {
                {['index'] = "pecadefive", ['item'] = "pecadefive", ['img'] = "pecadefive", ['qtd'] = 100},
                }
            },

            {['quantidade'] = 1, ['index'] = "Uzi", ['item'] = "wbody|WEAPON_MICROSMG", ['img'] = "uzi", ['ingrediente'] = {
                {['index'] = "pecadeuzi", ['item'] = "pecadeuzi", ['img'] = "pecadeuzi", ['qtd'] = 140},
                }
            },

            {['quantidade'] = 1, ['index'] = "MTAR", ['item'] = "wbody|WEAPON_ASSAULTSMG", ['img'] = "mtar", ['ingrediente'] = {
                {['index'] = "pecademtar", ['item'] = "pecademtar", ['img'] = "pecademtar", ['qtd'] = 200},
                }
            },
            
            {['quantidade'] = 1, ['index'] = "VEPR", ['item'] = "wbody|WEAPON_MILITARYRIFLE", ['img'] = "mili", ['ingrediente'] = {
                {['index'] = "pecademilitary", ['item'] = "pecademilitary", ['img'] = "pecademilitary", ['qtd'] = 220},
                }
            },

            {['quantidade'] = 1, ['index'] = "AK-47", ['item'] = "wbody|WEAPON_ASSAULTRIFLE", ['img'] = "ak47", ['ingrediente'] = {
                {['index'] = "pecadeak", ['item'] = "pecadeak", ['img'] = "pecadeak", ['qtd'] = 250},
                }
            },

            {['quantidade'] = 1, ['index'] = "G35", ['item'] = "wbody|WEAPON_SPECIALCARBINE", ['img'] = "g3", ['ingrediente'] = {
                {['index'] = "pecadeg3", ['item'] = "pecadeg3", ['img'] = "pecadeg3", ['qtd'] = 300},
                }
            },

            {['quantidade'] = 1, ['index'] = "Silenciador", ['item'] = "silenciador", ['img'] = "silenciador", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 20},
                {['index'] = "adaptadordebico", ['item'] = "adaptadordebico", ['img'] = "adaptadordebico", ['qtd'] = 3},
                }
            },

            {['quantidade'] = 1, ['index'] = "Carregador", ['item'] = "carregador", ['img'] = "carregador", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 25},
                }
            },

            {['quantidade'] = 1, ['index'] = "Mira", ['item'] = "mira", ['img'] = "mira", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 15},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 15},
                }
            },

            {['quantidade'] = 1, ['index'] = "Grip", ['item'] = "grip", ['img'] = "grip", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 10},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 10},
                }
            },

            {['quantidade'] = 1, ['index'] = "Compensador", ['item'] = "compensador", ['img'] = "compensador", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 25},
                {['index'] = "adaptadordebico", ['item'] = "adaptadordebico", ['img'] = "adaptadordebico", ['qtd'] = 5},
                }
            },

        },

        ['mafia'] = {

            {['quantidade'] = 1, ['index'] = "HK P7M10", ['item'] = "wbody|WEAPON_SNSPISTOL", ['img'] = "fajuta", ['ingrediente'] = {
                {['index'] = "pecadehk", ['item'] = "pecadehk", ['img'] = "pecadehk", ['qtd'] = 60},
                }
            },

            {['quantidade'] = 1, ['index'] = "Five Seven", ['item'] = "wbody|WEAPON_PISTOL_MK2", ['img'] = "fiveseven", ['ingrediente'] = {
                {['index'] = "pecadefive", ['item'] = "pecadefive", ['img'] = "pecadefive", ['qtd'] = 100},
                }
            },

            {['quantidade'] = 1, ['index'] = "Uzi", ['item'] = "wbody|WEAPON_MICROSMG", ['img'] = "uzi", ['ingrediente'] = {
                {['index'] = "pecadeuzi", ['item'] = "pecadeuzi", ['img'] = "pecadeuzi", ['qtd'] = 140},
                }
            },

            {['quantidade'] = 1, ['index'] = "MTAR", ['item'] = "wbody|WEAPON_ASSAULTSMG", ['img'] = "mtar", ['ingrediente'] = {
                {['index'] = "pecademtar", ['item'] = "pecademtar", ['img'] = "pecademtar", ['qtd'] = 200},
                }
            },
            
            {['quantidade'] = 1, ['index'] = "VEPR", ['item'] = "wbody|WEAPON_MILITARYRIFLE", ['img'] = "mili", ['ingrediente'] = {
                {['index'] = "pecademilitary", ['item'] = "pecademilitary", ['img'] = "pecademilitary", ['qtd'] = 220},
                }
            },

            {['quantidade'] = 1, ['index'] = "AK-47", ['item'] = "wbody|WEAPON_ASSAULTRIFLE", ['img'] = "ak47", ['ingrediente'] = {
                {['index'] = "pecadeak", ['item'] = "pecadeak", ['img'] = "pecadeak", ['qtd'] = 250},
                }
            },

            {['quantidade'] = 1, ['index'] = "G35", ['item'] = "wbody|WEAPON_SPECIALCARBINE", ['img'] = "g3", ['ingrediente'] = {
                {['index'] = "pecadeg3", ['item'] = "pecadeg3", ['img'] = "pecadeg3", ['qtd'] = 300},
                }
            },

            {['quantidade'] = 1, ['index'] = "Silenciador", ['item'] = "silenciador", ['img'] = "silenciador", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 20},
                {['index'] = "adaptadordebico", ['item'] = "adaptadordebico", ['img'] = "adaptadordebico", ['qtd'] = 3},
                }
            },

            {['quantidade'] = 1, ['index'] = "Carregador", ['item'] = "carregador", ['img'] = "carregador", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 25},
                }
            },

            {['quantidade'] = 1, ['index'] = "Mira", ['item'] = "mira", ['img'] = "mira", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 15},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 15},
                }
            },

            {['quantidade'] = 1, ['index'] = "Grip", ['item'] = "grip", ['img'] = "grip", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 10},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 10},
                }
            },

            {['quantidade'] = 1, ['index'] = "Compensador", ['item'] = "compensador", ['img'] = "compensador", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 25},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 25},
                {['index'] = "adaptadordebico", ['item'] = "adaptadordebico", ['img'] = "adaptadordebico", ['qtd'] = 5},
                }
            },

        },
        
        ['roxos'] = {

            {['quantidade'] = 10, ['index'] = "Saco de Maconha", ['item'] = "sacodemaconha", ['img'] = "sacodemaconha", ['ingrediente'] = {
                {['index'] = "folhademaconha", ['item'] = "folhademaconha", ['img'] = "folhademaconha", ['qtd'] = 15},
                }
            },

            {['quantidade'] = 1, ['index'] = "Colete", ['item'] = "colete", ['img'] = "colete", ['ingrediente'] = {
                {['index'] = "espumadevidro", ['item'] = "espumadevidro", ['img'] = "espumadevidro", ['qtd'] = 25},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 25},
                }
            },

        },
        
        ['verdes'] = {

            {['quantidade'] = 10, ['index'] = "Saco de Cocaina", ['item'] = "sacodecocaina", ['img'] = "sacodecocaina", ['ingrediente'] = {
                {['index'] = "cocaina", ['item'] = "cocaina", ['img'] = "cocaina", ['qtd'] = 15},
                }
            },

            {['quantidade'] = 1, ['index'] = "Colete", ['item'] = "colete", ['img'] = "colete", ['ingrediente'] = {
                {['index'] = "espumadevidro", ['item'] = "espumadevidro", ['img'] = "espumadevidro", ['qtd'] = 25},
                {['index'] = "polimero", ['item'] = "polimero", ['img'] = "polimero", ['qtd'] = 25},
                }
            },

        },

        ['tokyo'] = {

            {['quantidade'] = 60, ['index'] = "Municao HK P7M10", ['item'] = "wammo|WEAPON_SNSPISTOL", ['img'] = "m-fajuta", ['ingrediente'] = {
                {['index'] = "pente-fajuta", ['item'] = "pente-fajuta", ['img'] = "pente-fajuta", ['qtd'] = 18},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 25},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao Five Seven", ['item'] = "wammo|WEAPON_PISTOL_MK2", ['img'] = "m-five", ['ingrediente'] = {
                {['index'] = "pente-five", ['item'] = "pente-five", ['img'] = "pente-five", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 50},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao Uzi", ['item'] = "wammo|WEAPON_MICROSMG", ['img'] = "m-uzi", ['ingrediente'] = {
                {['index'] = "pente-uzi", ['item'] = "pente-uzi", ['img'] = "pente-uzi", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 90},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao MTAR", ['item'] = "wammo|WEAPON_ASSAULTSMG", ['img'] = "m-mtar", ['ingrediente'] = {
                {['index'] = "pente-mtar", ['item'] = "pente-mtar", ['img'] = "pente-mtar", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 150},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                }
            },
            
            {['quantidade'] = 60, ['index'] = "Municao VEPR", ['item'] = "wammo|WEAPON_MILITARYRIFLE", ['img'] = "m-mili", ['ingrediente'] = {
                {['index'] = "pente-mili", ['item'] = "pente-mili", ['img'] = "pente-mili", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 200},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 40},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao AK-47", ['item'] = "wammo|WEAPON_ASSAULTRIFLE", ['img'] = "m-ak", ['ingrediente'] = {
                {['index'] = "pente-ak", ['item'] = "pente-ak", ['img'] = "pente-ak", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 200},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 40},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao G35", ['item'] = "wammo|WEAPON_SPECIALCARBINE", ['img'] = "m-g3", ['ingrediente'] = {
                {['index'] = "pente-g3", ['item'] = "pente-g3", ['img'] = "pente-g3", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 250},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 40},
                }
            },
        },

        ['tokyo2'] = {

            {['quantidade'] = 1, ['index'] = "Bolso", ['item'] = "bolso", ['img'] = "bolso", ['ingrediente'] = {
                {['index'] = "linha", ['item'] = "linha", ['img'] = "linha", ['qtd'] = 15},
                {['index'] = "pano", ['item'] = "pano", ['img'] = "pano", ['qtd'] = 15},
                }
            },

            {['quantidade'] = 1, ['index'] = "Algema", ['item'] = "algema", ['img'] = "algema", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 8},
                }
            },

            {['quantidade'] = 1, ['index'] = "LockPick", ['item'] = "lockpick", ['img'] = "lockpick", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 5},
                }
            },

            {['quantidade'] = 1, ['index'] = "Capuz", ['item'] = "capuz", ['img'] = "capuz", ['ingrediente'] = {
                {['index'] = "linha", ['item'] = "linha", ['img'] = "linha", ['qtd'] = 10},
                {['index'] = "pano", ['item'] = "pano", ['img'] = "pano", ['qtd'] = 10},
                }
            },

            {['quantidade'] = 1, ['index'] = "Placa", ['item'] = "placa", ['img'] = "placa", ['ingrediente'] = {
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 10},
                }
            },

            {['quantidade'] = 1, ['index'] = "C4", ['item'] = "c4", ['img'] = "c4", ['ingrediente'] = {
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 30},
                {['index'] = "pano", ['item'] = "pano", ['img'] = "pano", ['qtd'] = 10},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 50},
                }
            },

        },

        ['motoclub'] = {

            {['quantidade'] = 60, ['index'] = "Municao HK P7M10", ['item'] = "wammo|WEAPON_SNSPISTOL", ['img'] = "m-fajuta", ['ingrediente'] = {
                {['index'] = "pente-fajuta", ['item'] = "pente-fajuta", ['img'] = "pente-fajuta", ['qtd'] = 8},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 25},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao Five Seven", ['item'] = "wammo|WEAPON_PISTOL_MK2", ['img'] = "m-five", ['ingrediente'] = {
                {['index'] = "pente-five", ['item'] = "pente-five", ['img'] = "pente-five", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 50},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao Uzi", ['item'] = "wammo|WEAPON_MICROSMG", ['img'] = "m-uzi", ['ingrediente'] = {
                {['index'] = "pente-uzi", ['item'] = "pente-uzi", ['img'] = "pente-uzi", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 90},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao MTAR", ['item'] = "wammo|WEAPON_ASSAULTSMG", ['img'] = "m-mtar", ['ingrediente'] = {
                {['index'] = "pente-mtar", ['item'] = "pente-mtar", ['img'] = "pente-mtar", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 150},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 20},
                }
            },
            
            {['quantidade'] = 60, ['index'] = "Municao VEPR", ['item'] = "wammo|WEAPON_MILITARYRIFLE", ['img'] = "m-mili", ['ingrediente'] = {
                {['index'] = "pente-mili", ['item'] = "pente-mili", ['img'] = "pente-mili", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 200},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 40},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao AK-47", ['item'] = "wammo|WEAPON_ASSAULTRIFLE", ['img'] = "m-ak", ['ingrediente'] = {
                {['index'] = "pente-ak", ['item'] = "pente-ak", ['img'] = "pente-ak", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 200},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 40},
                }
            },

            {['quantidade'] = 60, ['index'] = "Municao G35", ['item'] = "wammo|WEAPON_SPECIALCARBINE", ['img'] = "m-g3", ['ingrediente'] = {
                {['index'] = "pente-g3", ['item'] = "pente-g3", ['img'] = "pente-g3", ['qtd'] = 1},
                {['index'] = "polvora", ['item'] = "polvora", ['img'] = "polvora", ['qtd'] = 250},
                {['index'] = "ferro", ['item'] = "ferro", ['img'] = "ferro", ['qtd'] = 40},
                }
            },
        },

    }


}

return cfg