

require './globals'
c color.blue "composer 300 ---->", off


root_env = Imm.Map
    brujo_socket_port: 8999
    command_server_port: 9003

( require './state_store' ) { env : root_env }
