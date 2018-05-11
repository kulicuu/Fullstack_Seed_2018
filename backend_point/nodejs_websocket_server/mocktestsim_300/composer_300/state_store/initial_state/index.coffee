



initial_state = ({ env }) ->


    stuff_base = Imm.Map
        stereo_system: Imm.Map
            assigned: false
            posted: false
            arq: Imm.Map
                name: "stereo_system"
                description: "2 speakers, one receiver/amplifier, cables."
                price: "$100"
        house_cleaning_service: Imm.Map
            assigned: false
            posted: false
            arq: Imm.Map
                name: "house_cleaning_service"
                description: "2 hours of cleaning house"
                price: "$80"
        avocados: Imm.Map
            assigned: false
            posted: false
            arq: Imm.Map
                name: "avocados"
                description: "bushel of avocados"
                price: "$60"
        bicycle: Imm.Map
            assigned: false
            posted: false
            arq: Imm.Map
                name: "bicycle"
                description: "Mountain Bike"
                price: "$2300"



    user_base = Imm.Map
        albert: Imm.Map
            assigned: false
            ready: false
            arq: Imm.Map
                username: "albert"
                email: "albert@snth"
                pwd: "stnh84pa"
        andrew: Imm.Map
            assigned: false
            ready: false
            arq: Imm.Map
                username: "andrew"
                email: "andrew@aeou"
                pwd: "sea04ph"
        zeke: Imm.Map
            assigned: false
            ready: false
            arq: Imm.Map
                username: 'zeke'
                email: "zeke@l0pheu"
                pwd: "489puhseut"
        winston: Imm.Map
            assigned: false
            ready: false
            arq: Imm.Map
                username: 'winston'
                email: 'winston@hello'
                pwd: 'H(*EUHL*EHeutuh)'




    initial_effects = Imm.Map
        "#{shortid()}":
            type: 'init_primus'
        "#{shortid()}":
            type: 'gapic_brujo'
            payload:
                type: 'overwrite_and_instantiate_db'
                payload:
                    db_name: 'terebinth_db_000'



    Imm.Map
        effects: initial_effects
        command_server_port: env.get 'command_server_port'
        brujo_socket_port: env.get 'brujo_socket_port'
        primus_ready: false
        db_ready: false
        spawning_status: 0
        # am_root: env.get 'am_root'
        user_base: user_base
        stuff_base: stuff_base





exports.default = ({ env }) ->
    # NOTE TODO : Pull initial-state from env
    initial_state { env }
