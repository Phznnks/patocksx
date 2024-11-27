local config = {}

config.ipimages = "http://54.39.152.205/alife/vrp_itens/"

config.shops = { 
    ['acessories'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            -- { ['x'] = 425.57, ['y'] = -806.27, ['z'] = 29.5 },
            -- { ['x'] = 75.44, ['y'] = -1392.85, ['z'] = 29.38 },
            -- { ['x'] = -822.38, ['y'] = -1073.59, ['z'] = 11.33 },
            -- { ['x'] = -1193.17, ['y'] = -767.95, ['z'] = 17.32 },
            -- { ['x'] = -163.54, ['y'] = -303.28, ['z'] = 39.74 },
            -- { ['x'] = 125.72, ['y'] = -223.82, ['z'] = 54.56 },
            -- { ['x'] = -710.04, ['y'] = -152.58, ['z'] = 37.42 },
            -- { ['x'] = -1450.05, ['y'] = -237.21, ['z'] = 49.82 },
            -- { ['x'] = -3170.62, ['y'] = 1043.74, ['z'] = 20.87 },
            -- { ['x'] = -1101.29, ['y'] = 2710.63, ['z'] = 19.11 },
            -- { ['x'] = 614.2, ['y'] = 2762.82, ['z'] = 42.09 },
            -- { ['x'] = 1196.75, ['y'] = 2710.26, ['z'] = 38.23 },
            -- { ['x'] = 1693.84, ['y'] = 4822.9, ['z'] = 42.07 },
            -- { ['x'] = 4.82, ['y'] = 6512.48, ['z'] = 31.88 }
        },
        itens = {
            { name = 'mascara', price = 500 },
            { name = 'oculos', price = 500 },
            { name = 'chapeu', price = 500 },
            { name = 'mochilap', price = 5000 },
            { name = 'mochilam', price = 8000 },
            { name = 'mochilag', price = 11000 }
        } 
    },
    ['ammunation'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = 22.65, ['y'] = -1106.97, ['z'] = 29.8 },
            { ['x'] = 809.56, ['y'] = -2157.66, ['z'] = 29.62 },
            { ['x'] = 1693.71, ['y'] = 3760.54, ['z'] = 34.71 },
            { ['x'] = 252.31, ['y'] = -50.68, ['z'] = 69.95 },
            { ['x'] = 841.75, ['y'] = -1033.94, ['z'] = 28.2 },
            { ['x'] = -330.19, ['y'] = 6084.47, ['z'] = 31.46 },
            { ['x'] = -661.63, ['y'] = -934.93, ['z'] = 21.83 },
            { ['x'] = -1305.6, ['y'] = -394.94, ['z'] = 36.7 },
            { ['x'] = -1117.58, ['y'] = 2699.19, ['z'] = 18.56 },
            { ['x'] = 2567.29, ['y'] = 293.96, ['z'] = 108.74 },
            { ['x'] = -3172.03, ['y'] = 1088.45, ['z'] = 20.84 }
        },
        itens = {
            { name = 'wbodyWEAPON_SWITCHBLADE', price = 950 },
            { name = 'wbodyWEAPON_KNIFE', price = 950 }
        }
    },
    ['pub'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = -560.27, ['y'] = 286.55, ['z'] = 82.18 }, -- Tequi-La-La;
            { ['x'] = 350.91, ['y'] = 288.7, ['z'] = 91.2 }, -- Galaxy Club;
            { ['x'] = 356.51, ['y'] = 282.83, ['z'] = 94.2 }, -- Galaxy Club;
            { ['x'] = 129.18, ['y'] = -1280.71, ['z'] = 29.27 }, -- Vanilla Unicorn;
            { ['x'] = 739.13, ['y'] = -826.27, ['z'] = 22.67 }, -- PixelBar
            { ['x'] = 962.75, ['y'] = 59.38, ['z'] = 75.44 },
            { ['x'] = 945.69, ['y'] = 16.97, ['z'] = 116.17 },
        },
        itens = {
            { name = 'pibwassen', price = 12 },
            { name = 'tequilya', price = 24 },
            { name = 'patriot', price = 12 },
            { name = 'blarneys', price = 25 },
            { name = 'jakeys', price = 36 },
            { name = 'barracho', price = 12 },
            { name = 'ragga', price = 20 },
            { name = 'nogo', price = 29 },
            { name = 'mount', price = 29 },
            { name = 'cherenkov', price = 29 },
            { name = 'bourgeoix', price = 42 },
            { name = 'bleuterd', price = 34 }
        }
    },
    ['coffeeshop'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = -633.71, ['y'] = 236.16, ['z'] = 81.89 }
        },
        itens = {
            { name = 'cafe', price = 8 },
            { name = 'cafecleite', price = 10 },
            { name = 'cafeexpresso', price = 14 },
            { name = 'capuccino', price = 17 },
            { name = 'frappuccino', price = 18 },
            { name = 'cha', price = 9 },
            { name = 'icecha', price = 9 },
            { name = 'sanduiche', price = 12 },
            { name = 'rosquinha', price = 9 }
        }
    },
    ['convenienceshop'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = 25.75, ['y'] = -1345.5, ['z'] = 29.5 },
            { ['x'] = -48.42, ['y'] = -1757.87, ['z'] = 29.43 },
            { ['x'] = -707.42, ['y'] = -914.59, ['z'] = 19.22 },
            { ['x'] = -1222.27, ['y'] = -906.59, ['z'] = 12.33 },
            { ['x'] = -1487.7, ['y'] = -378.6, ['z'] = 40.17 },
            { ['x'] = 1163.61, ['y'] = -323.94, ['z'] = 69.21 },
            { ['x'] = 374.21, ['y'] = 327.8, ['z'] = 103.57 },
            { ['x'] = 2555.58, ['y'] = 382.11, ['z'] = 108.63 },
            { ['x'] = -2967.83, ['y'] = 391.63, ['z'] = 15.05 },
            { ['x'] = -3041.04, ['y'] = 585.14, ['z'] = 7.91 },
            { ['x'] = -3243.91, ['y'] = 1001.32, ['z'] = 12.84 },
            { ['x'] = 548.13, ['y'] = 2669.47, ['z'] = 42.16 },
            { ['x'] = 1165.35, ['y'] = 2709.39, ['z'] = 38.16 },
            { ['x'] = 1960.23, ['y'] = 3742.13, ['z'] = 32.35 },
            { ['x'] = 1697.98, ['y'] = 4924.48, ['z'] = 42.07 },
            { ['x'] = 2677.09, ['y'] = 3281.33, ['z'] = 55.25 },
            { ['x'] = 1729.77, ['y'] = 6416.24, ['z'] = 35.04 }
        },
        itens = {
            { name = 'mascara', price = 500 },
            { name = 'oculos', price = 500 },
            { name = 'chapeu', price = 500 },
            { name = 'mochilap', price = 5000 },
            { name = 'mochilam', price = 8000 },
            { name = 'mochilag', price = 11000 }
        }
    },
    ['convenienceshopjob'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = -436.69, ['y'] = -318.39, ['z'] = 34.92 }, --['x'] = 821.89, ['y'] = -928.83, ['z'] = 32.4
            { ['x'] = 821.89, ['y'] = -928.83, ['z'] = 32.4 }
        },
        checkpermissions = {
            "mecanico.permissao",
            "ems.permissao",
        },
        itens = {
            { name = 'sanduiche', price = 10 },
            { name = 'rosquinha', price = 20 },
            { name = 'hotdog', price = 30 },
            { name = 'xburguer', price = 10 },
            { name = 'chips', price = 20 },
            { name = 'batataf', price = 30 },
            { name = 'pizza', price = 10 },
            { name = 'taco', price = 20 },
            { name = 'agua', price = 30 },
            { name = 'cola', price = 10 },
            { name = 'sprunk', price = 20 },
            { name = 'energetico', price = 30 },
            { name = 'leite', price = 10 },
            { name = 'barracho', price = 20 },
            { name = 'patriot', price = 30 },
            { name = 'pibwassen', price = 10 }
        }
    },
    ['restaurantshop'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = -1836.43, ['y'] = -1188.61, ['z'] = 14.33 }
        },
        checkoffice = 'restaurante.permissao',
        itens = {
            { name = 'sanduiche', price = 10 },
            { name = 'rosquinha', price = 20 },
            { name = 'hotdog', price = 30 },
            { name = 'xburguer', price = 10 },
            { name = 'chips', price = 20 },
            { name = 'batataf', price = 30 },
            { name = 'pizza', price = 10 },
            { name = 'taco', price = 20 },
            { name = 'agua', price = 30 },
            { name = 'cola', price = 10 },
            { name = 'sprunk', price = 20 },
            { name = 'energetico', price = 30 },
            { name = 'leite', price = 10 },
            { name = 'barracho', price = 20 },
            { name = 'patriot', price = 30 },
            { name = 'pibwassen', price = 10 }
        }
    },
    ['digitalshop'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = -658.05, ['y'] = -857.51, ['z'] = 24.5 },
        },
        itens = {
            { name = 'radio', price = 300 },
            { name = 'maquininha', price = 600 },
            { name = 'celular', price = 800 },
            { name = 'bateria-celular', price = 500 }
        }
    },
    ['drugshop'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = 93.26, ['y'] = -230.07, ['z'] = 54.67 },
            { ['x'] = 317.13, ['y'] = -1077.07, ['z'] = 29.48 },
            { ['x'] = -493.43, ['y'] = -339.9, ['z'] = 42.33 },
            { ['x'] = 107.1, ['y'] = -207.18, ['z'] = 54.64 }
        },
        itens = {
            { name = 'paracetamil', require = 'r-paracetamil', price = 67 },
            { name = 'voltarom', require = 'r-voltarom', price = 80 },
            { name = 'trandrylux', require = 'r-trandrylux', price = 95 },
            { name = 'dorfrex', require = 'r-dorfrex', price = 60 },
            { name = 'buscopom', require = 'r-buscopom', price = 73 }
        }
    },
    ['toolshop'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = -39.1, ['y'] = -1661.16, ['z'] = 29.5 }
        },
        itens = {
            { name = 'garrafa-vazia', price = 12 },
            { name = 'caixa-vazia', price = 5 },
            { name = 'paninho', price = 29 },
            { name = 'ponta-britadeira', price = 45 },
            -- { name = 'repairkit', price = 45 },
            { name = 'serra', price = 650 },
            { name = 'pa-jardinagem', price = 100 },
            { name = 'furadeira', price = 450 },
            { name = 'chavedefenda', price = 450 },
            { name = 'wbodyWEAPON_HAMMER', price = 300 },
            { name = 'wbodyWEAPON_CROWBAR', price = 300 },
            { name = 'wbodyWEAPON_WEAPON_HATCHET', price = 300 },
            { name = 'wbodyWEAPON_WHENCH', price = 300 }
        }
    },
    ['lifeinvader'] = {
        type    = 'buy',
        payment = 'coins', --money | coins | free
        coords  = {
            -- { ['x'] = -1081.5, ['y'] = -247.21, ['z'] = 37.77 }
        },
        itens = {
            { name = 'garrafa-vazia', price = 12 },
            { name = 'caixa-vazia', price = 5 },
            { name = 'paninho', price = 29 },
            { name = 'ponta-britadeira', price = 45 },
            { name = 'repairkit', price = 45 },
            { name = 'serra', price = 650 },
            { name = 'pa-jardinagem', price = 100 },
            { name = 'furadeira', price = 450 },
            { name = 'wbody|WEAPON_HAMMER', price = 300 },
            { name = 'wbody|WEAPON_CROWBAR', price = 300 },
            { name = 'wbody|WEAPON_WEAPON_HATCHET', price = 300 },
            { name = 'wbody|WEAPON_WHENCH', price = 300 }
        }
    },
    ['miner-foundry'] = {
        type    = 'sell',
        payment = 'consume', --money | coins | free
        coords  = {
            { ['x'] = 1074.77, ['y'] = -2009.47, ['z'] = 32.09 }
        },
        itens = {
            { name = 'diamante', price = 1 },
            { name = 'barra-ouro', price = 1 },
            { name = 'barra-prata', price = 1 },
            { name = 'barra-ferro', price = 1 }
        },
        necessary = {
            ['diamante'] = { name = 'minerio-diamante', amount = 4 },
            ['barra-ouro'] = { name = 'minerio-ouro', amount = 4 },
            ['barra-prata'] = { name = 'minerio-prata', amount = 4 },
            ['barra-ferro'] = { name = 'minerio-ferro', amount = 4 },
        }
    },
    ['miner-delivery'] = {
        type    = 'sell',
        payment = 'money', --money | coins | free
        coords  = {
            { ['x'] = 1066.76, ['y'] = -2008.12, ['z'] = 32.09 }
        },
        itens = {
            { name = 'diamante', price = 250 },
            { name = 'barra-ouro', price = 175 },
            { name = 'barra-prata', price = 125 },
            { name = 'barra-ferro', price = 75 }
        }
    },
    ['vipshop'] = {
        type    = 'buy',
        payment = 'coins', --money | coins | free
        coords  = {
            { ['x'] = -622.73, ['y'] = -229.44, ['z'] = 38.06 }
        },
        itens = {
            { name = 'cartaovipprata', price = 300 },
            { name = 'cartaovipouro', price = 400 },
            { name = 'cartaovipplatina', price = 500 },
            { name = 'cartaovipdiamante', price = 600 }
        }
    },
    ['mechanishop'] = {
        type    = 'buy',
        payment = 'money', --money | coins | free
        coords  = {
            -- { ['x'] = 818.3, ['y'] = -956.27, ['z'] = 22.09 }
        },
        checkpermissions = {
            "mecanico.permissao",
        },
        itens = {
            { name = 'repairkit', price = 50 }
        }
    },
}

