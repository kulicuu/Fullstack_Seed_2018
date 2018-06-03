




mission_initial_states =

    mission_300: () ->
        Imm.Map
            var_one: 324
            var_two: 30894
            var_three: "aeuaeu"






aa = {}




missions = {}


missions.mission_300 = ({ state, action, effects_q }) ->
    c '3030303030303', (state.get 'user_assigned')

    effects_q["#{shortid()}"] =
        type: 'gapic_tbnth'
        payload:
            type: 'send_signup_candide'
            payload:
                email_candide: state.get('user_assigned').email
                pwd: state.get('user_assigned').pwd

    state


aa.res_report_for_duty = ({ state, command, effects_q }) ->
    # c 'command', command, 'command'
    { the_token, mission_code, user_assigned, stuff_assigned } = command.payload
    c color.red((JSON.stringify user_assigned), on), 'user_assigned'
    state = state.set 'token', the_token
    state = state.set 'mission_code', mission_code
    state = state.set 'user_assigned', user_assigned
    state = state.set 'stuff_assigned', stuff_assigned
    state = state.set 'mission_state', mission_initial_states[mission_code]() # can pass other stuff to initiate it
    if (_.includes (_.keys missions), mission_code)
        missions[mission_code] { state }
    else
        state









keys_aa = _.keys aa














exports.default = ({ state, command }) ->
    type = command.type
    if _.includes keys_aa, type
        aa[type] { state, command }
    else
        c color.red('no op incoming command api', on), type
        state
