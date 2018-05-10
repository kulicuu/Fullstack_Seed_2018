


worker_api = require('./worker_api').default


aa = {}


aa['spark:data'] = ({ state, action }) ->
    c color.green 777, on
    { spark, data } = action.payload
    { type, payload } = data
    if not (_.includes (_.keys payload), 'brujo_token')
        worker_api { state, action }
    else
        brujo_api { state, action }



aa['connection:spark'] = ({ state, action }) ->
    { spark } = action.payload
    # c 'update has connection with spark', spark.id
    state = state.setIn ['sparks', spark.id], spark
    state



exports.default = aa