config.chest = {
    ['ems'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = '',
        permissions = {
            'ems.permissao'
        },
        coords  = { 
            { ['x'] = -453.53, ['y'] = -308.39, ['z'] = 34.92 }
        }, 
    },
    ['mecanico'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = '',
        permissions = {
            'mecanico.permissao'
        },
        coords  = { 
            { ['x'] = 837.73, ['y'] = -932.95, ['z'] = 32.4 }
        }, 
    },
    ----------------------------------------------------------------------------------------------------
    ---------------------------------------- BALLAS ----------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['ballaslider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957678434509795408/oYcdCbhm253HsOMJRGgM8LdIU5UTtHZCsvsO6YJbMk3KD5YIc5AfSCJrcKT_ApGEePyH',
        permissions = {
            'manager.permissao',
            'lider-ballas.permissao'
        },
        coords  = { 
            { ['x'] = 112.15, ['y'] = -1904.67, ['z'] = 40.62 }
        }, 
    },
    ['ballasmembros'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957678584892391456/0pY8fBgacglPBOmyyiGQedVTTgFnPIdfRNq6RrD3GrtZr1U53A2zH2HlJklL74dKA6sH',
        permissions = {
            'manager.permissao',
            'lider-ballas.permissao',
            'ballas.permissao'
        },
        coords  = { 
            { ['x'] = 168.76, ['y'] = -1929.36, ['z'] = 29.14 }
        }, 
    },
    ['ballasprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957678693206093844/-fPbs1a6HFUvK2x_wO_E7cu51p5HykVQ50TKu1BK4M40F4t_n0FmUIxZ9K8VMA1jrwOE',
        permissions = {
            'manager.permissao',
            'lider-ballas.permissao',
            'ballas.permissao'
        },
        coords  = { 
            { ['x'] = 156.06, ['y'] = -1914.51, ['z'] = 29.14 }
        }, 
    },
    ----------------------------------------------------------------------------------------------------
    ---------------------------------------- VANILLA ---------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['vanillalider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957682434768535563/GIPj1RuYTIMtOTJD7PBJKCC9Em_ZHNkwpRFl31Wj1v1Pr0J9N9FU-Bof_12CD5x4VSgl',
        permissions = {
            'manager.permissao',
            'lider-vanilla.permissao'
        },
        coords  = { 
            { ['x'] = 92.67, ['y'] = -1291.99, ['z'] = 29.27 }
        }, 
    },
    ['vanilla'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957682575890071603/eW_gLwP8FNcSjf33yHFpM1OlYkgoy1EP9Uvrq38WMg81gDM5xutuJcFE7Emms0uK7EvO',
        permissions = {
            'manager.permissao',
            'lider-vanilla.permissao',
            'vanilla.permissao'
        },
        coords  = { 
            { ['x'] = 106.57, ['y'] = -1299.47, ['z'] = 28.77 }
        }, 
    },
    ['vanillaprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957682705502453800/ct4_kDeBgTaoEJ5mtIi0EO13cY302F9l7oVJcAMfFNgeirPexxo7ccjC3A9qUWXbThcf',
        permissions = {
            'manager.permissao',
            'lider-vanilla.permissao',
            'vanilla.permissao'
        },
        coords  = { 
            { ['x'] = 165.02, ['y'] = -1331.82, ['z'] = -37.66 }
        }, 
    },
    ----------------------------------------------------------------------------------------------------
    --------------------------------------- REDONDEZAS -------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['redondezaslider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957677948863926373/9DVltDHNYX4qivwVCtKlfBChxJTtVNzNAJeig5UwxisUp0C8xJkG5bwFZ0CkIipD2qCl',
        permissions = {
            'lider-redondezas.permissao',
            'manager.permissao'
        },
        coords  = { 
            { ['x'] = 1416.09, ['y'] = -797.83, ['z'] = 90.67 }
        }, 
    },
    ['redondezas'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957678164270788658/sQ3iXukg-BrkLz02ohjkHca_Uy1U101dZpF4xLV_mXdVvju0lw6Qooy8H1kVls70KwfZ',
        permissions = {
            'lider-redondezas.permissao',
            'redondezas.permissao',
            'manager.permissao'
        },
        coords  = { 
            { ['x'] = 1410.82, ['y'] = -799.41, ['z'] = 90.67 }
        }, 
    },
    ['redondezasprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957678265844236298/TK66pXlhVd-XrI2bjqDlU06TEKmIXM5x1sDlJBmSDIOBKvzPX9F8UJh0F5ej-w82rB9E',
        permissions = {
            'lider-redondezas.permissao',
            'redondezas.permissao',
            'manager.permissao'
        },
        coords  = { 
            { ['x'] = 1422.08, ['y'] = -798.3, ['z'] = 90.67 }
        }, 
    },
    ----------------------------------------------------------------------------------------------------
    ------------------------------------------ PORTO ---------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['portolider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957678811162488893/RC6-ehyufLxaLYLoisavd0YpSaMwTGv1WLiv4oAi_80zHfInacCuhWzhH44Todj44WSM',
        permissions = {
            'lider-porto.permissao',
            'manager.permissao'
        },
        coords  = { 
            { ['x'] = 562.83, ['y'] = -3121.16, ['z'] = 18.77 }
        }, 
    },
    ['porto'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957679011868336169/2b5L7cRa0zXlS-8uiNohyPGR2eMdkmkTaU4__5zsP6nZT2FVreV_piOLxfRdrLX8mFVD',
        permissions = {
            'lider-porto.permissao',
            'porto.permissao',
            'manager.permissao'
        },
        coords  = { 
            { ['x'] = 563.52, ['y'] = -3126.9, ['z'] = 18.77  }
        }, 
    },
    ['portoprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957679173818802176/CbqfK2WB__uqLX3hZEW5XqvHmXCBmqJTARiXZ3OjD4Fa-Ip4b0VJ9w6ZzgNcMXzwl6KA',
        permissions = {
            'lider-porto.permissao',
            'porto.permissao',
            'manager.permissao'
        },
        coords  = { 
            { ['x'] = 575.41, ['y'] = -3121.47, ['z'] = 18.77 }
        }, 
    },
    ----------------------------------------------------------------------------------------------------
    ------------------------------------------ NOMADES -------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['nomadslider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957681718863740969/J49CokC2xB3PIFnYydFetCC0GJLks1mX3ZRm3wpfk9X67JYXTivXVrSXq25_gRrMr1KD',
        permissions = {
            'manager.permissao',
            'lider-nomads.permissao'
        },
        coords  = { 
            { ['x'] = -1148.54, ['y'] = 4943.64, ['z'] = 222.28 }
        }, 
    },
    ['nomads'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957681831656968252/gftPz18nfTwe117H9uLzcgB7AoFrcXeIPf91HJw4-lx3fdaOcdG-GcXnPm6ywJYv_UL_',
        permissions = {
            'manager.permissao',
            'nomads.permissao',
            'lider-nomads.permissao'
        },
        coords  = { 
            { ['x'] = -1146.78, ['y'] = 4948.22, ['z'] = 222.28 }
        }, 
    },
    ['nomadsprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957681913399742525/eu0R_fPXBLOvgWkjTZqOtWcGtdWA7vVcej6iS5VnSfZ6YVsoLbo4qPnL5DG8PMPuzu7b',
        permissions = {
            'manager.permissao',
            'nomads.permissao',
            'lider-nomads.permissao'
        },
        coords  = { 
            { ['x'] = -1107.75, ['y'] = 4951.45, ['z'] = 218.3 }
        }, 
    },
    ----------------------------------------------------------------------------------------------------
    ------------------------------------------ MOTOCLUB ------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['motoclublider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = '',
        permissions = {
            'manager.permissao',
            'lider-motoclub.permissao'
        },
        coords  = { 
            { ['x'] = 986.87, ['y'] = -93.09, ['z'] = 74.85 }
        }, 
    },
    ['motoclub'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = '',
        permissions = {
            'manager.permissao',
            'lider-motoclub.permissao',
            'motoclub.permissao'
        },
        coords  = { 
            { ['x'] = 972.28, ['y'] = -97.97, ['z'] = 74.87 }
        }, 
    },
    ['motoclubprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = '',
        permissions = {
            'manager.permissao',
            'lider-motoclub.permissao',
            'motoclub.permissao'
        },
        coords  = { 
            { ['x'] = 977.13, ['y'] = -104.11, ['z'] = 74.85 }
        }, 
    },
    
        ----------------------------------------------------------------------------------------------------
    ------------------------------------------ FAZENDA ------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['fazendalider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957681118193262684/KrFw3CXuDxCxw-pNzG6LQrNzP3zct1gNIxKUVi1oSCEKXIasXJSRN2fA2EXsiq7SDM_X',
        permissions = {
            'manager.permissao',
            'lider-fazenda.permissao'
        },
        coords  = { 
            { ['x'] = 1391.58, ['y'] = 1158.79, ['z'] = 114.34 }
        }, 
    },
    ['fazenda'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957681256093593610/w2pkGaO5Hqrnk2QsEeIM2Zr8r6DHhuAO0PIToM8UBi7YsCj1KAyA0dK8ybk2eUlIm2SO',
        permissions = {
            'manager.permissao',
            'lider-fazenda.permissao',
            'fazenda.permissao'
        },
        coords  = { 
            { ['x'] = 1402.01, ['y'] = 1154.08, ['z'] = 114.34 }
        }, 
    },
    ['fazendaprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957681623921463316/huYY8-XTGcM5le0pniAtHFnNdDGOj_M3kUyzJuVE6mLtFlUKEIKk0Yr4XyZmVpZVWlZu',
        permissions = {
            'manager.permissao',
            'lider-fazenda.permissao',
            'fazenda.permissao'
        },
        coords  = { 
            { ['x'] = 1399.53, ['y'] = 1147.91, ['z'] = 108.15 }
        }, 
    },
    
            ----------------------------------------------------------------------------------------------------
    ------------------------------------------ FAZENDEIROS ------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['fazendeiroslider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957676589339013191/4giw-3G5zWw25L8tVYYi1Lx7vJu_HQcUl5a8M_9kD5fFrRhpPTA25dlp5zJfdboJE3aT',
        permissions = {
            'manager.permissao',
            'lider-fazendeiros.permissao'
        },
        coords  = { 
            { ['x'] = 1909.64, ['y'] = 5226.95, ['z'] = 92.01 }
        }, 
    },
    ['fazendeiros'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957677570617405480/iXylNSL1mcxnDNUgk-fudhQWw3zb3XzNP9hF_4pOYaW89UBXnjQupz73gCCO2nzVh_h-',
        permissions = {
            'manager.permissao',
            'lider-fazendeiros.permissao',
            'fazendeiros.permissao'
        },
        coords  = { 
            { ['x'] = 1906.08, ['y'] = 5220.97, ['z'] = 89.07 }
        }, 
    },
    ['fazendeirosprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957677787869757561/vl57_XJ5xzDvAUaidLu4pWeJ3kkpWIJ4B2crFBdUy8hTAUCf-FmGUtGaQN-ZbMNfG0D6',
        permissions = {
            'manager.permissao',
            'lider-fazendeiros.permissao',
            'fazendeiros.permissao'
        },
        coords  = { 
            { ['x'] = 1903.35, ['y'] = 5219.82, ['z'] = 89.05 }
        }, 
    },
    
    ----------------------------------------------------------------------------------------------------
    ---------------------------------------- SPEEDRACER ------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['speedracerlider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957742760444723291/J1zLgB0WrJ_V0yE5ozTKSFApDwlXujZ2IKvcmdYQrucGmOKSxR4sb7bJVeq9eY4Haswt',
        permissions = {
            'manager.permissao',
            'lider-speedracer.permissao'
        },
        coords  = { 
            { ['x'] = -1158.77, ['y'] = -2025.34, ['z'] = 13.15 }
        }, 
    },
    ['speedracermembros'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957742547659276330/6FyLORfWbWltC8Pe3uuynskYTZcIiOgbDYfEip4zQNliL54KSfYsiDDpDwut1y6wE1jU',
        permissions = {
            'manager.permissao',
            'lider-speedracer.permissao',
            'speedracer.permissao'
        },
        coords  = { 
            { ['x'] = -1155.01, ['y'] = -2022.95, ['z'] = 13.18 }
        }, 
    },
    ['speedracerprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957742917429129236/zbtk0lJ_BF8ajNGcVcu0DJXZVNL0Zew7w1-5BA2GDErCwJXkwPiteCpxS6RKa9UnSBGw',
        permissions = {
            'manager.permissao',
            'lider-speedracer.permissao',
            'speedracer.permissao'
        },
        coords  = { 
            { ['x'] = -1141.32, ['y'] = -2005.25, ['z'] = 13.19 }
        }, 
    },
    ----------------------------------------------------------------------------------------------------
    ---------------------------------------- FLIPERAMA ------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['fliperamalider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957682789099134996/_tnUsgZpU-dyYloqpYjoRZPwEb6KI66h7tOFGKLaAG9qnMNa_V8XlvuI-ENuIt10IaqV',
        permissions = {
            'manager.permissao',
            'lider-fliperama.permissao'
        },
        coords  = { 
            { ['x'] = 741.53, ['y'] = -811.13, ['z'] = 24.28 }
        }, 
    },
    ['fliperamamembros'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957742336388001812/SG2cyrycyFtEDPSTgOxhPgb8TDfS_vvyGKuHYiFMSslWe4De13J_wI9ZaIoJQ1YHt74u',
        permissions = {
            'manager.permissao',
            'lider-fliperama.permissao',
            'fliperama.permissao'
        },
        coords  = { 
            { ['x'] = 703.64, ['y'] = -790.9, ['z'] = 16.48 }
        }, 
    },
    ['fliperamaprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957742454025625710/G67cXUDSSHBZN1ZCdyYyPUqaR9pcYurmFukWHYn9mDijhDcU1NoQUCOM8Q3htPHnJgcf',
        permissions = {
            'manager.permissao',
            'lider-fliperama.permissao',
            'fliperama.permissao'
        },
        coords  = { 
            { ['x'] = 709.96, ['y'] = -789.33, ['z'] = 16.48 }
        }, 
    },
    ----------------------------------------------------------------------------------------------------
    ----------------------------------------- CASSINO --------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['cassinolider'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957682044245262396/nU1uj2hBTVA3U0aaN0EdHTYKj_QfqDZ--gGbY8i7GoZGbMArfDhoB-ccAhWIrFhPf0vT',
        permissions = {
            'manager.permissao',
            'lider-cassino.permissao'
        },
        coords  = { 
            { ['x'] = 958.08, ['y'] = 63.68, ['z'] = 75.44 }
        }, 
    },
    ['cassinomembros'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957682186310516886/-SunKALpS6eTEvw9SMlsywiE9MGNsxPzMa08ppF_jsGk9sJa08_fFQ2cufTClh7Yjvfz',
        permissions = {
            'manager.permissao',
            'lider-cassino.permissao',
            'cassino.permissao'
        },
        coords  = { 
            { ['x'] = 951.52, ['y'] = 30.46, ['z'] = 71.84 }
        }, 
    },
    ['cassinoprodutos'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = 'https://discord.com/api/webhooks/957682289662373888/kDgElmfwPlf75DbGVFpdfgzFZ7voH8gwRrG7FQxpaKQVdyyt76cZwPI8CXpD9abc62-1',
        permissions = {
            'manager.permissao',
            'lider-cassino.permissao',
            'cassino.permissao'
        },
        coords  = { 
            { ['x'] = 970.91, ['y'] = 42.87, ['z'] = 116.17 }
        }, 
    },
    ----------------------------------------------------------------------------------------------------
    ------------------------------------------ MOTOCLUB ------------------------------------------------
    ----------------------------------------------------------------------------------------------------
    ['police-one'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = '',
        permissions = {
            'policia.permissao'
        },
        coords  = { 
            { ['x'] = -1098.8, ['y'] = -825.99, ['z'] = 14.29 }
        }, 
    },
    ['police-two'] = {
        weight      = 5000,
        slots       = 500,
        webhook     = '',
        permissions = {
            'policia.permissao'
        },
        coords  = { 
            { ['x'] = -1086.6, ['y'] = -822.91, ['z'] = 11.04 }
        }, 
    }
}

