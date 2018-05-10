



_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
shortid = require 'shortid'
c = console.log.bind console

api_arq = {}
api_arq = fp.assign api_arq, require('./effects/index').default
api_arq = fp.assign api_arq, require('./effects/gatekeeper').default
api_arq = fp.assign api_arq, require('./effects/camera').default
api_arq = fp.assign api_arq, require('./effects/generic_api_call').default
keys_api_arq = _.keys api_arq





effects_precursor_next = ({ state_store }) ->
    ({ imm_state }) -> # TODO Refactor this. we have two references to state_sttore
        imm_state.get('effects').map (effect, eid) ->
            etype = effect.get('type')
            if ( _.includes keys_api_arq, etype )
                api_arq[etype] { effect, state_store }
            else
                c "No-op in effects with type", etype, effect
            #     # NOTE: No logs in production for performance




export default effects_precursor_next
