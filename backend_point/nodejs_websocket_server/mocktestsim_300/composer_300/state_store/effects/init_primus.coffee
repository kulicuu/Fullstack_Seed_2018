


# Not API calls so this file not deprecated

Primus = require 'primus'





















aa = {}






aa.init_primus = ({ effect, state, dispatch }) ->
    brujo_socket_port = state.get 'brujo_socket_port'
    command_server_port = state.get 'command_server_port'
    Socket = Primus.createSocket()
    global.brujo_socket = new Socket("http://localhost:#{brujo_socket_port}")
    command_server = Primus.createServer
        port: command_server_port

    command_server.on 'connection', (spark) ->
        # t_worker_id = spark.headers.cookie
        { headers, address, query, id, request } = spark
        dispatch
            type: 'connection:spark'
            payload: { spark }

        spark.on 'data', (data) ->
            spark_id = spark.id
            dispatch
                type: 'spark:data'
                payload: { spark_id, data }


    brujo_socket.on 'data', (data) ->
        # This is just extra
        if data.type is 'heartbeat'
            process.stdout.write color.red('.')
        else
            # c (color.red 'data.type:', on), (color.green data.type, on)
            # _.map data.payload, (v, k) ->
                # c (color.red k, on), (color.blue v, on)
            dispatch
                type: data.type
                payload: data.payload

    dispatch
        type: 'init_primus_complete_root'











exports.default = aa
