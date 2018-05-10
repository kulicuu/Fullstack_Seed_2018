

Primus = require 'primus'



aa = {}



aa.init_primus = ({ effect, state, dispatch }) ->
    terebinth_socket_port = state.get 'terebinth_socket_port'
    command_server_port = state.get 'command_server_port'


    global.Socket = Primus.createSocket()
    global.terebinth_socket = new Socket("http://localhost:#{terebinth_socket_port}")

    worker_opts =
        transport:
            headers:
                # 'Cookie': "#{state.get('user_data_preload').username}"
                'Cookie': "12312312312312312312312313"

    global.command_socket = new Socket("http://localhost:#{command_server_port}", worker_opts)



    command_socket.on 'data', (data) ->
        dispatch
            type: 'inbound_command'
            payload:
                type: data.type
                payload: data.payload


    terebinth_socket.on 'data', (data) ->
        # if data.type is 'heartbeat'
        #     process.stdout.write '.'
        # else
        unless data.type is 'heartbeat'
            # c (color[c1] 'data.type:', on), (color[c2] data.type, on)
            _.map data.payload, (v, k) ->
                # c (color[c1] k, on), (color[c3] v, on)
                c '...'
            dispatch
                type: data.type
                payload: data.payload







    dispatch
        type: 'init_primus_complete_worker'









exports.default = aa
