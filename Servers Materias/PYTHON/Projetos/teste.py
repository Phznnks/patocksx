import time

# Função para simular o envio de mensagens
def enviar_mensagem(contato, mensagem):
    print(f'Enviando mensagem para {contato}...')
    time.sleep(1)  # Simula o tempo de envio
    print(f'Você: {mensagem}')
    print()

# Função para simular o recebimento de mensagens
def receber_mensagem(contato, mensagem):
    print(f'Recebendo mensagem de {contato}...')
    time.sleep(1)  # Simula o tempo de recebimento
    print(f'{contato}: {mensagem}')
    print()

# Função principal para simular a conversa
def conversa_whatsapp():
    print("Bem-vindo ao Simulador de Chat WhatsApp!")
    print("Digite 'sair' a qualquer momento para encerrar o chat.\n")

    while True:
        mensagem = input("Digite sua mensagem: ")

        if mensagem.lower() == 'sair':
            print("Chat encerrado.")
            break
        
        # Simulando que a mensagem é enviada para o contato
        enviar_mensagem("Amigo", mensagem)

        # Simulando uma resposta do contato
        receber_mensagem("Amigo", "Olá! Tudo bem?")

    print("Fim da simulação.")

# Iniciar a simulação do chat
conversa_whatsapp()