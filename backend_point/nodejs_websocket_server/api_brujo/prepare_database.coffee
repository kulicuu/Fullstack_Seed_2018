







# NOTE We're wrapping the main rethinkdb functions to eventually layer over our own error handler
# general solution, should be less boilerplate to type in the long run.




adm = {}






adm.grant = ({ r, db_name, payload }) ->
    { username } = payload
    r.db('users').grant username,






config_table = Bluebird.promisify (cb, stuff) ->
    { tablename } = stuff
    r.table(tablename).config().update({ write_acks: 'single' }).run cn, (err, res) ->
        if err
            c err
            cb err
        else
            cb null, 'OK'




create_db = Bluebird.promisify ({ db_name }, cb) ->
    r.dbCreate(db_name).run cn, (err3, create_info) ->
        if err3
            c err3
            cb err3
        else
            cb null, { create_info }




drop_db = Bluebird.promisify ({ db_name }, cb) ->
    r.dbDrop(db_name).run cn, (err2, drop_info) ->
        if err2
            c err2
            cb err2
        else
            cb null, { drop_info }




list_databases = Bluebird.promisify (cb, { payload }) ->





switch_cn_to_db = Bluebird.promisify ({ db_name }, cb) ->
    global.cn.use(db_name)
    cb null, { status: true }




# assumes db is clear blank slate.
setup_initial_state_in_db = Bluebird.promisify (cb) ->

    c '...'

    flow.parallel [
        (cb2) ->
            r.tableCreate('users').run cn
            .error (e) ->
                c 'err on tableCreate', e
                cb2 e
            .then (user_tableCreate_info) ->
                cb2 null, { user_tableCreate_info }
        (cb2) ->
            r.tableCreate('stuff').run cn
            .error (e) ->
                c e
            .then (stuff_tableCreate_info) ->
                cb2 null, { stuff_tableCreate_info }
    ], (err, res) ->
        if err
            c 'err', err
        else
            # c 'res', res
            { user_tableCreate_info } = res[0]
            { stuff_tableCreate_info } = res[1]
            # c 'stuff create info', user_tableCreate_info, stuff_tableCreate_info
            r.tableList().run cn
            .then (table_list) ->
                # c 'table_list', table_list
                cb null, { status: true, user_tableCreate_info, stuff_tableCreate_info }








aa = {}








aa.overwrite_and_instantiate_db = ({ payload, spark }) ->
    { db_name } = payload
    r.dbList().run cn, (err, db_names_rayy) ->
        if err
            c err
        else
            if ( _.includes db_names_rayy, db_name)
                drop_db { db_name }
                .then ({ drop_info }) ->
                    create_db { db_name }
                    .error (e) ->
                        c 'e', e
                    .then ({ create_info }) ->
                        switch_cn_to_db { db_name }
                        .error (e) ->
                            c 'e on switch', e
                        .then ({ status }) ->
                            setup_initial_state_in_db()
                            .error (e) ->
                                c 'err on setup_initial_state_in_db', e
                            .then ({ status }) ->
                                if status is true
                                    c 'done'
                                    spark.write
                                        type: 'res_overwrite_and_instantiate_db'
                                        payload:
                                            status: true
                                            db_name: db_name
                                            drop_info: drop_info or null
                                            create_info: create_info or null
                                else
                                    c 'some kind of error.'

                .error (e) ->
            else
                create_db { db_name }
                .then ->
                    setup_initial_state_in_db()
                    .error (e) ->
                        c 'err on setup_initial_state_in_db', e
                    .then ({ status }) ->
                        if status is true
                            c 'done'
                            spark.write
                                type: 'res_overwrite_and_instantiate_db'
                                payload:
                                    status: true
                                    db_name: db_name
                                    drop_info: drop_info or null
                                    create_info: create_info or null
                        else
                            c 'some kind of error.'






aa.list_databases = ({ payload, spark }) ->
    list_databases({ payload })
    .then ->
        spark.write
            type: 'res_list_databases'
            payload: "placeholder"






aa.clear_database_start_fresh = ({ payload, spark }) ->











aa.save_database_to_name = ({ payload, spark }) ->












# This function assumes a clean empty RethinkDB database.
aa.write_initial_state = ({ payload, spark }) ->


    # At some point we could draw the initial state from
    # the payload but for now can define it in this file or
    # in a more stratified space.



notes = "

list_databases







"








exports.default = aa
