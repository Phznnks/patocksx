import language_tool_python as lt

def corrigir_texto(texto):
    ferramenta = lt.LanguageTool('pt-BR')
    correcoes = ferramenta.check(texto)
    texto_corrigido = ferramenta.correct(texto)
    total_erros = len(correcoes)
    erros_corrigidos = sum(1 for correcao in correcoes if correcao.ruleIssueType == 'misspelling')

    qualidade_portugues = (total_erros - erros_corrigidos) / total_erros if total_erros > 0 else 1.0

    return texto_corrigido, qualidade_portugues

texto_entrada = input("Digite o texto que deseja corrigir e avaliar: ")
texto_corrigido, qualidade_portugues = corrigir_texto(texto_entrada)

print(f"Texto corrigido:\n{texto_corrigido}\n")
print(f"Avaliação da qualidade do português: {qualidade_portugues:.2%}")