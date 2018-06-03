

aa = {}






aa.init_primus_complete_worker = ({ state, action, effects_q }) ->
    c '33333'


    effects_q["#{shortid()}"] =
        type: 'gapic_cmdr'
        payload:
            type: 'report_for_duty'


    state




exports.default = aa
