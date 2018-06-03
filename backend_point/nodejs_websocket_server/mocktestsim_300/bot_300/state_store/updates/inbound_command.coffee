inbound_command_api = require('./inbound_command_api').default
aa = {}


aa.inbound_command = ({ state, action, effects_q }) ->
    { type, payload } = action.payload
    inbound_command_api
        state: state
        effects_q: effects_q
        command: { type, payload }


exports.default = aa
