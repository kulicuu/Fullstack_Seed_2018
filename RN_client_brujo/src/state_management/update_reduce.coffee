


_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
shortid = require 'shortid'


api_arq = {}
api_arq = fp.assign api_arq, require('./updates_reducers/index').default


api_arq.placeholder = ({ state, action }) ->
    state
keys_api_arq = _.keys api_arq


lookup_precursor = ({ effects_q }) ->
    (state, action) ->
        if _.includes(keys_api_arq, action.type)
            api_arq[action.type] { state, action, effects_q }
        else
            c 'no-op in updates', action.type
            state


exports.default = lookup_precursor