config.homes = {
    slots   = 100,
    webhook = ""
}

config.slots = {
    [20] = { -- 6KG
        slots = 10
    },
    [670] = { -- 51KG
        slots = 30
    },
    [1320] = { -- 300KG
        slots = 50
    },
    [1900] = { -- 90KG
        slots = 80
    },
    ['vip'] = { -- vip
        slots = 100
    }
}

config.dropSystem = 1 -- 1 (drop item on the floor) | 2 (throw item away in recycle bins) | 3 delete item

config.propTrashCans = {
    'prop_bin_01a',
    'prop_bin_03a',
    'prop_bin_05a',
    'prop_dumpster_01a',
    'prop_dumpster_02a',
    'prop_dumpster_02b',
    'prop_dumpster_4a',
    'prop_dumpster_4b'
}

config.drawmarker = {
    blip     = 27,
    colorrgb = {204,0,0},
    rotate   = true
}

config.inspect = {
    webhookInspect = '',
    webhookSend    = '',
    webhookTake    = '',
    command        = 'revistar',
    inspectAnim    = { 'oddjobs@shop_robbery@rob_till', 'loop' },
    nuInspectAnim  = { 'random@arrests@busted', 'idle_a' },
}

config.plunder = {
    webhookPlunder = '',
    webhookSend    = '',
    webhookTake    = '',
    command        = 'saquear',
    plunderAnim    = { 'amb@medic@standing@tendtodead@idle_a', 'idle_a' },
}

