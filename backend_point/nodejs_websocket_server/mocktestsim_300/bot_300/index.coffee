







require './globals'



c color.purple "bot 300 ---->", on



root_env = Imm.Map
    terebinth_socket_port: 9000
    command_server_port: 9003


( require './state_store' ) { env : root_env }
