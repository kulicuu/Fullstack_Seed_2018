




# NOTE This usage is deprecated.  The primus instances processed in index init_primus
# will be passed to the




aa = {}




aa.send_cognito_signup_data = ({ effect, state_store }) ->
    primus = p1 # NOTE: Think about how to normalize this through the dev to prod stages.
    primus.write effect



aa.send_signup_candide = ({ effect, state_store }) ->
    # primus = http_local_primus
    primus = p1
    primus.write
        type: 'send_signup_candide'
        payload: effect.payload




exports.default = aa
