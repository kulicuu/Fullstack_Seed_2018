



get_all_the_things_from_db = Bluebird.promisify (cb) ->
    r.table('stuff').run cn
    .error (e) ->
        c 'e', e
        cb e
    .then (cursor) ->
        cursor.toArray()
        .error (e) ->
            c 'e', e
            cb e
        .then (thing_rayy) ->
            cb null, { thing_rayy }






aa = {}



aa.request_stuff_catalogue_things_type_064 = ({ payload, spark }) ->




aa.request_stuff_catalogue_things_type_053 = ({ payload, spark }) ->




# to populate a product/service list by maybe a locational filter
aa.filtered_catalogue_search = ({ payload, spark }) ->







# NOTE This should not really be on the user_api, also, the response
# when quite heavy may be better over rest than websocket but I don't know if
# that's for sure true., but it can serve as a prototype with a version that
# does a lot more filtering.
aa.get_all_the_things = ({ payload, spark }) ->
    { the_token, the_user } = payload
    { the_email } = the_user
    assess_session { the_token, the_email, spark }
    .error (e) ->
        c 'e', e
    .then ({ session_status }) ->
        if session_status.status is true
            get_all_the_things_from_db()
            .error (e) ->
                c 'e', e
            .then ({ thing_rayy }) ->
                spark.write
                    type: 'res_get_all_the_things'
                    payload: { thing_rayy }
        else












exports.default = aa
