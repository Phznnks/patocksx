import socket
import threading

# Função para enviar mensagens ao servidor
def send_message(client_socket):
    while True:
        message = input()
        print('teste4')
        client_socket.send(message.encode('utf-8'))

# Configurações do cliente
host = '127.0.0.1'
port = 12345

# Cria um socket TCP/IP
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
    # Conecta ao servidor
    client_socket.connect((host, port))
    print(f'Conectado ao servidor em {host}:{port}')

    # Inicia uma thread para enviar mensagens
    threading.Thread(target=send_message, args=(client_socket,)).start()
    print('teste')

    # Recebe mensagens do servidor
    while True:
        message = client_socket.recv(1024).decode('utf-8')
        print('teste1')
        if not message:
            print('teste2')
            break
        print(message)
        print('teste3')

except Exception as e:
    print(f"Erro: {e}")

finally:
    # Fecha o socket do cliente
    client_socket.close()
