






aa = {}





aa = fp.assign aa, require('./report').default






keys_aa = _.keys aa





worker_api = ({ state, action }) ->
    { type, payload } = action.payload.data

    if ( _.includes keys_aa, type )
        aa[type] { state, action }
    else
        c (color.white "asntaoheusntaheustnaoheustaheo", on), "no-op in workerapi with type #{type} "
        state











exports.default = worker_api
