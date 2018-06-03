

c = console.log.bind console


Primus = require('../../client_libs/http_primus.js')
https_Primus = require('../../client_libs/https_primus.js')


aa = {}

aa = fp.assign aa, require('./generic_api_call').default

aa.placeholder = ->
    43


p1 = {} # local http primus
p2 = {} # local https primus



import React, {NetInfo} from 'react-native'


primus_config =
    url: 'http://127.0.0.1:8999'








# aa.init_brujoTerm = ({ effect, state_store }) ->
#     c 'initing init_brujoTerm'


# aa.init_netinfo = ({ effect, state_store }) ->
#     NetInfo.getConnectionInfo()
#     .then (net_info) ->
#         state_store.dispatch
#             type: 'net_info_data'
#             payload: { net_info }
#
#
#     NetInfo.addEventListener 'connectionChange', (net_info) ->
#         state_store.dispatch
#             type: 'net_info_update_data'
#             payload: { net_info }








aa.init_primus = ({ effect, state_store }) ->

    c '...........\n\n 9838388383838383838'
    ss = state_store # faster typing, NOTE change the name at some point like:
        # state_store = ss
        # for backwards compatibility

    p1 = http_local_primus = new Primus({url: 'http://127.0.0.1:8999'}, {websockets: true})
    global.p1 = p1

    http_local_primus.on 'open', ->
        c 'local http primus is open3333'


    http_local_primus.on 'error', (e) ->
        c 'primus error', e
        state_store.dispatch
            type: 'local_http_primus_error'
            payload: { e }


    http_local_primus.on 'data', (data) ->
        # c data, 'data event,'
        state_store.dispatch
            type: 'local_http_primus_have_data'
            payload:
                data: data
                server_type: 'http_local'


    p1.on 'incoming::ping',  ->
        c 'incoming ping', arguments


    p1.on "end",  ->
        state_store.dispatch
            type: 'local_http_primus_ends'
            payload: arguments


    p1.on "destroy", ->
        c "destroy", arguments


    p1.on "timeout", ->
        state_store.dispatch
            type: "http_local_primus_timeout"

    p1.on "readyStateChange", ->
        # c arguments, "readyStateChange"


    p1.on "incoming::data", ->
        # c arguments, "primus incoming::data event"

    p1.on "outgoing::data", ->
        c arguments, "primus outgoing:data event"


    p1.on "offline", ->
        c arguments, "primus offline event"
        state_store.dispatch
            type: "http_local_primus_offline"


    p1.on "heartbeat", ->
        c arguments, "primus heartbeat event"
        state_store.dispatch
            type: "http_local_primus_heartbeat"


    # https_local_primus = new https_Primus({ url: 'https://127.0.0.1:7084' }, { websockets: true })
    #
    #
    # https_local_primus.on 'open', ->
    #     state_store.dispatch
    #         type: 'local_https_primus_have_open'
    #
    #
    # https_local_primus.on 'error', (e) ->
    #     c 'primus error', e
    #     state_store.dispatch
    #         type: 'local_https_primus_have_error'
    #         payload: { e }
    #
    #
    # https_local_primus.on 'data', (data) ->
    #     # c 'data', data
    #     state_store.dispatch
    #         type: 'local_https_primus_have_data'
    #         payload: { data }




    state_store.dispatch
        type: 'res_init_primus'
        payload:
            status: 'OK'








exports.default = aa
