aa = {}



aa.gapic_cmdr = ({ effect, state, dispatch }) ->
    command_socket.write effect.payload






aa.gapic_tbnth = ({ effect, state, dispatch }) ->
    terebinth_socket.write effect.payload










exports.default = aa
