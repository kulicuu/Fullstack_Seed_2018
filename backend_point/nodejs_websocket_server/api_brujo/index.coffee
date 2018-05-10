



# NOTE TODO: Make better logs.
# Step One:  Make the c log dependent on environment variable
# Environment comes from the common db, might as well be rethinkdb

# NOTE: This endpoint may eventually be moved to another port, but anyway we should run extra security checks on this portal:








aa = {}





aa = fp.assign aa, require('./explore_global').default
aa = fp.assign aa, require('./explore_users').default
aa = fp.assign aa, require('./prepare_database').default






aa.init_brujoTerm = ({ spark, payload }) ->
    c 'payload', payload
    # c 'spark', spark

    @get_all_users_list { spark, payload }







keys_aa = _.keys aa


api = ({spark, data}) ->
    { type, payload } = data
    if _.includes(keys_aa, type)
        aa[type] { payload, spark }
    else
        c 'no-op in admin api with type', type


exports.default = api
