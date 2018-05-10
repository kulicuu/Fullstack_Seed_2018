






global.flow = require 'async'
global.Bluebird = require 'bluebird'
global.Imm = require 'immutable'
global.c = console.log.bind console
global._ = require 'lodash'
global.fp = require 'lodash/fp'
global.color = require 'bash-color'
global.shortid = require 'shortid'
global.v4 = require 'uuid/v4'
global.path = require 'path'
global.r = require 'rethinkdb'

# Bluebird.promisifyAll r






# NOTE TODO :

#              Rationalise and implement according to whether or not the RethinkDB connections should be shared (among server and testers for one thing.)
#
# TODO Move the database client/server connection handling and database (named db) into effects, it will need to be configurable in live mode.



module.exports = Bluebird.promisify (cb) ->



    r.connect {db: 'terebinth_db_000'} # NOTE The name here should really be drawn from env
    # ..., maybe connect to a default env db which will have a pointer to the db for the app instance.
    # There will be some meta-system db and then a whole set of dbs for the app instances.
    .error (e) ->
        c color.red("rethinkdb connection error: #{JSON.stringify e}")
    .then (cn) ->
        r.dbList().run cn
        .error (e) ->
            c color.red("rethinkdb list error: #{JSON.stringify e}")
        .then (the_list) ->
            if (_.includes the_list, 'terebinth')
                global.cn = cn
                cb null, { status: true }
            else
                r.dbCreate().run cn
                .error (e) ->
                    c color.red("rethinkdb create error: #{JSON.stringify e}")
                .then ({ create_info }) ->
                    c 'created terebinth db', (JSON.stringify create_info)
                    cb null, { status: true}
