







aa = {}







# keys_aa = _.keys aa



aa.res_report_for_duty = ({ effect, state, dispatch }) ->

    c '3903093093093039309232392'
    { spark_id, the_token, mission_code, user_assigned } = effect.payload
    spark = state.getIn ['sparks', spark_id]


    some_stuff_avail = state.get('stuff_base').find (v, k) ->

        v.get('assigned') is false

    if some_stuff_avail
        state = state.setIn ['stuff_base', some_stuff_avail.get('arq').get('name'), 'assigned'], true



    spark.write
        type: 'res_report_for_duty'
        payload:
            the_token: the_token
            mission_code: mission_code
            user_assigned: user_assigned
            stuff_assigned: some_stuff_avail or null








exports.default = aa
