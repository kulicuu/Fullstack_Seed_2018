

EventEmitter = require 'events'
class Emitter extends EventEmitter
process.setMaxListeners 10000


module.exports = Bluebird.promisify ({ env }, cb) ->
    c 'env in state idx', env
    state = require('./initial_state').default { env }

    Dispatch = new Emitter()
    effects = require('./effects').default { Dispatch, env }


    effects_q =
        "#{shortid()}":
            type: 'init_primus'


    updates = require('./updates').default { effects_q }


    Dispatch.on 'new_action', ({ action }) ->
        state = updates { state, action }
        effects { effects_q, state }


    dispatch = (opts) ->
        Dispatch.emit 'new_action', { action: opts }



    effects { effects_q, state }
    cb null, { Dispatch }
