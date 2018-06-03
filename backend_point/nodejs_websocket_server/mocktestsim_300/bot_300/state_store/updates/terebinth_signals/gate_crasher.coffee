











aa = {}





aa.res_post_a_thing = ({ state, action, effects_q }) ->
    c color.purple "satoehnusantehusanthusntaheusnth", on
    c action.payload


    state



aa.res_login = ({ state, action, effects_q }) ->
    c color.cyan "santehusantehusatnehusatnehusatnehusatnehusatehusath", on

    c 'action.payload', action.payload
    { status, the_token } = action.payload

    # state = state.setIn ['effects', shortid()],
    effects["#{shortid()}"] =
        type: 'gapic_tbnth'
        payload:
            type: 'post_a_thing'
            payload:
                the_token: the_token
                the_user: state.get('user_assigned')
                the_thing: state.get('stuff_assigned')



    state



aa.res_signup = ({ state, action, effects_q }) ->
    c color.purple "satenohusantehusatnheustaheusntahesuntahseutnhasenth", on
    state = state.set 'user', state.get('user_assigned') # change this to get this from the server.
    effects_q["#{shortid()}"] =
        type: 'gapic_tbnth'
        payload:
            type: 'send_login_candide'
            payload: state.get('user_assigned')

    state











exports.default = aa
