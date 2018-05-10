








EventEmitter = require 'events'
class Emitter extends EventEmitter
process.setMaxListeners 10000



module.exports = Bluebird.promisify ({ env }, cb) ->
    c 'env in state idx', env
    state = require('./initial_state').default { env }

    updates = require('./updates').default


    Dispatch = new Emitter()


    effects = require('./effects').default { Dispatch, env }


    Dispatch.on 'new_action', ({ action }) ->

        state = updates { state, action }
        effects { state }

    dispatch = (opts) ->
        Dispatch.emit 'new_action', { action: opts }


    effects { state }
    cb null, { Dispatch }
