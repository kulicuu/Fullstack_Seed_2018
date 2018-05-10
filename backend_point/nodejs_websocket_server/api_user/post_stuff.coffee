







# template for post-product/service
put_thing_in_db = Bluebird.promisify ({ the_thing, the_email }, cb) ->
    the_thing = fp.assign the_thing, {the_thing_id : v4()}
    flow.parallel [
        (cb2) ->
            r.table('users').get(the_email).run cn
            .error (e) ->
                c 'e', e
            .then (the_user) ->
                the_user.things.push the_thing.the_thing_id
                r.table('users').get(the_email).update({ things: the_user.things }).run cn
                .error (e) ->
                    c 'e', e
                    cb2 e
                .then (update_res) ->
                    cb2 null, { update_res }
        (cb2) ->
            r.table('stuff').insert(the_thing).run cn
            .error (e) ->
                c 'e', e
                cb2 e
            .then (insert_res) ->
                cb2 null, { insert_res }
    ], (err, res9) ->
        if err
            c 'err', err
        else
            cb null, { status: true }













aa = {}



aa.post_thing_type_064 = ({ payload, spark }) ->




aa.post_thing_type_053 = ({ payload, spark }) ->






aa.get_all_my_things = ({ payload, spark }) ->



aa.delete_a_thing = ({ payload, spark }) ->



aa.modify_a_thing = ({ payload, spark }) ->




aa.post_a_thing = ({ payload, spark }) ->
    { the_token, the_user, the_thing } = payload
    the_email = the_user.email
    assess_session { the_token, the_email, spark }
    .error (e) ->
        c 'e', e
    .then ({ session_status }) ->
        if session_status.status is true
            # TODO: post the thing.

            put_thing_in_db { the_thing, the_email }
            .error (e) ->
                c 'e', e
            .then ->
                spark.write
                    type: 'res_post_a_thing'
                    payload:
                        status: true
                        message: 'the thing was posted'
        else
            spark.write
                type: 'res_post_a_thing'
                payload: { status: false, reason: 'bad session'}












exports.default = aa
