



_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
shortid = require 'shortid'
c = console.log.bind console
api_arq = {}
api_arq = fp.assign api_arq, require('./effects/index').default
keys_api_arq = _.keys api_arq



effects_precursor = ({ state_store }) ->
    ({ effects_q }) ->
        if _.size(effects_q) > 0
            _.map effects_q, (effect, eid) ->
                etype = effect.type
                delete effects_q[eid]
                if ( _.includes keys_api_arq, etype )
                    api_arq[etype] { effect, eid, state_store }
                else
                    c "No-op in effects with type", etype
                #     # NOTE: No logs in production for performance





exports.default = effects_precursor
