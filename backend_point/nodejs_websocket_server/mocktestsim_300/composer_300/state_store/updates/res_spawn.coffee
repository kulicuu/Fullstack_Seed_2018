aa = {}






aa.res_spawn_stuff = ({ state, action }) ->

    c 'res spawn stufffffefefeuenthusaonethusantoehus'


    state = state.set 'spawns', Imm.Map({})


    _.map action.payload.spawn_arc, (spawn, k) ->
        state = state.setIn ['spawns', spawn.pid], spawn


    state


















exports.default = aa
