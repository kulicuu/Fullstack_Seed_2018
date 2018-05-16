api = {}

api = fp.assign api, require('./base_primus').default
api = fp.assign api, require('./init').default
api = fp.assign api, require('./inbound_command').default
api = fp.assign api, require('./terebinth_signals').default


keys_api = _.keys api


updates = ({ state, action }) ->
    state = state.set 'effects', Imm.Map({})
    if _.includes(keys_api, action.type)
        api[action.type] { state, action }
    else
        # NOTE: Remove logs for heavy load performance.
        unless action.type is 'heartbeat'
            process.stdout.write "reducer no-op, #{action.type}"
        state


exports.default = updates
