import socket
import threading

# Função para lidar com as mensagens recebidas de um cliente
def handle_client(client_socket, clients):
    while True:
        try:
            # Recebe a mensagem do cliente
            message = client_socket.recv(1024).decode('utf-8')
            print(message)
            print('teste9')
            if not message:
                print('teste7')
                break
            
            # Envia a mensagem para todos os outros clientes conectados
            for client in clients:
                if client != client_socket:
                    client.send(message.encode('utf-8'))
                    print('teste8')
        
        except Exception as e:
            print(f"Erro: {e}")
            break
    
    # Remove o cliente da lista de clientes
    clients.remove(client_socket)
    client_socket.close()

# Configurações do servidor
host = '127.0.0.1'
port = 12345

# Cria um socket TCP/IP
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Liga o socket à porta e ao endereço local
server_socket.bind((host, port))

# Escuta por até 5 clientes
server_socket.listen(5)

print(f'Servidor escutando em {host}:{port}...')

clients = []

try:
    while True:
        # Aceita a conexão do cliente
        client_socket, addr = server_socket.accept()
        print(f'Conexão estabelecida com {addr}')

        # Adiciona o cliente à lista de clientes
        clients.append(client_socket)

        # Inicia uma thread para lidar com o cliente
        threading.Thread(target=handle_client, args=(client_socket, clients)).start()

except KeyboardInterrupt:
    print("\nServidor encerrado.")
finally:
    # Fecha todos os sockets dos clientes
    for client in clients:
        client.close()

    # Fecha o socket do servidor
    server_socket.close()







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
