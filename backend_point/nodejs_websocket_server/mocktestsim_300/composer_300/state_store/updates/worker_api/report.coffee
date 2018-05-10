
#
#
#
#
# mock_users =
#     albert:
#         username: "albert"
#         email: "albert@snth"
#         pwd: "stnh84pa"
#     andrew:
#         username: "andrew"
#         email: "andrew@aeou"
#         pwd: "sea04ph"
#     zeke:
#         username: 'zeke'
#         email: "zeke@l0pheu"
#         pwd: "489puhseut"
#     winston:
#         username: 'winston'
#         email: 'winston@hello'
#         pwd: 'H(*EUHL*EHeutuh)'





aa = {}












aa.report_for_duty = ({ state, action }) ->
    { spark_id, data } = action.payload
    c (color.green '838383BOT REPORTS FOR DUTIY8388383838', on), spark_id
    some_avail_user = state.get('user_base').find (v, k) ->
        v.get?('assigned') is false

    if some_avail_user
        username = some_avail_user.getIn ['arq', 'username']
        c 'username', username

        state = state.setIn ['user_base', username, 'assigned'], true

        the_token = v4()
        spark = state.getIn [ 'sparks', spark_id ]
        spark.headers.bot_token = the_token
        state = state.setIn ['sparks', spark_id], spark


        state = state.setIn ['effects', shortid()],
            type: 'res_report_for_duty'
            payload:
                spark_id: spark_id
                the_token: the_token
                mission_code: "mission_300"
                user_assigned: some_avail_user.get('arq').toJS()


    state











exports.default = aa
