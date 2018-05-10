





aa = {}




aa = fp.assign aa, require('./gatekeeper').default
aa = fp.assign aa, require('./user_core').default
aa = fp.assign aa, require('./post_stuff').default
aa = fp.assign aa, require('./explore_stuff').default


keys_aa = _.keys aa


api = ({spark, data}) ->

    { type, payload } = data
    if _.includes(keys_aa, type)
        aa[type] { payload, spark }
    else
        c 'no-op in base api with type', type


exports.default = api
