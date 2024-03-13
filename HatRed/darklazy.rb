def back
    printf "Aperte a tecla enter para voltar ao menu...".colorize(:color => :light_blue)
    
    input = gets.chomp
end 


def consumo(url)
    begin
        json = JSON.parse(RestClient.get(url).body)

        json.each do |key,value|

            puts '%s => %s'%[key,value]
        end

        back

    rescue SocketError
        puts '[*] Sem conexão com a Internet'.colorize(:color => :light_blue)
        back 

    rescue => exception
        puts '[!] Nada encontrado....'.colorize(:color => :red)

       back    
    end
end 



while true do

    system('clear')
     
    puts'     ██╗░░░░░░█████╗░███████╗██╗░░░██╗░░░░░░██████╗░██████╗░
     ██║░░░░░██╔══██╗╚════██║╚██╗░██╔╝░░░░░░██╔══██╗██╔══██╗
     ██║░░░░░███████║░░███╔═╝░╚████╔╝░█████╗██████╔╝██████╦╝
     ██║░░░░░██╔══██║██╔══╝░░░░╚██╔╝░░╚════╝██╔══██╗██╔══██╗
     ███████╗██║░░██║███████╗░░░██║░░░░░░░░░██║░░██║██████╦╝
     ╚══════╝╚═╝░░╚═╝╚══════╝░░░╚═╝░░░░░░░░░╚═╝░░╚═╝╚═════╝░'.colorize(:color => :red)
puts'=============================================================='.colorize(:color => :light_blue) 
puts'                     █▀█ █▀█ ▀█▀ █ █▀█ █▄ █
                     █▄█ █▀▀  █  █ █▄█ █ ▀█'
puts'=============================================================='.colorize(:color => :light_blue)
puts'                 [ １ ] Ｃｏｎｓｕｌｔａ ＣＥＰ
                 [ ２ ] Ｃｏｎｓｕｌｔａ ＤＤＤ   
                 [ ３ ] Ｃｏｎｓｕｌｔａ ＩＰ
                 [ ４ ] Ｃｏｎｓｕｌｔａ ＣＮＰＪ'.colorize(:color => :light_red)
puts'=============================================================='.colorize(:color => :light_blue)
    printf'
    -->> '

    user = gets.chomp.to_i

    case user

    when 1
        printf 'Informe o CEP: '.colorize(:color => :cyan)
        cep = gets.chomp.to_i
    
        url = 'https://viacep.com.br/ws/%s/json/'%[cep]
        consumo(url)


    when 2
        printf 'Informe o DDD: '.colorize(:color => :cyan)
        ddd = gets.chomp.to_i

        url = 'https://brasilapi.com.br/api/ddd/v1/%s'%[ddd]
        consumo(url)
    
    when 3
        printf 'Informe o IP: '.colorize(:color => :cyan)
        ip = gets.chomp.to_f

        url = 'https://ipwhois.app/json/%s'%[ip]
        consumo(url)
      
    when 4
        printf 'Informe o CNPJ: '.colorize(:color => :cyan)
        cnpj = gets().to_i
        
        url = 'https://www.receitaws.com.br/v1/cnpj/%s'%[cnpj]
        consumo(url)
      

    end 
end

BEGIN { require 'json'; require 'colorize'; require 'rest-client' } 
