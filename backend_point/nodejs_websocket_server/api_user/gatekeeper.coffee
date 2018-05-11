



# NOTE While the architecture specifies AWS Cognito for user-mgmt,
# for a lot of development/testing can swap with a basic module
# This file should contain handlers for the Cognito solution, and should also containn handlers for the dev-module gatekeeper, and both handlers should meet at a common downstream handler.



bcrypt = require 'bcrypt'
salt_rounds = 10






user_pattern = Bluebird.promisify ({ email_candide, pwd }, cb) ->
    bcrypt.hash pwd, salt_rounds, (err, hash) ->
        cb null,
            user_arq:
                id: email_candide
                email: email_candide
                hash: hash
                things: []








# Private functions















create_new_user = Bluebird.promisify ({ email_candide, pwd }, cb) ->
    user_pattern { email_candide, pwd }
    .then ({ user_arq }) ->
        r.table('users').insert(user_arq).run cn, (err, res) ->
            if err
                cb { err }
            else
                cb null, { status: true, user: user_arq }



check_email_avail = Bluebird.promisify ({ email_candide }, cb) ->
    r.table('users').get(email_candide).run cn #, (err, res3) ->
    .catch (e) ->
        c 'caought', e
        cb e
    .error (e) ->
        c 'e', e
        cb e
    .then (res3) ->
        if res3 is null
            cb null, { status: true }
        else
            cb null, { status: false }





get_user_by_email = Bluebird.promisify ({ email_candide }, cb) ->
    r.table('users').get(email_candide).run cn
    .error (e) ->
        cb e
    .then (the_user) ->
        cb null, { the_user }



assess_password = Bluebird.promisify ({ hash, pwd }, cb) ->
    bcrypt.compare pwd, hash, (err, pwd_is_good) ->
        if err
            cb err
        else
            cb null, { pwd_is_good }




# Will need something like this
handle_session_renew = Bluebird.promisify ({ stuff }, cb) ->
    cb null


# session initialise, we may need to factor part of this out for
# session activate

handle_session_initialise = Bluebird.promisify ({ the_user, spark }, cb) ->
    # NOTE Here we'll use JSON Web Tokens, but initially just a uuid by v4 function
    # TODO Basically we need to
    # 1. attach the token in a way that expires to the user record, so that, if another server in the cluster picks up a new
    # websocket connection (connection dropped, reconnect process finds another server), the user has an active session with this token and everything is seamless.
    # 2. Also we should attach a property to the Spark.  I think this is permitted.  This way when another request comes through on a sustained
    # websocket connection (to the same server) we can much more quickly auth
    # the request.
    # NOTE: Also this is the place to do a bunch of clerical, security, analytical work.  Take the IP address, log it, that sort of thing.  Might update "last login" feature etc, although may not want to go too far into this because Cognito can handle most of it.

    prim_token = v4()
    the_now = Date.now()

    session = { prim_token, timestamp: the_now }

    r.table('users').get(the_user.email).update({ session }).run cn
    .error (e) ->
        cb e
    .then (res) ->
        spark.headers.terebinth_auth = session
        cb null,
            status: true
            the_token: prim_token
            spark: spark









get_user_session = Bluebird.promisify ({ the_email }, cb) ->
    r.table('users').get(the_email).run cn
    .error (e) ->
        c 'e', e
        cb e
    .then (the_user) ->
        # c 'have the user', the_user
        cb null, { the_session: the_user?.session? }




assess_token = Bluebird.promisify ({ the_token, the_session }, cb) ->
    { prim_token, timestamp } = the_session
    the_now = Date.now()
    if prim_token is the_token
        if the_now < ( timestamp + 60 * 60 * 1000)
            cb null, { status: true }
        else
            cb null, { status: false, reason: "expired_token" }
    else
        cb null, { status: false, reason: "wrong_token" }



# We make this function global so that it can be accessed by any api_user
# function for auths.
global.assess_session = Bluebird.promisify ({ the_token, the_email, spark }, cb) ->
    # first we check the spark (primus object) to see if the session is on that.  We assume it's already on rethinkdb if its on the spark.
    if _.includes ( _.keys spark.headers ), 'terebinth_auth'
        the_session = spark.headers.terebinth_auth
        assess_token { the_token, the_session }
        .error (e) -> c 'e', e
        .then (session_status) ->
            cb null, { session_status, spark }
    else
        # It may be a fresh spark after a reconnect so we look for the session in rethinkdb.
        get_user_session { the_email }
        .error (e) ->
            c 'e', e
        .then ({ the_session }) ->
            # if the_session.prim_token is the_token
            assess_token { the_token, the_session }
            .error (e) ->
                c 'e', e
            .then (session_status) ->
                # if the session is good we need to attach it to the spark
                if session_status.status is true
                    spark.headers.terebinth_auth = the_session
                cb null, { session_status, spark }





# ----API below,  private agents above --------








aa = {}






aa.greet_establish_status = ({ payload, spark }) ->
    # NOTE: the native clients 'know' who they are generally but the failsafe and to establish the nature of the relationship we can share a token stored client side and refreshed periodically.
    # this could be stored in nodejs state, it could also maybe be stored on the spark itself, another place in nodejs memory.  an alterative would just check the token before every other relevant, protected api key










# Waiting on data from
aa.send_google_signinup = ({ payload, spark }) ->


# Waiting on data from Mark.
aa.send_facebook_signinup = ({ payload, spark }) ->


