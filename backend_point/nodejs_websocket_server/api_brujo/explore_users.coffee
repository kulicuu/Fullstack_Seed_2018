




aa = {}




aa.get_all_users_list = ({ spark, payload }) ->
    # c 'payload2', payload
    r.table('users').run  cn
    .then (cursor) ->
        # c cursor.next()
        # c 'cursor', cursor
        cursor.toArray()
        .then (rayy) ->
            c 'rayy', rayy
            spark.write
                type: 'res_get_all_users'
                payload:
                    all_users: rayy









exports.default = aa
