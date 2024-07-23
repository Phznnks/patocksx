import socket
import threading

# Função para lidar com as mensagens recebidas de um cliente
def handle_client(client_socket, clients, lock):
    while True:
        try:
            # Recebe a mensagem do cliente
            message = client_socket.recv(1024).decode('utf-8')
            if not message:
                break
            
            # Envia a mensagem para todos os outros clientes conectados
            with lock:
                for client in clients:
                    if client != client_socket:
                        client.send(message.encode('utf-8'))
        
        except Exception as e:
            print(f"Erro: {e}")
            break
    
    # Remove o cliente da lista de clientes
    with lock:
        clients.remove(client_socket)
    client_socket.close()

# Configurações do servidor
host = '0.0.0.0'  # Aceita conexões de qualquer interface de rede
port = 5000

# Cria um socket TCP/IP
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Liga o socket à porta e ao endereço local
server_socket.bind((host, port))

# Escuta por até 5 clientes
server_socket.listen(5)

print(f'Servidor escutando em {host}:{port}...')

clients = []
lock = threading.Lock()

try:
    while True:
        # Aceita a conexão do cliente
        client_socket, addr = server_socket.accept()
        print(f'Conexão estabelecida com {addr}')

        # Adiciona o cliente à lista de clientes
        with lock:
            clients.append(client_socket)

        # Inicia uma thread para lidar com o cliente
        threading.Thread(target=handle_client, args=(client_socket, clients, lock)).start()

except KeyboardInterrupt:
    print("\nServidor encerrado.")
finally:
    # Fecha todos os sockets dos clientes
    with lock:
        for client in clients:
            client.close()

    # Fecha o socket do servidor
    server_socket.close()
