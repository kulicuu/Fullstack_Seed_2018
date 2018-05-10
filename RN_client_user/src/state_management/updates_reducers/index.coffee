

shortid = require 'shortid'
_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'

aa = {}
c = console.log.bind console





# given some cogniot authorisation action, put the relevant tokens and such into
# state. During development we may fire this directly from Ufo view, or better maybe from an effects group.
aa.update_cognito_auth_state = ({ state, action }) ->
    # TODO: attach payload relevant parts to state

    state





aa.net_info_data = ({ state, action }) ->

    state.set 'net_info', ( Imm.Map net_info )

    # { net_info } = action.payload
    # c 'net_info', net_info.type
    #
    # state = state.set 'test1', Imm.Map({ hello: 63 })
    # # c 'state looks like', state.getIn(['test1']).get('hello')
    # # g = state.getIn(['test1']).toJS()
    # g = Imm.List([ 1, 2, 3, 4 ])
    # h = [ 1, 2, 3, 4 ]
    # state = state.set 'test2', Imm.List(h)
    # state = state.set 'test7', (g.map.toString() )
    #
    # state = state.set 'net_info', net_info

    # state


aa.net_info_update_data = ({ state, action }) ->
    { net_info } = action.payload
    state.set 'net_info', ( Imm.Map net_info )


# NOTE: TODO: The individual gotos can be replaced with this



aa.use_photo = ({ state, action }) ->
    state = state.set 'cursor_post_product_photos', (state.get 'cursor_post_product_photos').push(action.payload.snapshot)
    state = state.set 'nav_loc', 'post_product'
    state = state.setIn ['effects', shortid()], action
    state

aa.process_snapshot = ({ state, action }) ->
    # NOTE: probably will alter state here for feedback.
    state = state.setIn ['effects', shortid()], action
    state



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


aa.send_cognito_signup_data = ({ state, action }) ->
    state.setIn ['effects', shortid()],
        type: 'send_cognito_signup_data'
        payload: action.payload


aa.send_signup_candide = ({ state, action }) ->
    state.setIn ['effects', shortid()],
        type: 'send_signup_candide'
        payload: action.payload








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








# NOTE Don't put this on state, just a shared object reference should be fine  In fact this needn't even be in
# state, as primus will only ever be used from effects.  Maybe developer info would want to know if it were updated
# aa.set_primus_instance = ({ state, action }) ->
#     state = state.set 'primus', action.payload.primus
#     state






aa.local_http_primus_have_data = require('./primus_have_data').local_http_primus_have_data

aa.dgoc_http_primus_have_data = require('./primus_have_data').dgoc_http_primus_have_data




exports.default = aa
