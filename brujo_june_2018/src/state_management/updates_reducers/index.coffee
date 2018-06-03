

shortid = require 'shortid'
_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
aa = {}
c = console.log.bind console



aa.net_info_data = ({ state, action }) ->
    state.set 'net_info', ( Imm.Map net_info )


aa.net_info_update_data = ({ state, action }) ->
    { net_info } = action.payload
    state.set 'net_info', ( Imm.Map net_info )


aa.dev_nav_goto = ({ state, action }) ->
    state.set 'nav_loc', action.payload



aa.nav_goto = ({ state, action }) ->
    state.set 'nav_loc', action.payload


aa.cognito_login = ({ state, action }) ->
    { AWS, result } = action.payload
    #TODO Make an effect that puts creds into AsyncStorage,
    # NOTE: Here we can add essential credentials to state.
    # We'll see what essentials there are when we try S3.

    state




aa.set_username = ({ state, action }) ->
    state.set 'username', action.payload.username











# NOTE: These are deprecated and should be removed when convenient:

aa.nav_product_detail = ({ state, action }) ->
    state = state.setIn 'nav_loc', 'product_detail'
    state


aa.nav_gallery_loc = ({ state, action }) ->
    state = state.setIn 'nav_loc', 'onboarding_location'
    state


aa.dev_goto_onboarding_gallery_sub_1 = ({ state, action }) ->
    state = state.setIn 'nav_loc', 'onboarding_gallery_sub_1'
    state

aa.dev_goto_onboarding_gallery = ({ state, action }) ->
    state = state.set 'nav_loc', 'onboarding_gallery'
    state

aa.dev_goto_onboarding_location = ({ state, action }) ->
    state = state.set 'nav_loc', 'onboarding_location'
    state

aa.dev_goto_signin = ({ state, action }) ->
    state = state.set 'nav_loc', 'signin'
    state










aa.res_init_primus = ({ state, action, effects_q }) ->
    state = state.set 'primus_ready', true
    effects_q.init_brujoTerm =
        type: 'gapic_brujo'
        payload:
            type: 'init_brujoTerm'
            payload:
                token: 'aeousnth'

    state



aa.local_http_primus_have_data = require('./primus_have_data').local_http_primus_have_data

aa.dgoc_http_primus_have_data = require('./primus_have_data').dgoc_http_primus_have_data




exports.default = aa
