










api_brujo = require('./api_brujo').default


spark_arq = {}


spark_handle = (spark, primus) ->

    # NOTE TODO :  Security processes here auditing ip ,
    # passing this info to the database.
    # There may be a microservice.


    { headers, address, query, id, request } = spark

    # NOTE : The spark reference should be maintained in state in order that if necessary the connection can be ended by a push notification from a connection-auditing microservice.   Each NodeJS node is only responsible for its sparks, obivously.  Spark ids will not persist.
    # We'll need to remove inactive sparks from spark_arq

    spark_arq[spark.id] = spark
    # c 'now spark_arq', (_.keys spark_arq).length



    spark.on 'data', (data) ->
        c color.yellow "'spark at brujo-server  has data ', data"
        api_brujo { spark, data }









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
