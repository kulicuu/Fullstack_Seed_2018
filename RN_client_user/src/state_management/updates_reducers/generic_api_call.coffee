


aa = {}


# NOTE This is a
# normal user api call generic. It may replace half or more of the
# boilerplate updates effects calls.
# This may be able to replace lots of feature by feature boilerplate code in
# at least the effects part. In the updatesreducers space may still need the
# files for specific response type listeners.


aa.gapic = ({ state, action }) ->
    state = state.set 'effects', state.get('effects').merge Imm.Map
        "#{shortid()}":
            type: 'generic_user_api_call'
            payload: action.payload
    state






exports.default = aa
