



# NOTE: The Primus client library can be required from a CDN which would allow fast patching of the on-air network without waiting for a version rollout.


api_000 = require('./api_000.coffee').default




spark_handle = (spark) ->
    spark.on 'data', (data) ->
        c ''
        c 'spark at https server  has data ', data





exports.default = (primus) ->
    setInterval ->
        primus.write
            type: 'https heartbeat https https https 8888888888'
            payload: { aaa: 43824 }
    , 400





    primus.on 'connection', (spark) ->
        spark_handle spark
        # spark.on 'data', (data) ->
        #     c 'spark at server  has data ', data
