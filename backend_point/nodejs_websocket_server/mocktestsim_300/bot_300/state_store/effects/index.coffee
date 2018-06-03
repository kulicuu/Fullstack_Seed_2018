


api = {}


api = fp.assign api, require('./init_primus').default
api = fp.assign api, require('./generic_api_calls').default
api = fp.assign api, require('./mission_300').default






keys_api = _.keys api




effects_precursor = ({ Dispatch, env }) ->
    # Probably won't need env here, but it may prove useful far into the future.

    dispatch = (opts) ->
        Dispatch.emit 'new_action', { action: opts }

    ({ effects_q, state }) ->

        c color.purple 99999999999, on
        c effects_q, 'effects_q'
        if _.size(effects_q) > 0

            _.map effects_q, (effect, eid) ->
                etype = effect.type
                delete effects_q[eid]
                if ( _.includes keys_api, etype )
                    c '111111111'
                    api[etype] { effect, state, dispatch }
                else
                    c 'No-op in effects with type', etype
                    # NOTE No logs in prod. TODO Look into production logging for this sort of thing, debounced




exports.default = effects_precursor
