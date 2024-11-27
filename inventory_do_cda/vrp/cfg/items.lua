items = {}

items.list = {
	['mochilap'] = { index = 'mochilap', name = 'Mochila P', type = 'use', weight = 0.5 },
	['mochilam'] = { index = 'mochilam', name = 'Mochila M', type = 'use', weight = 0.5 },
	['mochilag'] = { index = 'mochilag', name = 'Mochila G', type = 'use', weight = 0.5 },

	['plano-one'] = { index = 'plano-one', name = 'Plano 1', type = 'use', weight = 0.5 },
	['plano-three'] = { index = 'plano-three', name = 'Plano 3', type = 'use', weight = 0.5 },
	['plano-five'] = { index = 'plano-five', name = 'Plano 5', type = 'use', weight = 0.5 },
	['plano-ten'] = { index = 'plano-ten', name = 'Plano 10', type = 'use', weight = 0.5 },

	['celular'] = { index = 'celular', tipo = "Usável", name = 'Celular', desc = "Celular funcionando", type = 'use', weight = 0.5 },
	['celular-descarregado'] = { index = 'celular-descarregado', tipo = "Comum", name = 'Celular Descarregado', desc = 'Celular sem bateria', type = 'use', weight = 0.5, economy = "S/E" },
	['celular-pro'] = { index = 'celular-pro', name = 'iFruit XII', type = 'use', weight = 0.5 },
	['jbl'] = { index = 'jbl', name = 'JBL', type = 'use', weight = 0.5 },
	['calculadora'] = { index = 'calculadora', name = 'Calculadora', type = 'use', weight = 0.5 },
	['tablet'] = { index = 'tablet', name = 'Tablet', type = 'use', weight = 0.5 },
	['notebook'] = { index = 'notebook', name = 'Notebook', type = 'use', weight = 0.5 },
	['controleremoto'] = { index = 'controleremoto', name = 'Controle remoto', type = 'use', weight = 0.5 },
	['baterias'] = { index = 'baterias', name = 'Baterias', type = 'use', weight = 0.5 },
	['bateria-celular'] = { index = 'bateria-celular', name = 'Bateria de Celular', economy = "500", tipo = "Comum", type = 'use', weight = 0.5 },
	['radio'] = { index = 'radio', name = 'WalkTalk', type = 'use', weight = 0.5 },
	['chapeu'] = { index = 'chapeu', name = 'Chapeu', type = 'use', weight = 0.5 },
	['mascara'] = { index = 'mascara', name = 'Mascara', type = 'use', weight = 0.5 },
	['oculos'] = { index = 'oculos', name = 'Óculos', type = 'use', weight = 0.5 },
	['roupas'] = { index = 'roupas', name = 'Roupas', type = 'use', weight = 1.5 },
	['passaporte'] = { index = 'passaporte', name = 'Passaporte', type = 'use', weight = 0.5 },
	['portearmas'] = { index = 'portearmas', name = 'Porte de Armas', type = 'use', weight = 0.5 },
	['identidade'] = { index = 'identidade', name = 'Identidade', type = 'use', weight = 0.5 },
	['cnh'] = { index = 'cnh', name = 'CNH', type = 'use', weight = 0.5 },
	['colete'] = { index = 'colete', name = 'Colete Balístico', type = 'use', weight = 0.5 },
	['repairkit'] = { index = 'repairkit', name = 'Kit de Reparos', type = 'use', weight = 0.5 },
	['dinheiro'] = { index = 'dinheiro', name = 'Dinheiro', type = 'use', weight = 0.00001 },
	['cartao-debito'] = { index = 'cartao-debito', name = 'Cartão de débito', type = 'use', weight = 0.05 },
	['maquininha'] = { index = 'maquininha', name = 'Maquininha', type = 'use', weight = 0.5 },
	['paninho'] = { index = 'paninho', name = 'Pano de Microfibra', type = 'use', weight = 0.5 },
	['carrinho'] = { index = 'carrinho', name = 'Carrinho', type = 'use', weight = 0.5 },

	['camisinha'] = { index = 'camisinha', name = 'Camisinha', type = 'use', weight = 0.5 },
	['vibrador'] = { index = 'vibrador', name = 'Vibrador', type = 'use', weight = 0.5 },
	['kit'] = { index = 'kit', name = 'Kit de Sex Shop', type = 'use', weight = 0.5 },

	--[ Illegal Utilities ]--------------------------------------------------------------------------------------------

	['dinheiro-sujo'] = { index = 'dinheiro-sujo', name = 'Dinheiro Sujo', type = 'use', weight = 0.00001 },
	['algema'] = { index = 'algema', name = 'Algema', type = 'use', weight = 0.5 },
	['lockpick'] = { index = 'lockpick', name = 'Lockpick', type = 'use', weight = 0.5 },
	['cordas'] = { ['index'] = 'cordas', ['name'] = 'Cordas', ['type'] = 'use', ['weight'] = 0.5 },
	['capuz'] = { index = 'capuz', name = 'Capuz', type = 'use', weight = 0.5 },
	['placa'] = { index = 'placa', name = 'Placa', type = 'use', weight = 0.5 },
	['plastico'] = { index = 'plastico', name = 'Plastico', type = 'use', weight = 0.1 },
	['cartaoazul'] = { index = 'cartaoazul', name = 'Cartão Azul', type = 'use', weight = 0.05, desc = "Usado para roubar a joalheria" },
	['cartaovermelho'] = { index = 'cartaovermelho', name = 'Cartão Vermelho', type = 'use', weight = 0.05, desc = "Usado para roubar bancos Flecca" },
	['cartaopreto'] = { index = 'cartaopreto', name = 'Cartão Preto', type = 'use', weight = 0.05, desc = "Usado para roubar o banco central e o banco de paleto" },

	--[ Vips ] --------------------------------------------------------------------------------------------------------
	['cartaovipprata'] = { index = 'cartaovipprata', name = 'Cartão Vip Prata', type = 'use', weight = 0.05, desc = "Não perde mochila, 30% de prioridade na fila, 3.000 de salário" },
	['cartaovipouro'] = { index = 'cartaovipouro', name = 'Cartão Vip Ouro', type = 'use', weight = 0.05, desc = "Não perde mochila, 50% de prioridade na fila, 3.500 de salário" },
	['cartaovipplatina'] = { index = 'cartaovipplatina', name = 'Cartão Vip Platina', type = 'use', weight = 0.05, desc = "Não perde mochila, acesso ao som automotivo, 70% de prioridade na fila, 4.500 de salário" },
	['cartaovipdiamante'] = { index = 'cartaovipdiamante', name = 'Cartão Vip Diamante', type = 'use', weight = 0.05, desc = "Não perde mochila, acesso ao som automotivo, 90% de prioridade na fila, 5.500 de salário" },
	
	--[ Tools ] -------------------------------------------------------------------------------------------------------
	
	['serra'] = { index = 'serra', name = 'Serra', type = 'use', weight = 0.5 },
	['furadeira'] = { index = 'furadeira', name = 'Furadeira', type = 'use', weight = 0.5 },
	['pa-jardinagem'] = { index = 'pa-jardinagem', name = 'Pá de Jardinagem', type = 'use', weight = 0.5 },
	['chavedefenda'] = { ['index'] = 'chavedefenda', ['name'] = 'Chave de Fenda', ['type'] = 'use', ['weight'] = 0.5 },

	--[ Miscs ]-------------------------------------------------------------------------------------------------------- 

	['garrafa-vazia'] = { index = 'garrafa-vazia', name = 'Garrafa vazia', economy = "100", tipo = "Comum", type = 'use', weight = 0.5 },
	['ponta-britadeira'] = { index = 'ponta-britadeira', name = 'Ponta de britadeira', economy = "100", tipo = "Comum", type = 'use', weight = 0.5 },
	['fogos-artificio'] = { index = 'fogos-artificio', name = 'Fogos de Artificio', economy = "100", tipo = "Usável", type = 'use', weight = 0.5 },
	['ursinho'] = { index = 'ursinho', name = 'Ursinho', economy = "100", tipo = "Usável", type = 'use', weight = 0.5 },
	['rosa'] = { index = 'rosa', name = 'Rosa', economy = "100", tipo = "Usável", type = 'use', weight = 0.5 },
	['narguile'] = { index = 'narguile', name = 'Narguile', economy = "10000", tipo = "Usável", type = 'use', weight = 0.5 },
	['skate'] = { index = 'skate', name = 'Skate', economy = "2000", tipo = "Usável", type = 'use', weight = 1.0, max = 1 },

	--[ Miner Work ]-------------------------------------------------------------------------------------------------------- 

	['minerio-diamante'] = { index = 'minerio-diamante', name = 'Minerio de Diamante', type = 'use', weight = 0.8 },
	['minerio-ouro'] = { index = 'minerio-ouro', name = 'Minerio de Ouro', type = 'use', weight = 0.8 },
	['minerio-prata'] = { index = 'minerio-prata', name = 'Minerio de Prata', type = 'use', weight = 0.8 },
	['minerio-ferro'] = { index = 'minerio-ferro', name = 'Minerio de Ferro', type = 'use', weight = 0.8 },


	['diamante'] = { index = 'diamante', name = 'Diamante Bruto', type = 'use', weight = 2.0 },
	['barra-ouro'] = { index = 'barra-ouro', name = 'Barra de Ouro', type = 'use', weight = 1.2 },
	['barra-prata'] = { index = 'barra-prata', name = 'Barra de Prata', type = 'use', weight = 1.2 },
	['barra-ferro'] = { index = 'barra-ferro', name = 'Barra de Ferro', type = 'use', weight = 1.2 },

	--[ Drinks ]-------------------------------------------------------------------------------------------------------
	
	['agua'] = { index = 'agua', name = 'Água', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, notchest = true },
	['leite'] = { index = 'leite', name = 'Leite', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="leite-estragado", notchest = true },
	['cafe'] = { index = 'cafe', name = 'Café', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="cafe-estragado", notchest = true },
	['cafecleite'] = { index = 'cafecleite', name = 'Café com Leite', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="cafecleite-estragado", notchest = true },
	['cafeexpresso'] = { index = 'cafeexpresso', name = 'Café Expresso', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="cafeexpresso-estragado", notchest = true },
	['capuccino'] = { index = 'capuccino', name = 'Capuccino', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="capuccino-estragado", notchest = true },
	['frappuccino'] = { index = 'frappuccino', name = 'Frapuccino', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="frappuccino-estragado", notchest = true },
	['cha'] = { index = 'cha', name = 'Chá', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="cha-estragado", notchest = true },
	['icecha'] = { index = 'icecha', name = 'Chá Gelado', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="icecha-estragado", notchest = true },
	['sprunk'] = { index = 'sprunk', name = 'Sprunk', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="sprunk-estragada", notchest = true },
	['cola'] = { index = 'cola', name = 'Cola', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="cola-estragada", notchest = true },
	['energetico'] = { index = 'energetico', name = 'Energético', type = 'use', weight = 0.25, tipo = "Usável", economy = "900" },

	--[ Spoiled Drinks ]------------------------------------------------------------------------------------------------
	
	['leite-estragado'] = { index = 'leite-estragado', name = 'Leite Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['cafe-estragado'] = { index = 'cafe-estragado', name = 'Café Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['cafecleite-estragado'] = { index = 'cafecleite-estragado', name = 'Café com Leite Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['cafeexpresso-estragado'] = { index = 'cafeexpresso-estragado', name = 'Café Expresso Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['capuccino-estragado'] = { index = 'capuccino-estragado', name = 'Capuccino Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['frappuccino-estragado'] = { index = 'frappuccino-estragado', name = 'Frapuccino Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['cha-estragado'] = { index = 'cha-estragado', name = 'Chá Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['icecha-estragado'] = { index = 'icecha-estragado', name = 'Chá Gelado Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['sprunk-estragrada'] = { index = 'sprunk-estragrada', name = 'Sprunk Estragada', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['cola-estragrada'] = { index = 'cola-estragrada', name = 'Cola Estragada', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	
	--[ Alcoholic Beverages ]------------------------------------------------------------------------------------------
	
	['pibwassen'] = { index = 'pibwassen', name = 'PibWassen', type = 'use', weight = 0.5 },
	['tequilya'] = { index = 'tequilya', name = 'Tequilya', type = 'use', weight = 0.5 },
	['patriot'] = { index = 'patriot', name = 'Patriot', type = 'use', weight = 0.5 },
	['blarneys'] = { index = 'blarneys', name = 'Blarneys', type = 'use', weight = 0.5 },
	['jakeys'] = { index = 'jakeys', name = 'Jakeys', type = 'use', weight = 0.5 },
	['barracho'] = { index = 'barracho', name = 'Barracho', type = 'use', weight = 0.5 },
	['ragga'] = { index = 'ragga', name = 'Ragga', type = 'use', weight = 0.5 },
	['nogo'] = { index = 'nogo', name = 'Nogo', type = 'use', weight = 0.5 },
	['mount'] = { index = 'mount', name = 'Mount', type = 'use', weight = 0.5 },
	['cherenkov'] = { index = 'cherenkov', name = 'Cherenkov', type = 'use', weight = 0.5 },
	['bourgeoix'] = { index = 'bourgeoix', name = 'Bourgeoix', type = 'use', weight = 0.5 },
	['bleuterd'] = { index = 'bleuterd', name = 'Bleuterd', type = 'use', weight = 0.5 },
	
	--[ FastFoods ]----------------------------------------------------------------------------------------------------
	
	['sanduiche'] = { index = 'sanduiche', name = 'Sanduíche', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="sanduiche-estragado", notchest = true },
	['rosquinha'] = { index = 'rosquinha', name = 'Rosquinha', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="rosquinha-estragada", notchest = true },
	['hotdog'] = { index = 'hotdog', name = 'HotDog', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="hotdog-estragado", notchest = true },
	['xburguer'] = { index = 'xburguer', name = 'xBurguer', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="xburguer-estragado", notchest = true },
	['chips'] = { index = 'chips', name = 'Batata Chips', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="chips-estragada", notchest = true },
	['batataf'] = { index = 'batataf', name = 'Batata Frita', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="batataf-estragada", notchest = true },
	['pizza'] = { index = 'pizza', name = 'Pedaço de Pizza', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="pizza-estragada", notchest = true },
	['frango'] = { index = 'frango', name = 'Frango Frito', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="frango-estragado", notchest = true },
	['bcereal'] = { index = 'bcereal', name = 'Barra de Cereal', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="bcereal-estragada", notchest = true },
	['bchocolate'] = { index = 'bchocolate', name = 'Barra de Chocolate', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="bchocolate-estragado", notchest = true },
	['taco'] = { index = 'taco', name = 'Taco', type = 'use', weight = 0.25, tipo = "Usável", economy = "900", max = 5, durability = 18000000, transform="taco-estragado", notchest = true },
	
	--[ spoiled food ]--------------------------------------------------------------------------------------------------
	['sanduiche-estragado'] = { index = 'sanduiche-estragado', name = 'Sanduíche Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['rosquinha-estragada'] = { index = 'rosquinha-estragada', name = 'Rosquinha Estragada', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['hotdog-estragado'] = { index = 'hotdog-estragado', name = 'HotDog Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['xburguer-estragado'] = { index = 'xburgue-estragador', name = 'xBurguer Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['chips-estragada'] = { index = 'chips-estragada', name = 'Batata Chips Estragada', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['batataf-estragada'] = { index = 'batataf-estragada', name = 'Batata Frita Estragada', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['pizza-estragada'] = { index = 'pizza-estragada', name = 'Pedaço de Pizza Estragada', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['frango-estragado'] = { index = 'frango-estragado', name = 'Frango Frito Estragado', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['bcereal-estragada'] = { index = 'bcereal-estragada', name = 'Barra de Cereal Estragada', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['bchocolate-estragada'] = { index = 'bchocolate-estragada', name = 'Barra de Chocolate Estragada', type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	['taco-estragado'] = { index = 'taco-estragado', name = 'Taco Estragado', type = 'use', weight = 0.25, type = 'use', weight = 0.25, tipo = "Comum", economy = "S/E" },
	
	--[ Drugs ]--------------------------------------------------------------------------------------------------------
	
	['paracetamil'] = { index = 'paracetamil', name = 'Paracetamil', type = 'use', weight = 0.5 },
	['voltarom'] = { index = 'voltarom', name = 'Voltarom', type = 'use', weight = 0.5 },
	['trandrylux'] = { index = 'trandrylux', name = 'Trandrylux', type = 'use', weight = 0.5 },
	['dorfrex'] = { index = 'dorfrex', name = 'Dorfrex', type = 'use', weight = 0.5 },
	['buscopom'] = { index = 'buscopom', name = 'Buscopom', type = 'use', weight = 0.5 },
	
	--[ Prescription ]-------------------------------------------------------------------------------------------------
	
	['r-paracetamil'] = { index = 'r-paracetamil', name = 'Receituário Paracetamil', type = 'use', weight = 0.5 },
	['r-voltarom'] = { index = 'r-voltarom', name = 'Receituário Voltarom', type = 'use', weight = 0.5 },
	['r-trandrylux'] = { index = 'r-trandrylux', name = 'Receituário Trandrylux', type = 'use', weight = 0.5 },
	['r-dorfrex'] = { index = 'r-dorfrex', name = 'Receituário Dorfrex', type = 'use', weight = 0.5 },
	['r-buscopom'] = { index = 'r-buscopom', name = 'Receituário Buscopom', type = 'use', weight = 0.5 },
	['headblock'] = { index = 'headblock', name = 'Headblock', type = 'use', weight = 0.1 },
	['gesso'] = { index = 'gesso', name = 'Gesso', type = 'use', weight = 0.1 },
	['cinta'] = { index = 'cinta', name = 'Cinta', type = 'use', weight = 0.1 },
	['bandagem'] = { index = 'bandagem', name = 'Bandagem', type = 'use', weight = 0.1 },
	--[ By-product ][ Methamphetamine production ]---------------------------------------------------------------------

	['metanfetamina'] = { index = 'metanfetamina', name = 'Metanfetamina', type = 'use', weight = 0.5 },
	['composito'] = { index = 'composito', name = 'Compósito', type = 'use', weight = 0.5 },

	--[ Miscellaneous ][ Methamphetamine production ]------------------------------------------------------------------
	
	['nitrato-amonia'] = { index = 'nitrato-amonia', name = 'Nitrato de Amônia', type = 'use', weight = 0.5 },
	['hidroxido-sodio'] = { index = 'hidroxido-sodio', name = 'Hidróxido de Sódio', type = 'use', weight = 0.5 },
	['pseudoefedrina'] = { index = 'pseudoefedrina', name = 'Pseudoefedrina', type = 'use', weight = 0.5 },
	['eter'] = { index = 'eter', name = 'Éter', type = 'use', weight = 0.5 },
	
	--[ By-product ][ Fliperama production ]-----------------------------------------------------------------------------
	
	['chipeletronico'] = { index = 'chipeletronico', name = 'Chip Eletrônico', type = 'use', weight = 0.5 },
	['marcatexto'] = { index = 'marcatexto', name = 'Marca Texto', type = 'use', weight = 0.5 },

	--[ By-product ][ Cocaine production ]-----------------------------------------------------------------------------

	['cocaina'] = { index = 'cocaina', name = 'Cocaína', type = 'use', weight = 0.5 },
	['pasta-base'] = { index = 'pasta-base', name = 'Pasta Base', type = 'use', weight = 0.5 },

	--[ By-product ][ LSD production ]---------------------------------------------------------------------------------

	['lsd'] = { index = 'lsd', name = 'LSD', type = 'use', weight = 0.5 },
	['ergolina'] = { index = 'ergolina', name = 'Quimico Ergolina', type = 'use', weight = 0.5 },

	--[ Miscellaneous ][ Cocaine production ]--------------------------------------------------------------------------

	['acido-sulfurico'] = { index = 'acido-sulfurico', name = 'Ácido Sulfúrico', type = 'use', weight = 0.5 },
	['folhas-coca'] = { index = 'folhas-coca', name = 'Folhas de Coca', type = 'use', weight = 0.5 },
	['calcio-po'] = { index = 'calcio-po', name = 'Cálcio em Pó', type = 'use', weight = 0.5 },
	['querosene'] = { index = 'querosene', name = 'Querosene', type = 'use', weight = 0.5 },
	
	--[ By-product ][ Marijuana production ]-----------------------------------------------------------------------------

	['maconha'] = { ['index'] = 'maconha', ['name'] = 'Maconha', ['type'] = 'use', ['weight'] = 0.5 },
	
	--[ By-product ][ Ilegal Race ]--------------------------------------------------------------------------------------

	['ticket-corrida'] = { ['index'] = 'ticket-corrida', ['name'] = 'Ticket de Corrida', ['type'] = 'use', ['weight'] = 0.5 },

	--[ Miscellaneous ][ Marijuana production ]--------------------------------------------------------------------------

	['adubo'] = { ['index'] = 'adubo', ['name'] = 'Adubo', ['type'] = 'use', ['weight'] = 0.5 },
	['folhas-cannabis'] = { ['index'] = 'folhas-cannabis', ['name'] = 'Folhas de Cannabis', ['type'] = 'use', ['weight'] = 0.5 },

	--[ Miscellaneous ][ Lavagem production ]--------------------------------------------------------------------------

	['alvejante'] = { ['index'] = 'alvejante', ['name'] = 'Alvejante', ['type'] = 'use', ['weight'] = 0.1 },
	['borrifador'] = { ['index'] = 'borrifador', ['name'] = 'Borrifador', ['type'] = 'use', ['weight'] = 0.1 },

	--[ Miscellaneous ][ Illegall production ]--------------------------------------------------------------------------

	['kevlar'] = { ['index'] = 'kevlar', ['name'] = 'Kevlar', ['type'] = 'use', ['weight'] = 0.5 },
	['fibradearamida'] = { ['index'] = 'fibradearamida', ['name'] = 'Fibra de Aramida', ['type'] = 'use', ['weight'] = 0.5 },
	['nailon'] = { ['index'] = 'nailon', ['name'] = 'Nailon', ['type'] = 'use', ['weight'] = 0.5 },
	['placasdeaco'] = { ['index'] = 'placasdeaco', ['name'] = 'Placas de Aço', ['type'] = 'use', ['weight'] = 0.5 },
	['taurina'] = { ['index'] = 'taurina', ['name'] = 'Taurina', ['type'] = 'use', ['weight'] = 0.5 },
	['cafeina'] = { ['index'] = 'cafeina', ['name'] = 'Cafeína', ['type'] = 'use', ['weight'] = 0.5 },
	['citratodesodio'] = { ['index'] = 'citratodesodio', ['name'] = 'Citrato de Sódio', ['type'] = 'use', ['weight'] = 0.5 },
	['gascarbonico'] = { ['index'] = 'gascarbonico', ['name'] = 'Gás Carbônico', ['type'] = 'use', ['weight'] = 0.5 },
	['couro'] = { ['index'] = 'couro', ['name'] = 'Couro', ['type'] = 'use', ['weight'] = 0.5 },
	['eletronicos'] = { ['index'] = 'eletronicos', ['name'] = 'Eletrônicos', ['type'] = 'use', ['weight'] = 0.5 },
	['fitaisolante'] = { ['index'] = 'fitaisolante', ['name'] = 'Fita Isolante', ['type'] = 'use', ['weight'] = 0.5 },
	['folha-papel'] = { ['index'] = 'folha-papel', ['name'] = 'Fita Papel', ['type'] = 'use', ['weight'] = 0.5 },
	['carimbo'] = { ['index'] = 'carimbo', ['name'] = 'Carimbo', ['type'] = 'use', ['weight'] = 0.5 },
	
	--[ Weapons body ][ Weapons Production ]---------------------------------------------------------------------------
	
	['corpo-fuzil'] = { ['index'] = 'corpo-fuzil', ['name'] = 'Corpo de Fuzil', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-sub'] = { ['index'] = 'corpo-sub', ['name'] = 'Corpo de SUB', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-pistola'] = { ['index'] = 'corpo-pistola', ['name'] = 'Corpo de Pistola', ['type'] = 'use', ['weight'] = 0.1 },

	['corpo-ak47'] = { ['index'] = 'corpo-ak47', ['name'] = 'Corpo de AK-47', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-aks74u'] = { ['index'] = 'corpo-aks74u', ['name'] = 'Corpo de AKS', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-glock'] = { ['index'] = 'corpo-glock', ['name'] = 'Corpo de Glock', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-magnum'] = { ['index'] = 'corpo-magnum', ['name'] = 'Corpo de Magnum', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-uzi'] = { ['index'] = 'corpo-uzi', ['name'] = 'Corpo de Uzi', ['type'] = 'use', ['weight'] = 0.1 },
	
	['corpo-fiveseven'] = { ['index'] = 'corpo-fiveseven', ['name'] = 'Corpo de FiveSeven', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-wide1911'] = { ['index'] = 'corpo-wide1911', ['name'] = 'Corpo de Wide 1911', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-mp5x'] = { ['index'] = 'corpo-mp5x', ['name'] = 'Corpo de MP5-X', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-mtar'] = { ['index'] = 'corpo-mtar', ['name'] = 'Corpo de MTAR', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-doze'] = { ['index'] = 'corpo-doze', ['name'] = 'Corpo de Doze', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-doze-canocurto'] = { ['index'] = 'corpo-doze-canocurto', ['name'] = 'Corpo de Doze Cano Curto', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-g36'] = { ['index'] = 'corpo-g36', ['name'] = 'Corpo de G36-X', ['type'] = 'use', ['weight'] = 0.1 },
	['corpo-hk'] = { ['index'] = 'corpo-hk', ['name'] = 'Corpo de HK', ['type'] = 'use', ['weight'] = 0.1 },


	--[ Miscellaneous ][ Weapons Production ]--------------------------------------------------------------------------
	
	['molas'] = { index = 'molas', name = 'Molas', type = 'use', weight = 0.1 },
	['placa-metal'] = { index = 'placa-metal', name = 'Placa de Metal', type = 'use', weight = 0.1 },
	['gatilho'] = { index = 'gatilho', name = 'Gatilho', type = 'use', weight = 0.1 },
	['capsulas'] = { index = 'capsulas', name = 'Capsulas', type = 'use', weight = 0.5 },
	['polvora'] = { index = 'polvora', name = 'Polvora', type = 'use', weight = 0.5 },

	--[ Emprego ][ Leiteiro ]------------------------------------------------------------------------------------------

	['garrafa-leite'] = { index = 'garrafa-leite', name = 'Garrafa com Leite', type = 'use', weight = 0.5 },

	--[ Emprego ][ Pescador ]------------------------------------------------------------------------------------------

	['isca'] = { index = 'isca', name = 'Iscas de Pesca', type = 'use', weight = 0.5 },

	--[ Emprego ][ Lenhador ]------------------------------------------------------------------------------------------

	['tora'] = { index = 'tora', name = 'Tora de Madeira', type = 'use', weight = 0.5 },

	--[ Emprego ][ Lixeiro ]------------------------------------------------------------------------------------------

	['saco-lixo'] = {index = 'saco-lixo', name = 'Saco de Lixo', type = 'use', weight = 0.5 },

	--[ Emprego ][ Carteiro ]------------------------------------------------------------------------------------------

	['encomenda'] = { index = 'encomenda', name = 'Encomenda', type = 'use', weight = 0.5 },
	['caixa-vazia'] = { index = 'caixa-vazia', name = 'Caixa Vazia', type = 'use', weight = 0.5 },

	--[ Emprego ][ Transporter ]------------------------------------------------------------------------------------------

	['malote'] = { index = 'malote', name = 'Malote de Dinheiro', type = 'use', weight = 0.5 },

	--[ Emprego ][ Farmer ]------------------------------------------------------------------------------------------

	['semente-marijuana'] = { index = 'semente-maconha', name = 'Sementes Genericas', type = 'use', weight = 0.5 },
	['semente-blueberry'] = { index = 'semente-blueberry', name = 'Sementes de Blueberry', type = 'use', weight = 0.5 },
	['semente-tomate'] = { index = 'semente-tomate', name = 'Semente de Tomate', type = 'use', weight = 0.5 },
	['semente-laranja'] = { index = 'semente-laranja', name = 'Semente de Laranja', type = 'use', weight = 0.5 },
	
	['laranja'] = { index = 'laranja', name = 'Laranja', type = 'use', weight = 0.5 },
	['tomate'] = { index = 'tomate', name = 'Tomate', type = 'use', weight = 0.5 },
	['blueberry'] = { index = 'blueberry', name = 'Blueberry', type = 'use', weight = 0.5 },

	['graosimpuros'] = { index = 'graosimpuros', name = 'Graos Impuros', type = 'use', weight = 0.5 },
	['graos'] = { index = 'graos', name = 'Graos', type = 'use', weight = 0.5 },

	--[ Desmanche ]------------------------------------------------------------------------------------------

	['transmissao'] = { index = 'transmissao', name = 'Transmissao', type = 'use', weight = 0.5 },
	['suspensao'] = { index = 'suspensao', name = 'Suspensao', type = 'use', weight = 0.5 },
	['portas'] = { index = 'portas', name = 'Portas', type = 'use', weight = 0.5 },
	['borrachas'] = { index = 'borrachas', name = 'Borrachas', type = 'use', weight = 0.5 },
	['pneus'] = { index = 'pneus', name = 'Pneus', type = 'use', weight = 0.5 },
	['capo'] = { index = 'capo', name = 'Capo', type = 'use', weight = 0.5 },
	['bateria-carro'] = { index = 'bateria-carro', name = 'Bateria de Carro', type = 'use', weight = 0.5 },
	['motor'] = { index = 'motor', name = 'Motor', type = 'use', weight = 0.5 },

	--[ Itens danificados ]--------------------------------------------------------------------------------------------

	['celular-queimado'] = { index = 'celular-queimado', name = 'Celular queimado', type = 'use', weight = 0.5 },
	['jbl-queimada'] = { index = 'jbl-queimada', name = 'JBL queimada', type = 'use', weight = 0.5 },
	['calculadora-queimada'] = { index = 'calculadora-queimada', name = 'Calculadora queimada', type = 'use', weight = 0.5 },
	['tablet-queimado'] = { index = 'tablet-queimado', name = 'Tablet queimado', type = 'use', weight = 0.5 },
	['notebook-queimado'] = { index = 'notebook-queimado', name = 'Notebook queimado', type = 'use', weight = 0.5 },
	['controleremoto-queimado'] = { index = 'controleremoto-queimado', name = 'Controle remoto queimado', type = 'use', weight = 0.5 },
	['baterias-queimadas'] = { index = 'baterias-queimadas', name = 'Baterias queimadas', type = 'use', weight = 0.5 },
	['radio-queimado'] = { index = 'radio-queimado', name = 'Rádio queimado', type = 'use', weight = 0.5 },
	['maquininha-queimada'] = { index = 'maquininha-queimada', name = 'Maquininha queimada', type = 'use', weight = 0.5 },

	--[ Weapons ][ Melee]----------------------------------------------------------------------------------------------

	['wbodyWEAPON_DAGGER'] = { index = 'adaga', name = 'Adaga', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_BAT'] = { index = 'tacobaseball', name = 'Taco de Baseball', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_BOTTLE'] = { index = 'garrafaquebrada', name = 'Garrafa quebrada', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_CROWBAR'] = { index = 'pecabra', name = 'Pé de Cabra', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_FLASHLIGHT'] = { index = 'lanterna', name = 'Lanterna', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_GOLFCLUB'] = { index = 'tacogolf', name = 'Taco de Golf', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_HAMMER'] = { index = 'martelo', name = 'Martelo', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_WEAPON_HATCHET'] = { index = 'machado', name = 'Machado', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_WEAPON_KNUCKLES'] = { index = 'socoingles', name = 'Soco Inglês', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_KNIFE'] = { index = 'faca', name = 'Faca', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_MACHETE'] = { index = 'machete', name = 'Taco de Baseball', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_SWITCHBLADE'] = { index = 'canivete', name = 'Canivete', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_NIGHTSTICK'] = { index = 'cassetete', name = 'Cassetete', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_WHENCH'] = { index = 'grifo', name = 'Grifo', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_BATTLEAXE'] = { index = 'machadodebatalha', name = 'Machado De Batalha', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_POOLCUE'] = { index = 'tacosinuca', name = 'Taco de Sinuca', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_STONE_HATCHET'] = { index = 'machadopedra', name = 'Machado de Pedra', type = 'equip', weight = 1.0 },

	--[ Handguns ][ Weapons ]------------------------------------------------------------------------------------------
	
	['wbodyWEAPON_PISTOL'] = { index = 'pt92af', name = 'PT92AF', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_PISTOL_MK2'] = { index = 'czp09', name = 'Five Seven', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_COMBATPISTOL'] = { index = 'px4', name = 'Px4', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_APPISTOL'] = { index = 'x2e1911', name = 'XSE 1911', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_STUNGUN'] = { index = 'taser', name = 'Taser', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_PISTOL50'] = { index = 'derserteagle', name = 'Desert Eagle', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_SNSPISTOL'] = { index = 'waltherppk', name = 'Walther PPK', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_SNSPISTOL_MK2'] = { index = 'waltherppk2', name = 'HK', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_HEAVYPISTOL'] = { index = 'wide1911', name = 'Wide 1911', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_VINTAGEPISTOL'] = { index = 'fn1903', name = 'FN 1903', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_FLAREGUN'] = { index = 'sinalizador', name = 'Sinalizador', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_MARKSMANPISTOL'] = { index = 'musketpistol', name = 'Musket Pistol', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_REVOLVER'] = { index = 'asgco2', name = 'ASG CO2', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_REVOLVER_MK2'] = { index = 'ragingbull', name = 'Raging Bull', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_DOUBLEACTION'] = { index = 'python', name = 'Python', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_RAYPISTOL'] = { index = 'raypistol', name = 'Raypistol', type = 'equip', weight = 1.0 }, --[ Admin Gun ]
	['wbodyWEAPON_CERAMICPISTOL'] = { index = 'kochp7', name = 'Koch P7', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_NAVYREVOLVER'] = { index = 'colt1851', name = 'Colt 1851', type = 'equip', weight = 1.0 },

	--[ Handguns ][ Ammo ]---------------------------------------------------------------------------------------------

	['wammoWEAPON_PISTOL'] = { index = 'm-pt92af', name = 'M-PT92AF', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_PISTOL_MK2'] = { index = 'm-czp09', name = 'M-Five Seven', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_COMBATPISTOL'] = { index = 'm-px4', name = 'M-Px4', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_APPISTOL'] = { index = 'm-x2e1911', name = 'M-XSE 1911', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_STUNGUN'] = { index = 'm-taser', name = 'M-Taser', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_PISTOL50'] = { index = 'm-derserteagle', name = 'M-Desert Eagle', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_SNSPISTOL'] = { index = 'm-waltherppk', name = 'M-Walther PPK', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_SNSPISTOL_MK2'] = { index = 'm-waltherppk2', name = 'M-HK', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_HEAVYPISTOL'] = { index = 'm-wide1911', name = 'M-Wide 1911', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_VINTAGEPISTOL'] = { index = 'm-fn1903', name = 'M-FN 1903', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_FLAREGUN'] = { index = 'm-sinalizador', name = 'M-Sinalizador', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_MARKSMANPISTOL'] = { index = 'm-musketpistol', name = 'M-Musket Pistol', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_REVOLVER'] = { index = 'm-asgco2', name = 'M-ASG CO2', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_REVOLVER_MK2'] = { index = 'm-ragingbull', name = 'M-Raging Bull', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_DOUBLEACTION'] = { index = 'm-python', name = 'M-Python', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_RAYPISTOL'] = { index = 'm-raypistol', name = 'M-Raypistol', type = 'reloading', weight = 0.01 }, --[ Admin Gun ]-
	['wammoWEAPON_CERAMICPISTOL'] = { index = 'm-kochp7', name = 'M-Koch P7', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_NAVYREVOLVER'] = { index = 'm-colt1851', name = 'M-Colt 1851', type = 'reloading', weight = 0.01 },

	--[ Submachine Guns ][ Weapons ]-----------------------------------------------------------------------------------

	['wbodyWEAPON_MICROSMG'] = { index = 'microuzi', name = 'Micro Uzi', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_SMG'] = { index = 'mp5', name = 'MP5', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_SMG_MK2'] = { index = 'mp5k', name = 'MP5K', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_ASSAULTSMG'] = { index = 'p90', name = 'P90', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_COMBATPDW'] = { index = 'mpxsd', name = 'MPX-SD', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_MACHINEPISTOL'] = { index = 'tecdc9', name = 'TEC-DC9', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_MINISMG'] = { index = 'vz82', name = 'VZ.82', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_RAYCARBINE'] = { index = 'raycarbine', name = 'Ray Carbine', type = 'equip', weight = 1.0 },

	--[ Submachine Guns ][ Ammo ]--------------------------------------------------------------------------------------

	['wammoWEAPON_MICROSMG'] = { index = 'm-microuzi', name = 'M-Micro Uzi', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_SMG'] = { index = 'm-mp5', name = 'M-MP5', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_SMG_MK2'] = { index = 'm-mp5k', name = 'M-MP5K', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_ASSAULTSMG'] = { index = 'm-p90', name = 'M-P90', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_COMBATPDW'] = { index = 'm-mpxsd', name = 'M-MPX-SD', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_MACHINEPISTOL'] = { index = 'm-tecdc9', name = 'M-TEC-DC9', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_MINISMG'] = { index = 'm-vz82', name = 'M-VZ.82', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_RAYCARBINE'] = { index = 'm-raycarbine', name = 'M-Ray Carbine', type = 'reloading', weight = 0.01 },

	--[ Shotguns ][ Weapons ]------------------------------------------------------------------------------------------

	['wbodyWEAPON_PUMPSHOTGUN'] = { index = 'mossberg590', name = 'Mossberg 590', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_PUMPSHOTGUN_MK2'] = { index = 'remington870', name = 'Remington 870', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_SAWNOFFSHOTGUN'] = { index = 'mossberg500', name = 'Mossberg 500', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_ASSAULTSHOTGUN'] = { index = 'uts15', name = 'UTS-15', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_BULLPUPSHOTGUN'] = { index = 'keltecksg', name = 'Kel-Tec KSG ', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_MUSKET'] = { index = 'musket', name = 'Musket', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_HEAVYSHOTGUN'] = { index = 'saiga12', name = 'Saiga 12', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_DBSHOTGUN'] = { index = 'zabala', name = 'Zabala', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_AUTOSHOTGUN'] = { index = 'armselprotecta', name = 'Armsel Protecta', type = 'equip', weight = 1.0 },

	--[ Shotguns ][ Ammo ]---------------------------------------------------------------------------------------------

	['wammoWEAPON_PUMPSHOTGUN'] = { index = 'm-mossberg590', name = 'M-Mossberg 590', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_PUMPSHOTGUN_MK2'] = { index = 'm-remington870', name = 'M-Remington 870', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_SAWNOFFSHOTGUN'] = { index = 'm-mossberg500', name = 'M-Mossberg 500', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_ASSAULTSHOTGUN'] = { index = 'm-uts15', name = 'M-UTS-15', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_BULLPUPSHOTGUN'] = { index = 'm-keltecksg', name = 'M-Kel-Tec KSG ', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_MUSKET'] = { index = 'm-musket', name = 'M-Musket', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_HEAVYSHOTGUN'] = { index = 'm-saiga12', name = 'M-Saiga 12', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_DBSHOTGUN'] = { index = 'm-zabala', name = 'M-Zabala', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_AUTOSHOTGUN'] = { index = 'm-armselprotecta', name = 'M-Armsel Protecta', type = 'reloading', weight = 0.01 },

	--[ Assault Rifles ][ Weapons ]------------------------------------------------------------------------------------

	['wbodyWEAPON_ASSAULTRIFLE'] = { index = 'ak74', name = 'AK-74', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_ASSAULTRIFLE_MK2'] = { index = 'ak47', name = 'AK-47', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_CARBINERIFLE'] = { index = 'ar15', name = 'AR-15', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_CARBINERIFLE_MK2'] = { index = 'm4a1', name = 'M4-A1', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_ADVANCEDRIFLE'] = { index = 'tavorctar21', name = 'Tavor CTAR-21', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_SPECIALCARBINE'] = { index = 'g36c', name = 'G36C', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_SPECIALCARBINE_MK2'] = { index = 'g36k', name = 'G36K', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_BULLPUPRIFLE'] = { index = 'noricon86s', name = 'Norinco 86S', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_BULLPUPRIFLE_MK2'] = { index = 'hsvhsd2', name = 'HS VHS-D2', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_COMPACTRIFLE'] = { index = 'minidraco', name = 'Draco', type = 'equip', weight = 1.0 },

	--[ Assault Rifles ][ Ammo ]---------------------------------------------------------------------------------------

	['wammoWEAPON_ASSAULTRIFLE'] = { index = 'm-ak74', name = 'M-AK-74', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_ASSAULTRIFLE_MK2'] = { index = 'm-ak47', name = 'M-AK-47', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_CARBINERIFLE'] = { index = 'm-ar15', name = 'M-AR-15', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_CARBINERIFLE_MK2'] = { index = 'm-m4a1', name = 'M-M4-A1', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_ADVANCEDRIFLE'] = { index = 'm-tavorctar21', name = 'M-Tavor CTAR-21', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_SPECIALCARBINE'] = { index = 'm-g36c', name = 'M-G36C', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_SPECIALCARBINE_MK2'] = { index = 'm-g36k', name = 'M-G36K', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_BULLPUPRIFLE'] = { index = 'm-noricon86s', name = 'M-Norinco 86S', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_BULLPUPRIFLE_MK2'] = { index = 'm-hsvhsd2', name = 'M-HS VHS-D2', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_COMPACTRIFLE'] = { index = 'm-minidraco', name = 'M-Draco', type = 'reloading', weight = 0.01 },

	--[ Light Machine Guns ][ Weapons ]--------------------------------------------------------------------------------

	['wbodyWEAPON_MG'] = { index = 'pkm', name = 'PKM', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_COMBATMG'] = { index = 'm60', name = 'M60', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_COMBATMG_MK2'] = { index = 'm6e4', name = 'M60E4', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_GUSENBERG'] = { index = 'thompson', name = 'Thompson', type = 'equip', weight = 1.0 },

	--[ Light Machine Guns ][ Ammo ]-----------------------------------------------------------------------------------

	['wammoWEAPON_MG'] = { index = 'm-pkm', name = 'M-PKM', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_COMBATMG'] = { index = 'm-m60', name = 'M-M60', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_COMBATMG_MK2'] = { index = 'm-m6e4', name = 'M-M60E4', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_GUSENBERG'] = { index = 'm-thompson', name = 'M-Thompson', type = 'reloading', weight = 0.01 },

	--[ Sniper Rifles ][ Weapons ]-------------------------------------------------------------------------------------

	['wbodyWEAPON_SNIPERRIFLE'] = { index = 'awf', name = 'AW-F', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_HEAVYSNIPER'] = { index = 'barrettm107', name = 'Barrett M107', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_HEAVYSNIPER_MK2'] = { index = 'serbubfg504', name = 'Serbu BFG-50A', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_MASKMANRIFLE'] = { index = 'm39', name = 'M39', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_MASKMANRIFLE_MK2'] = { index = 'm1a', name = 'M1A', type = 'equip', weight = 1.0 },

	--[ Sniper Rifles ][ Ammo ]----------------------------------------------------------------------------------------

	['wammoWEAPON_SNIPERRIFLE'] = { index = 'm-awf', name = 'M-AW-F', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_HEAVYSNIPER'] = { index = 'm-barrettm107', name = 'M-Barrett M107', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_HEAVYSNIPER_MK2'] = { index = 'm-serbubfg504', name = 'M-Serbu BFG-50A', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_MASKMANRIFLE'] = { index = 'm-m39', name = 'M-M39', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_MASKMANRIFLE_MK2'] = { index = 'm-m1a', name = 'M-M1A', type = 'reloading', weight = 0.01 },

	--[ Heavy Weapons ][ Weapons ]-------------------------------------------------------------------------------------

	['wbodyWEAPON_RPG'] = { index = 'rpg', name = 'RPG', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_GRENADELAUNCHER'] = { index = 'grenadelauncher', name = 'Lançador de Granadas', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_GRENADELAUNCHER_SMOKE'] = { index = 'grenadelaunchersmoke', name = 'Lançador de Granadas de Smoke', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_MINIGUN'] = { index = 'minigun', name = 'Minigun', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_FIREWORK'] = { index = 'firework', name = 'Firework', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_RAILGUN'] = { index = 'railgun', name = 'Railgun', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_HOMINGLAUNCHER'] = { index = 'hominglauncher', name = 'Railgun', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_COMPACTLAUNCHER'] = { index = 'compactlauncher', name = 'Lançador de Granadas Compacto', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_RAYMINIGUN'] = { index = 'rayminigun', name = 'Rayminigun', type = 'equip', weight = 1.0 },

	--[ Heavy Weapons ][ Ammo ]----------------------------------------------------------------------------------------

	['wammoWEAPON_RPG'] = { index = 'm-rpg', name = 'M-RPG', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_GRENADELAUNCHER'] = { index = 'm-grenadelauncher', name = 'M-Lançador de Granadas', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_GRENADELAUNCHER_SMOKE'] = { index = 'm-grenadelaunchersmoke', name = 'M-Lançador de Granadas', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_MINIGUN'] = { index = 'm-minigun', name = 'M-Minigun', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_FIREWORK'] = { index = 'm-firework', name = 'M-Firework', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_RAILGUN'] = { index = 'm-railgun', name = 'M-Railgun', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_HOMINGLAUNCHER'] = { index = 'm-hominglauncher', name = 'M-Railgun', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_COMPACTLAUNCHER'] = { index = 'm-compactlauncher', name = 'M-Lançador de Granadas', type = 'reloading', weight = 0.01 },
	['wammoWEAPON_RAYMINIGUN'] = { index = 'm-rayminigun', name = 'M-Rayminigun', type = 'reloading', weight = 0.01 },

	--[ Throwables ]---------------------------------------------------------------------------------------------------

	['wammoWEAPON_GRANADE'] = { index = 'granada', name = 'Granada', type = 'equip', weight = 1.0 },
	['wammoWEAPON_BZGAS'] = { index = 'gaslacrimogeneo', name = 'Gás Lacrimogêneo', type = 'equip', weight = 1.0 },
	['wammoWEAPON_MOLOTOV'] = { index = 'coquetelmolotov', name = 'Coquetel Molotov', type = 'equip', weight = 1.0 },
	['wammoWEAPON_STICKYBOMB'] = { index = 'c4', name = 'C4', type = 'equip', weight = 1.0 },
	['wammoWEAPON_PROXMINE'] = { index = 'minaproximidade', name = 'Mina de Proximidade', type = 'equip', weight = 1.0 },
	['wammoWEAPON_SNOWBALL'] = { index = 'bolaneve', name = 'Bola de Neve', type = 'equip', weight = 1.0 },
	['wammoWEAPON_PIPEBOMB'] = { index = 'bombacano', name = 'Bomba de Cano', type = 'equip', weight = 1.0 },
	['wammoWEAPON_BALL'] = { index = 'bolabaseball', name = 'Bola de Baseball', type = 'equip', weight = 1.0 },
	['wammoWEAPON_SMOKEGRENADE'] = { index = 'granadagas', name = 'Granada de Gás', type = 'equip', weight = 1.0 },
	['wammoWEAPON_FLARE'] = { index = 'flare', name = 'Flare', type = 'equip', weight = 1.0 },

	--[ Miscellaneous ]------------------------------------------------------------------------------------------------

	['wbodyWEAPON_PETROLCAN'] = { index = 'galaogasolina', name = 'Galão de Gasolina', type = 'equip', weight = 1.0 },
	['wammoWEAPON_PETROLCAN'] = { index = 'galaogasolina', name = 'Mun Galão de Gasolina', type = 'equip', weight = 1.0 },
	['wbodyGADGET_PARACHUTE'] = { index = 'paraquedas', name = 'Paraquédas', type = 'equip', weight = 1.0 },
	['wbodyWEAPON_FIREEXTINGUISHER'] = { index = 'extintor', name = 'Extintor', type = 'equip', weight = 1.0 }
}
