


_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
shortid = require 'shortid'


api_arq = {}
api_arq = fp.assign api_arq, require('./updates_reducers/index').default
api_arq = fp.assign api_arq, require('./updates_reducers/generic_user_api_call').default


api_arq.placeholder = ({ state, action }) ->
    state
keys_api_arq = _.keys api_arq


lookup = (state, action) ->
    unless action.type is '@@redux/INIT'
        state = state.setIn ['effects'], Imm.Map({})
    if _.includes(keys_api_arq, action.type)
        api_arq[action.type] { state, action }
    else
        state


export default lookup
