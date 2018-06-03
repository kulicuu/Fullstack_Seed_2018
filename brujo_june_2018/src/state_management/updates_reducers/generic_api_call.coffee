






aa = {}







aa.gapic_brujo = ({ state, action, effects_q }) ->
    effects_q["#{shortid()}"] =
        type: 'gapic_brujo'
        payload: action.payload



exports.default = aa
