



api = {}


api = fp.assign api, require('./init').default
api = fp.assign api, require('./base_primus').default
api = fp.assign api, require('./res_spawn').default


keys_api = _.keys api


updates = ({ state, action }) ->
    # unless action.type is 'heartbeat'
    #     c 'action.type', action.type, 'and state', state
    state = state.set 'effects', Imm.Map({})
    # state = state.set 'effects', {}
    if _.includes(keys_api, action.type)
        api[action.type] { state, action }
    else
        # NOTE: Remove logs for heavy load performance.
        unless action.type is 'heartbeat'
            c "reducer no-op, #{action.type}"
        state




exports.default = updates
