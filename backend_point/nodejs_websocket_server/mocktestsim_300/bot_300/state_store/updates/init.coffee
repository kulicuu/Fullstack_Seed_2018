

aa = {}






aa.init_primus_complete_worker = ({ state, action }) ->
    c '33333'
    state = state.setIn ['effects', shortid()],
        type: 'gapic_cmdr'
        payload:
            type: 'report_for_duty'


    state




exports.default = aa
