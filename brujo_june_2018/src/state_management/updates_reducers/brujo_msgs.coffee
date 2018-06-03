Imm = require 'immutable'
aa = {}

aa.res_get_all_users = ({ state, payload, data }) ->
    all_users_rayy = data.payload.all_users

    state = state.set 'all_users', all_users_rayy

    state









exports.default = aa
