








aa = {}


aa.res_overwrite_and_instantiate_db = ({ state, action }) ->
    # state = state.setIn ['effects', shortid()],
    #     type: 'spawn_stuff'
    state = state.set 'db_ready', true
    x = state.get 'spawning_status'
    y = (x is 0)
    if ((state.get 'primus_ready') is true) and (y is true)
        c color.green 111
        state = state.set 'spawning_status', 1
        state = state.setIn ['effects', shortid()],
            type: 'spawn_stuff'
    # else
        # c color.purple '889934', on
        # c state.get 'primus_ready'
        # c state.get 'spawning_status'
        # c ((state.get 'primus_ready') is true)
        # c ((state.get 'spawing_status') is 0)
        # c (typeof state.get 'spawning_status')
        # c state.get 'spawning_status'
    state



aa.init_primus_complete_root = ({ state, action }) ->
    state = state.set 'primus_ready', true
    x = state.get 'spawning_status'
    y = (x is 0)
    if ((state.get 'db_ready') is true) and (y is true)
        state = state.set 'spawning_status', 1
        state = state.setIn ['effects', shortid()],
            type: 'spawn_stuff'
    else
        c color.cyan 111112, on
    state




exports.default = aa