# all account types (google, facebook, email account auths)
aa.send_signout = ({ payload, spark }) ->


# with email password
aa.send_signin_candide = ({ payload, spark }) ->

# with email password






# Basic own-rolled auth flow stuff:




aa.orient = ({ payload, spark }) ->
    # c 'session 090 test'
    { the_email, the_token } = payload
    assess_session { the_token, the_email, spark }
    .error (e) ->
        c 'e', e
    .then ({session_status, spark}) ->
        # c 'session_status', session_status
        if session_status.status is true
            # c 'Authed Can perform actions on behalf of this user'
            get_user_by_email { email_candide: the_email }
            .error (e) ->
                c 'e', e
            .then ({ the_user }) ->
                spark.write
                    type: 'res_orient'
                    payload: { the_user, status: true }
        else
            # c "Not authed can return some demand to re-authenticate."
            spark.write
                type: 'res_orient'
                payload: { status: false }



aa.send_signup_candide = ({ payload, spark }) ->
    # NOTE: Script out the Signup process  Signup-New-User:
    # - check if credentials correct format.
    # c 'payload', payload
    # c color.blue '22229929292', on
    # c payload, 'payload'
    { email_candide, pwd } = payload
    check_email_avail
        email_candide: email_candide
    .error (e) ->
        c 'error', e
        spark.write
            type: 'res_signup'
            payload:
                status: 'BAD'
                reason: 'There was an error.'
    .then ({ status }) ->
        if status is true

            create_new_user { email_candide, pwd }
            .then ({ status, user }) ->
                handle_session_initialise { the_user: user, spark }
                .error (e) ->
                    c 'e', e

                .then ({ the_token, spark }) -> # NOTE: redundant to be passing the spark back explicitly, it will be mutated anyway.
                    spark.write
                        type: 'res_signup'
                        payload: { status, the_token }

        else
            spark.write
                type: 'res_signup'
                payload: { status: "BAD", reason: "EMAIL ADDRESS ALREADY IN USE" } # TODO Improve protocol naming etc.




aa.check_email_avail = ({ payload, spark }) ->
    check_email_avail
        email_candide: payload.email_candide
    .then ({ status }) ->
        spark.write
            type: 'res_check_email_availability'
            payload: { status }





aa.send_login_candide = ({ payload, spark }) ->
    { username, email, pwd } = payload
    get_user_by_email { email_candide: email }
    .error (e) ->
        c 'e', e
    .then ({the_user}) ->
        { hash } = the_user
        assess_password { hash, pwd }
        .catch (e) ->
            c 'e', e
        .error (ee) ->
            c 'caught', ee
        .then ({ pwd_is_good }) ->
            if pwd_is_good
                # handle_positive_login { the_user, spark }
                handle_session_initialise { the_user, spark }
                .error (e) ->
                    c 'e', e, 'e'
                .then ({ the_token }) ->
                    spark.write
                        type: 'res_login'
                        payload:
                            status: true
                            the_token: the_token
            else
                spark.write
                    type: 'res_login'
                    payload:
                        status: false




aa.test_session_090 = ({ payload, spark }) ->
    c 'session 090 test'
    { the_email, the_token } = payload
    assess_session { the_token, the_email, spark }
    .error (e) ->
        c 'e', e
    .then ({session_status, spark}) ->
        c 'session_status', session_status
        if session_status.status is true
            c 'Authed Can perform actions on behalf of this user'
            spark.write
                type: 'res_test_session_090'
                payload: { status: true }
        else
            c "Not authed can return some demand to re-authenticate."
            spark.write
                type: 'res_test_session_090'
                payload: { status: false }




aa.test_session_080 = ({ payload, spark }) ->
    { the_token, the_email } = payload
    if _.includes ( _.keys spark.headers ), 'terebinth_auth'
        the_session = spark.headers.terebinth_auth
        assess_token { the_token, the_session }
        .error (e) ->
            c 'e', e
        .then (outbound_payload) ->
            spark.write
                type: 'res_test_session_080'
                payload: outbound_payload
    else
        # It may be a fresh spark after a reconnect so we look for that.
        get_user_session { the_email }
        .error (e) ->
            c 'e', e
        .then ({ the_session }) ->
            # if the_session.prim_token is the_token
            assess_token { the_token, the_session }
            .error (e) ->
                c 'e', e
            .then (outbound_payload) ->
                # if the session is good we need to attach it to the spark
                if outbound_payload.status is true
                    spark.headers.terebinth_auth = the_session
                spark.write
                    type: 'res_test_session_080'
                    payload: outbound_payload









# ----------------------------------------------------------------
# AWS specific stuff :


# example_signup_data_from_cognito =
#     user:
#         username: 'tigger10'
#         pool:
#             userPoolId: 'us-east-xxxxxxxx'
#             clientId: 'xxxxxxxxxxxxx'
#             advancedSecurityDataCollectionFlag: true
#             Session: null
#     client:
#         endpoint: 'https://cognito-idp.us-east-1.amazonaws.com/'
#         userAgent: 'aws-amplify/0.1.x react-native'
#     signInUserSession: null
#     authenticationFlowType: 'USER_SRP_AUTH'
#     userConfirmed: false
#     userSub: 'xxxxxxxxxxxxxxxxxxxxe'


# TODO Rename
aa.send_cognito_signup_data = ({ payload, spark }) ->
    _.map payload.user.pool.client, (v, k) ->
        c 'userpoolclient k', k
        c 'userpoolclient v', v








exports.default = aa
