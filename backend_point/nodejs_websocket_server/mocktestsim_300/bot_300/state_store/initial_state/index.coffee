






initial_state = ({ env }) ->


    initial_effects = Imm.Map
        "#{shortid()}":
            type: 'init_primus'





    Imm.Map
        effects: initial_effects
        command_server_port: env.get 'command_server_port'
        terebinth_socket_port: env.get 'terebinth_socket_port'
        brujo_socket_port: env.get 'brujo_socket_port'
        # user_data_preload: env.get 'user_data'
        # child_nodes: env.get 'child_nodes'
        primus_ready: false






exports.default = ({ env }) ->
    # NOTE TODO : Pull initial-state from env
    initial_state { env }