config.trade = {
    active       = true,
    command      = 'negociar',
    money        = true,
    webhookTrade = ''
}

config.adrenalinacoords = {
	{ 1978.76,5171.11,47.64 },
	{ 707.86,4183.95,40.71 },
	{ 436.64,6462.23,28.300 },
	{ -2173.5,4291.73,49.04 }
}

config.webhookUnequip  = "https://discord.com/api/webhooks/960614901171245086/eQYECVLvKlfEhZ0gyzyAik2ME6tajyDL3rlxKMC999aajCbkdJTvLomlSYfTqiTj86ny"
config.webhookDropItem = "https://discord.com/api/webhooks/960614901171245086/eQYECVLvKlfEhZ0gyzyAik2ME6tajyDL3rlxKMC999aajCbkdJTvLomlSYfTqiTj86ny"
config.webhookTakeDrop = "https://discord.com/api/webhooks/960614901171245086/eQYECVLvKlfEhZ0gyzyAik2ME6tajyDL3rlxKMC999aajCbkdJTvLomlSYfTqiTj86ny"
config.webhookSendItem = "https://discord.com/api/webhooks/960614901171245086/eQYECVLvKlfEhZ0gyzyAik2ME6tajyDL3rlxKMC999aajCbkdJTvLomlSYfTqiTj86ny"
config.webhookTrunk    = "https://discord.com/api/webhooks/960614901171245086/eQYECVLvKlfEhZ0gyzyAik2ME6tajyDL3rlxKMC999aajCbkdJTvLomlSYfTqiTj86ny"

config.webhookIcon = 'https://cdn.discordapp.com/attachments/958937174840061972/960611600853782528/log.png'
config.webhookBottomText = 'Alife Roleplay - '
config.webhookColor = 16431885

return config
