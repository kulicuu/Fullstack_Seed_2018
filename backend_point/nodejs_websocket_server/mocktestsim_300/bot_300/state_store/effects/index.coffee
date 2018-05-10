


api = {}


api = fp.assign api, require('./init_primus').default
api = fp.assign api, require('./generic_api_calls').default
api = fp.assign api, require('./mission_300').default






keys_api = _.keys api




effects_precursor = ({ Dispatch, env }) ->
    # Probably won't need env here, but it may prove useful far into the future.

    dispatch = (opts) ->
        Dispatch.emit 'new_action', { action: opts }

    ({ state }) ->
        c 'state', state
        state.get('effects').map (effect, eid) ->
        # c state.get('effects'), 'effects'
        # _.map state.get('effects'), (effect, eid) ->
            # etype = effect.get 'type'
            c 'effect', effect
            c 'eid', eid
            etype = effect.type
            if ( _.includes keys_api, etype )
                c '111111111'
                api[etype] { effect, state, dispatch }
            else
                c 'No-op in effects with type', etype
                # NOTE No logs in prod. TODO Look into production logging for this sort of thing, debounced




exports.default = effects_precursor
