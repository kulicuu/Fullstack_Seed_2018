





inbound_command_api = require('./inbound_command_api').default


aa = {}




aa.inbound_command = ({ state, action }) ->
    { type, payload } = action.payload
    inbound_command_api
        state: state
        command: { type, payload }
















exports.default = aa
