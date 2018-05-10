


















api_user_000 = require('./api_user').default





spark_arq = {}


spark_handle = (spark, primus) ->

    # NOTE TODO :  Security processes here auditing ip ,
    # passing this info to the database.
    # There may be a microservice.


    { headers, address, query, id, request } = spark



    spark_arq[spark.id] = spark




    spark.on 'data', (data) ->
        c 'spark at server  has data ', data
        api_user_000 { spark, data }










exports.default = (primus) ->

    setInterval ->
        primus.write
            type: 'heartbeat'
            payload: { aaa: 43 }
    , 1000




    primus.on 'connection', (spark) ->
        c 'server has connection with spark', ( _.keys spark ),(_.keys  spark.headers)
        c 'more spark info', (_.keys spark.address)
        _.map spark.address, (v, k) ->
            c  (color.blue k, on), (color.blue v, on)



        spark_handle spark, primus





    primus.on 'error', (e) ->
        c 'primus error', e
        # should send a message here to the database, some message queue for errors.
