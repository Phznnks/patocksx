local cfg = {}

cfg.groups = {

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CARGOS ADMINISTRATIVO
-----------------------------------------------------------------------------------------------------------------------------------------------

	["founder"] = {
		_config = {
			title = "founder",
			gtype = "staff"
		},
		"mindmaster.permissao",
		"manager.permissao",
		"administrador.permissao",
		"admin.permissao",
		"founder.servico",
		"moderador.permissao",
		"administrador.permissao",
		"moderador.permissao",
		"suporte.permissao",
	},
	["Administrador"] = {
		_config = {
			title = "Administrador(a)",
			gtype = "staff"
		},
		"administrador.permissao",
		"admin.permissao",
		"moderador.permissao",
		"suporte.permissao",
		"admin.servico",
	},

	["Moderador"] = {
		_config = {
			title = "Moderador(a)",
			gtype = "staff"
		},
		"moderador.permissao",
		"mod.servico",
		"suporte.permissao",
	},

	["Suporte"] = {
		_config = {
			title = "Suporte",
			gtype = "staff"
		},
		"suporte.permissao",
		"suporte.servico",
	},

	["founderPaisana"] = {
		_config = {
			title = "founderPaisana",
			gtype = "staff"
		},
		"sem.founder",
	},

	["AdminPaisana"] = {
		_config = {
			title = "AdminPaisana",
			gtype = "staff"
		},
		"sem.adm",
	},

	["ModeradorPaisana"] = {
		_config = {
			title = "ModeradorPaisana",
			gtype = "staff"
		},
		"sem.mod",
	},

	["SuportePaisana"] = {
		_config = {
			title = "SuportePaisana",
			gtype = "staff"
		},
		"sem.sup",
	},

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CARGOS VIPS
-----------------------------------------------------------------------------------------------------------------------------------------------

	["Casa01"] = {
		_config = {
			title = "Casa01",
			gtype = "casa"
		},
		"Casa01.permissao",
	},

	["Casa02"] = {
		_config = {
			title = "Casa02",
			gtype = "casa"
		},
		"Casa02.permissao",
	},

	["Casa03"] = {
		_config = {
			title = "Casa03",
			gtype = "casa"
		},
		"Casa03.permissao",
	},

	["Casa04"] = {
		_config = {
			title = "Casa04",
			gtype = "casa"
		},
		"Casa04.permissao",
	},

	["Casa05"] = {
		_config = {
			title = "Casa05",
			gtype = "casa"
		},
		"Casa05.permissao",
	},

	["Casa06"] = {
		_config = {
			title = "Casa06",
			gtype = "casa"
		},
		"Casa06.permissao",
	},

	["Casa07"] = {
		_config = {
			title = "Casa07",
			gtype = "casa"
		},
		"Casa07.permissao",
	},

	["Casa08"] = {
		_config = {
			title = "Casa08",
			gtype = "casa"
		},
		"Casa08.permissao",
	},

	["Casa09"] = {
		_config = {
			title = "Casa09",
			gtype = "casa"
		},
		"Casa09.permissao",
	},

	["Casa10"] = {
		_config = {
			title = "Casa10",
			gtype = "casa"
		},
		"Casa10.permissao",
	},

	["Casa11"] = {
		_config = {
			title = "Casa11",
			gtype = "casa"
		},
		"Casa11.permissao",
	},

	["Iate1"] = {
		_config = {
			title = "Iate1",
			gtype = "Iate1"
		},
		"Iate1.permissao",
	},

	["Iate2"] = {
		_config = {
			title = "Iate2",
			gtype = "Iate2"
		},
		"Iate2.permissao",
	},

	["Iate3"] = {
		_config = {
			title = "Iate3",
			gtype = "Iate3"
		},
		"Iate3.permissao",
	},


	["Spotify"] = {
		_config = {
			title = "Spotify",
			gtype = "casa"
		},
		"spotify.permissao",
	},

	
	["Bronze"] = {
		_config = {
			title = "Bronze",
			gtype = "vip"
		},
		"bronze.permissao",
		"vip.permissao",
	},

	["Prata"] = {
		_config = {
			title = "Prata",
			gtype = "vip"
		},
		"prata.permissao",
		"vip.permissao",
	},

	["Armas"] = {
		_config = {
			title = "Armas",
			gtype = "vip2"
		},
		"armas.permissao",
	},

	["Ouro"] = {
		_config = {
			title = "Ouro",
			gtype = "vip"
		},
		"ouro.permissao",
		"vip.permissao",
	},

	["Diamante"] = {
		_config = {
			title = "Diamante",
			gtype = "vip"
		},
		"diamante.permissao",
		"vip.permissao",
	},

	["Desempregado"] = {
		_config = {
			title = "Desempregado",
			gtype = "job"
		},
		"desempregado.permissao",
	},

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CARGOS EMPRESAS
-----------------------------------------------------------------------------------------------------------------------------------------------

	["Empresa-Joelheria"] = {
		_config = {
			title = "Empresa-Joelheria",
			gtype = "Empresa-Joelheria"
		},
		"joelheria.permissao",
	},

	["Empresa-Academia"] = {
		_config = {
			title = "Empresa-Academia",
			gtype = "Empresa-Academia"
		},
		"academia.permissao",
	},

	["Empresa-AutoEscola"] = {
		_config = {
			title = "Empresa-AutoEscola",
			gtype = "Empresa-AutoEscola"
		},
		"autoescola.permissao",
	},

	["Empresa-Restaurante"] = {
		_config = {
			title = "Empresa-Restaurante",
			gtype = "Empresa-Restaurante"
		},
		"restauranteempresa.permissao",
	},

	["Empresa-Entregas"] = {
		_config = {
			title = "Empresa-Entregas",
			gtype = "Empresa-Entregas"
		},
		"entregas.permissao",
	},

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CARGOS POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------------

	["Policia"] = {
		_config = {
			title = "Policia",
			gtype = "job"
		},
		"salariopolicia.permissao",
		"policia.permissao",
		"tiros.permissao",
		"policia.toggle",
	},

	["PoliciaI"] = {
		_config = {
			title = "PoliciaI",
			gtype = "job"
		},
		"salariopoliciaI.permissao",
		"policia.permissao",
		"tiros.permissao",
		"policia.toggle",
	},

	["PoliciaII"] = {
		_config = {
			title = "PoliciaII",
			gtype = "job"
		},
		"salariopoliciaII.permissao",
		"policia.permissao",
		"tiros.permissao",
		"policia.toggle",
	},

	["paisana-policia"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisanapolicia.permissao",
		"policia.toggle",
	},

	["paisana-policiaI"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisana-bcso.permissao",
		"policia.toggle",
	},

	["paisana-policiaII"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisana-bcso.permissao",
		"policia.toggle",
	},


	["Comandante"] = {
		_config = {
			title = "Policia Comandante",
			gtype = "job"
		},
		"comandante.permissao",
		"policia.permissao",
		"tiros.permissao",
		"policia.toggle",
	},

	["paisana-comandante"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisana-bcso.permissao",
		"policia.toggle",
	},

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CARGOS HOSPITAL
-----------------------------------------------------------------------------------------------------------------------------------------------

	["Paramedico"] = {
		_config = {
			title = "Paramedico",
			gtype = "job"
		},
		"salarioparamedico.permissao",
		"paramedico.permissao",
		"blip.togglehp",
		"player.blips",
		"player.blips"
	}, 
	["ParamedicoI"] = {
		_config = {
			title = "ParamedicoI",
			gtype = "job"
		},
		"salarioparamedicoI.permissao",
		"paramedico.permissao",
		"blip.togglehp",
		"player.blips",
		"player.blips"
	}, 
	["ParamedicoII"] = {
		_config = {
			title = "ParamedicoII",
			gtype = "job"
		},
		"salarioparamedicoII.permissao",
		"paramedico.permissao",
		"blip.togglehp",
		"player.blips",
		"player.blips"
	}, 

	["paisana-ParamedicoI"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisanaparamedico.permissao",
		"blip.togglehp",
		"player.blips"
	},

	["paisana-ParamedicoII"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisanaparamedico.permissao",
		"blip.togglehp",
		"player.blips"
	},

	["paisana-Paramedico"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisanaparamedico.permissao",
		"blip.togglehp",
		"player.blips"
	},

	["restaurante"] = {
		_config = {
			title = "Restaurante",
			gtype = "job"
		},
		"restaurante.permissao",
		"restaurante.toggle",
	},

	["paisana-restaurante"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"restaurante.toggle",
	},

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CARGOS HOSPITAL
-----------------------------------------------------------------------------------------------------------------------------------------------
	
	["AutoCenter-Lider"] = {
		_config = {
			title = "AutoCenter",
			gtype = "job"
		},
		"mecanico.permissao",
		"autocenter.permissao",
		"autocenter.toggle",
	},

	["lider-paisana-autocenter"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisana-autocenter.permissao",
		"autocenter.toggle",
	},

	["AutoCenter"] = {
		_config = {
			title = "AutoCenter",
			gtype = "job"
		},
		"mecanico.permissao",
		"autocenter.permissao",
		"autocenter.toggle",
	},
	["paisana-autocenter"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisana-autocenter.permissao",
		"autocenter.toggle",
	},

	["AutoSport-Lider"] = {
		_config = {
			title = "AutoSport",
			gtype = "job"
		},
		"mecanico.permissao",
		"autosport.permissao",
		"autosport.toggle",
	},

	["lider-paisana-autosport"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisana-autosport.permissao",
		"autosport.toggle",
	},

	["AutoSport"] = {
		_config = {
			title = "AutoSport",
			gtype = "job"
		},
		"mecanico.permissao",
		"autosport.permissao",
		"autosport.toggle",
	},

	["paisana-autosport"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisana-autosport.permissao",
		"autosport.toggle",
	},

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CARGOS REPORTAGEM
-----------------------------------------------------------------------------------------------------------------------------------------------
	["Reportagem"] = {
		_config = {
			title = "Reportagem",
			gtype = "job"
		},
		"reportagem.permissao",
		"reportagem.toggle",
	},
	["paisana-reportagem"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisana-reportagem.permissao",
		"reportagem.toggle",
	},

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CARGOS JURIDICO
-----------------------------------------------------------------------------------------------------------------------------------------------

	["Juiz"] = {
		_config = {
			title = "Juiz",
			gtype = "job"
		},
		"advogado.permissao",
		"juiz.toggle",
	},
	["paisana-juiz"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"paisana-juiz.permissao",
		"juiz.toggle",
	},

	["Advogado"] = {
		_config = {
			title = "Advogado",
			gtype = "job"
		},
		"advogado.permissao",
		"juiz.toggle",
	},

	["paisana-advogado"] = {
		_config = {
			title = "Fora de Servico",
			gtype = "job"
		},
		"advogado.permissao",
		"juiz.toggle",
	},

-----------------------------------------------------------------------------------------------------------------------------------------------
-- CARGOS FACS
-----------------------------------------------------------------------------------------------------------------------------------------------

	["roxos"] = {
		_config = {
			title = "Roxos Aviaozinho",
			gtype = "job"
		},
		"ilegal.permissao",
		"roxos.permissao",
	},

	["roxos1"] = {
		_config = {
			title = "Roxos Membro",
			gtype = "job"
		},
		"ilegal.permissao",
		"roxos.permissao",
	},

	["roxos2"] = {
		_config = {
			title = "Roxos Gerente",
			gtype = "job"
		},
		"ilegal.permissao",
		"roxos.permissao",
	},

	["roxos3"] = {
		_config = {
			title = "Roxos Lider",
			gtype = "job"
		},
		"ilegal.permissao",
		"roxos.permissao",
		"lider-roxos.permissao",
	},


	["verdes"] = {
		_config = {
			title = "Verdes Aviaozinho",
			gtype = "job"
		},
		"ilegal.permissao",
		"verdes.permissao",
	},

	["verdes1"] = {
		_config = {
			title = "Verdes Membro",
			gtype = "job"
		},
		"ilegal.permissao",
		"verdes.permissao",
	},

	["verdes2"] = {
		_config = {
			title = "Verdes Gerente",
			gtype = "job"
		},
		"ilegal.permissao",
		"verdes.permissao",
	},

	["verdes3"] = {
		_config = {
			title = "Verdes Lider",
			gtype = "job"
		},
		"ilegal.permissao",
		"verdes.permissao",
		"lider-verdes.permissao",
	},

	["franca-novato"] = {
		_config = {
			title = "Franca novato",
			gtype = "job"
		},
		"ilegal.permissao",
		"franca.permissao",
	},

	["franca-membro"] = {
		_config = {
			title = "Franca Membro",
			gtype = "job"
		},
		"ilegal.permissao",
		"franca.permissao",
	},

	["franca-gerente"] = {
		_config = {
			title = "Franca Gerente",
			gtype = "job"
		},
		"ilegal.permissao",
		"franca.permissao",
	},

	["franca-sub-lider"] = {
		_config = {
			title = "Franca Sub Lider",
			gtype = "job"
		},
		"ilegal.permissao",
		"franca.permissao",
		"lider-franca.permissao",
	},

	["franca-lider"] = {
		_config = {
			title = "Franca Lider",
			gtype = "job"
		},
		"ilegal.permissao",
		"franca.permissao",
		"lider-franca.permissao",
	},

	["mafia"] = {
		_config = {
			title = "Mafia Aviaozinho",
			gtype = "job"
		},
		"ilegal.permissao",
		"mafia.permissao",
	},

	["mafia1"] = {
		_config = {
			title = "Mafia Membro",
			gtype = "job"
		},
		"ilegal.permissao",
		"mafia.permissao",
	},

	["mafia2"] = {
		_config = {
			title = "Mafia Gerente",
			gtype = "job"
		},
		"ilegal.permissao",
		"mafia.permissao",
	},

	["mafia3"] = {
		_config = {
			title = "Mafia Lider",
			gtype = "job"
		},
		"ilegal.permissao",
		"mafia.permissao",
		"lider-mafia.permissao",
	},

	["tokyo"] = {
		_config = {
			title = "Tokyo Aviaozinho",
			gtype = "job"
		},
		"ilegal.permissao",
		"tokyo.permissao",
	},

	["tokyo1"] = {
		_config = {
			title = "Tokyo Membro",
			gtype = "job"
		},
		"ilegal.permissao",
		"tokyo.permissao",
	},

	["tokyo2"] = {
		_config = {
			title = "Tokyo Gerente",
			gtype = "job"
		},
		"ilegal.permissao",
		"tokyo.permissao",
	},

	["tokyo3"] = {
		_config = {
			title = "Tokyo Lider",
			gtype = "job"
		},
		"ilegal.permissao",
		"tokyo.permissao",
		"lider-tokyo.permissao",
	},

	["motoclub"] = {
		_config = {
			title = "Motoclub Aviaozinho",
			gtype = "job"
		},
		"ilegal.permissao",
		"motoclub.permissao",
	},

	["motoclub1"] = {
		_config = {
			title = "Motoclub Membro",
			gtype = "job"
		},
		"ilegal.permissao",
		"motoclub.permissao",
	},

	["motoclub2"] = {
		_config = {
			title = "Motoclub Gerente",
			gtype = "job"
		},
		"ilegal.permissao",
		"motoclub.permissao",
	},

	["motoclub3"] = {
		_config = {
			title = "Motoclub Lider",
			gtype = "job"
		},
		"ilegal.permissao",
		"motoclub.permissao",
		"lider-motoclub.permissao",
	},

	["vanilla"] = {
		_config = {
			title = "Vanilla Aviaozinho",
			gtype = "job"
		},
		"ilegal.permissao",
		"vanilla.permissao",
	},

	["vanilla1"] = {
		_config = {
			title = "Vanilla Membro",
			gtype = "job"
		},
		"ilegal.permissao",
		"vanilla.permissao",
	},

	["vanilla2"] = {
		_config = {
			title = "Vanilla Gerente",
			gtype = "job"
		},
		"ilegal.permissao",
		"vanilla.permissao",
	},

	["vanilla3"] = {
		_config = {
			title = "Vanilla Lider",
			gtype = "job"
		},
		"ilegal.permissao",
		"vanilla.permissao",
		"lider-vanilla.permissao",
	},

	["nextlevel"] = {
		_config = {
			title = "NextLevel Aviaozinho",
			gtype = "job"
		},
		"ilegal.permissao",
		"nextlevel.permissao",
	},

	["nextlevel1"] = {
		_config = {
			title = "NextLevel Membro",
			gtype = "job"
		},
		"ilegal.permissao",
		"nextlevel.permissao",
	},

	["nextlevel2"] = {
		_config = {
			title = "NextLevel Gerente",
			gtype = "job"
		},
		"ilegal.permissao",
		"nextlevel.permissao",
	},

	["nextlevel3"] = {
		_config = {
			title = "NextLevel Lider",
			gtype = "job"
		},
		"ilegal.permissao",
		"nextlevel.permissao",
		"lider-nextlevel.permissao",
	},

}

cfg.users = {
	[1] = { "founder" }
}

cfg.selectors = {}

return cfg