

# NOTE "Limit your use of toJS()
# "toJS() is an expensive function and negates the purpose of using Immutable.JS. Avoid its use.







_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
shortid = require 'shortid'
c = console.log.bind console
import React, { NativeModules, createElement} from 'react-native'

# jsonwebtoken = require 'jsonwebtoken'



# { RNS3TransferUtility } = NativeModules


# alert (JSON.stringify RNS3transferUtility)



ReactO = require 'react' # NOTE: `require` still works.
import createReactClass from 'create-react-class'
rr = -> ReactO.createFactory(createReactClass.apply(ReactO, arguments))
rc = -> ReactO.createFactory.apply(ReactO, arguments)


import { connect } from 'react-redux'



import fs from "react-native-fs"
image_030 = require('./image_030.jpg')

test_f = (aa) ->
    c 'aa', aa



View = rc React.View
Text = rc React.Text
TextInput = rc React.TextInput

ScrollView = rc React.ScrollView
TouchableOpacity = rc React.TouchableOpacity


{ AsyncStorage } = React


import { transferUtility } from 'react-native-s3'


# acc_id= 'xxxxxxx'
# dev_station_030 =


#  Write some stuff to local storage


# React.AsyncStorage.setItem 'hello', 'goodbye', (err) ->
#     alert 'asyncsotorage set something ', err


# React.AsyncStorage.getItem 'hello', (err, result) ->
#     if err
#         c 'err on get hello', err
#     else
#         alert ( JSON.stringify result )
#         # alert 'result', ( JSON.stringify result )
dev_write_to_local = (stuff) ->




# In Dev mode, instead of drawing from AsyncStorage, we can just mock the usernamepass

tig =
    username: 'xxxxxx'
    pwd: 'xxxxxxxx'





# NOTE TODO: Find a better name to flag these .js files than 'hack', they are not
# really hacks at all just implementations
FB_Login = rc require('./fbsdk_signin_hack.js').default  # NOTE This is the old one, not integrated into Cognito.


# import AWS, { util, CognitoIdentityCredentials, S3 } from 'aws-sdk/dist/aws-sdk-react-native'
import AWS, { util, CognitoIdentityCredentials } from 'aws-sdk/dist/aws-sdk-react-native'



# s3 = new S3({apiVersion: '``2006-03-01'})


import {
    AuthenticationDetails
    CognitoUser
    CognitoUserPool
    CognitoUserAttribute
} from "amazon-cognito-identity-js";




aws_region_000 = 'us-east-1'
aws_cognito_settings =
    UserPoolId: 'us-east-1_xxxxxxxx'
    ClientId: 'xxxxxxxxxxxxx'
    IdentityPoolId: 'us-east-1:xxxxxxxxxxxxxxxxxxxxx'

# userPool = new CognitoUserPool(aws_cognito_settings)
# ^ NOTE ^ Normally this would be executed here.



handle_get_creds_for_id = ->


Buffer = require('buffer/').Buffer

send_upload = ->
    c (_.keys @state)
    c (_.keys @state.id_id)
    c "session", (_.keys @state.session.accessToken)

    c (_.keys @state.cognito_current_user)
    c ( @state.cognito_current_user.authenticationFlowType)
    c (_.keys @state.cognito_current_user.Session)
    c "keyset", (_.keys @state.cognito_keyset)
    c "keyset", (_.keys @state.cognito_keyset.accessToken)
    c "credence", (_.keys @state.id_id.Credentials)
    credence = @state.id_id.Credentials

    AWS.config.update credence
        # accessKeyId: credence.AccessKeyId
        # secretAccessKey: credence.SecretAccessKey
        # sessionToken: credence.SessionToken
        # region: "us-east-1"

    # AWS.config.update
    #     key: credence.AccessKeyId
    #     secret: credence.SecretAccessKey
    #     token: credence.SessionToken
    #     region: "us-east-1"


    # alert (typeof AWS.config.update)



    # alert (JSON.stringify credence)
    p33 =
        apiVersion: '2006-03-01'
        Credentials: credence

    s3 = new AWS.S3( p33 )
    params =
        Body: new Buffer('9485aeuaeuaeu948385')
        Bucket: 'exampleimages'
        Key: 'exampleobject333'
    s3.upload  params, (err, data) ->
        c '383883838', err, data








handle_cognito_session_pull = ->


    @state.cognito_current_user.getSession (err, session) =>
        the_logins_arq =
            'cognito-idp.us-east-1.amazonaws.com/us-east-1_xxxxxxx' : session.getIdToken().getJwtToken()
        if err
            alert 'error getting session in ufo'
        @state.cognito_current_user.getUserAttributes (err2, attributes) =>
            if err2
                alert 'error getting userAttributes in ufo'
            else
                @setState
                    cognito_user_attributes: attributes
                    session: session

        AWS.config.credentials = new AWS.CognitoIdentityCredentials
            IdentityPoolId: 'us-east-1:01xxxxxxxxxxxxxxxe'
            Logins: the_logins_arq
        c_identity = new AWS.CognitoIdentity({apiVersion: '2014-06-30'})
        c_identity.getId
            AccountId: acc_id
            IdentityPoolId: aws_cognito_settings.IdentityPoolId
            Logins: the_logins_arq
        , (err4, data) =>
            if err4
                c 'err4', err4
            else
                id_id = data.IdentityId
                parms_2 =
                    IdentityId: id_id
                    # CustomRoleArn: 'arn:aws:iam::826388141638:role/V_rn_role_grower_for_S3_40'
                    Logins: the_logins_arq
                c_identity.getCredentialsForIdentity parms_2, (err7, data7) =>
                    if err7
                        c "err7 #{JSON.stringify err7}"
                    else
                        c 'data7', data7, 'data7'
                        transferUtility.setupWithCognito
                            region: 'us-east-1'
                            identity_pool_id: aws_cognito_settings.IdentityPoolId
                            cognito_region: 'us-east-1'
                            caching: true

                        .catch (err48) =>
                            c 'there was err48', err48
                        .then (results3) =>
                            if results3 is true
                                @setState
                                    id_id: data7







# https://github.com/aws/aws-amplify/tree/master/packages/amazon-cognito-identity-js

handle_cognito_auth_030 = ({ username, pwd }) ->

    auth_data =
        Username: username
        Password: pwd

    auth_details = new AuthenticationDetails(auth_data)
    userData =
        Username: username
        Pool: userPool

    cognitoUser = new CognitoUser(userData)
    # cognitoUser.getId auth_details,
    #     onSuccess: (res5) =>
    #         alert ("res5 #{JSON.stringify res5}")

    cognitoUser.authenticateUser auth_details,
        onSuccess: (result) =>

            # jwt_token = result.getAccessToken().getJwtToken()
            AWS.config.region = aws_region_000

            # the_credentials = new CognitoIdentityCredentials
            #     IdentityPoolId: aws_cognito_settings.IdentityPoolId
            #     Logins:
            #         "cognito-idp.#{aws_region_000}.amazonaws.com/#{aws_cognito_settings.UserPoolId}" : result.getAccessToken().getJwtToken()
            # AWS.config.credentials = the_credentials


            ## I forgot why this one doesn't work for some reason compat
            # AWS.config.credentials.refresh (error) =>
            #     if (error)
            #         c 'error', error
            #         alert (JSON.stringify error)
            #     else
            #         c 'logged in3.'
            #         alert 'go'



            @setState
                cognito_current_user: userPool.getCurrentUser()
                cognito_keyset: result
            handle_cognito_session_pull.bind(@)()
            # handle_try_getId.bind(@)()
            # cognito_identity = new AWS.CognitoIdentity({apiVersion: '2014-06-30'})

            # _.map the_credentials, (v, k) ->
            #     c 'k33', k
            #     c 'v33', v
            # _.map cognito_identity, (v, k) ->
            #     c 'k', k
            #     c 'v', v
            #
            # _.map userPool.getCurrentUser(), (v, k) ->
            #     c 'k2', k
            #     c 'v2', v



            # cognito_identity.
            # alert (JSON.stringify cognito_identity.config.credentials._identityId)
            # alert (JSON.stringify (_.keys cognito_identity.config.credentials    ))
            # alert (JSON.stringify cognito_identity)
            # the_picked = _.pick cognito_identity, ['AccountId', 'IdentityPoolId', 'Logins']
            # alert (JSON.stringify the_picked)
            # cognito_identity.getId {},
            #     onSuccess: (result5) =>
            #         alert "result5 #{JSON.stringify result5}"



        onFailure: (err) =>
            alert "failure error #{( err.message or (JSON.stringify err) )}"





cursive_json_markup_keyset = (keyset, level) ->
    _.map keyset, (v, k) =>
        View
            key: "aeu#{level}:#{k}"
            style:
                display: 'flex'
                alignItems: 'center'
                justifyContent: 'center'
            Text
                style:
                    fontSize: 2.3
                    # color: 'black'
                "level: #{level},  k:"
            Text
                style:
                    fontSize: 8
                    # color: 'black'
                "#{k}"
                if typeof v isnt "object"
                    Text
                        style:
                            fontSize: 2.3
                            # color: 'cyan'
                        "v: "
                        Text
                            style:
                                fontSize: 2
                            "#{v}"
            if typeof v is "object"
                arguments.callee.bind(@) v, level + 1




handle_try_getId =  ->
    AccountId: 'xxxxxxxxxx'
    arq =
        AccountId: 'xxxxxxxxx'
        IdentityPoolId: aws_cognito_settings.IdentityPoolId
        Logins: {}
    # alert (JSON.stringify (_.keys AWS.CognitoIdentityServiceProvider.apiVersions)[0])

    # AWS.AWSCognitoIdentity.getId arq, (err3, res3) ->
    #     if err3
    #         alert "err3: #{JSON.stringify err3}"
    #     else
    #         alert "res3: #{JSON.stringify res3}"



try_get_id = ->





try_photo_upload = ->





scrollview_innards = ->
    View
        style:
            display: 'flex'
            backgroundColor: 'snow'
            # backgroundColor: 'lawngreen'

            height: '100%'
            flexDirection: 'column'
            alignItems: 'center'
        Text
            style:
                fontSize: 20
                color: 'cadetblue'
            "Terebinth"
        Text
            style:
                fontSize: 8
                color: 'darkgrey'
            "local websocket http connection: :#{@props.counter_zero}"
        Text
            style:
                fontSize: 4
                color: 'darkgrey'
            "local websocket https connection: :#{@props.counter_one}"
        Text
            style:
                fontSize: 4
                # color: 'yellow'
            "digital-ocean websocket http connection: :#{@props.counter_two}"
        Text
            style:
                fontSize: 4
                color: 'darkgrey'
            "digital-ocean websocket https connection: :#{@props.counter_three}"



        Text
            style:
                fontSize: 6
            if  @props.net_info and (@props.net_info.has 'type')
                "net_info: type #{@props.net_info.get 'type' }"
        Text
            style:
                fontSize: 6
            # unless @props.
            if  @props.net_info and (@props.net_info.has 'effectiveType')
                "net_info.effectiveType: #{ @props.net_info.effectiveType }"

        Text
            style:
                fontSize: 10
            "<Cognito-State>"
        TouchableOpacity
            onPress: =>
            View
                style:
                    width: 100
                    height: 20
                    backgroundColor: 'ivory'
                    display: 'flex'
                    justifyContent: 'center'
                    alignItems: 'center'
                Text
                    style:
                        fontSize: 8
                    "Logout User"
        Text
            style:
                fontSize: 10
            "<Local-Storage-Cognito>"
        TouchableOpacity
            onPress: =>
            View
                style:
                    width: 100
                    height: 20
                    backgroundColor: 'ivory'
                    display: 'flex'
                    justifyContent: 'center'
                    alignItems: 'center'
                Text
                    style:
                        fontSize: 8
                    "Clear Local Storage"
        TouchableOpacity
            onPress: =>
                handle_cognito_auth_030.bind(@) tig
            View
                style:
                    width: 100
                    height: 20
                    backgroundColor: 'ivory'
                    display: 'flex'
                    justifyContent: 'center'
                    alignItems: 'center'
                Text
                    style:
                        fontSize: 8
                    "Update Cognito AuthState"

        TouchableOpacity
            onPress: =>
                handle_try_getId.bind(@)()
            View
                style:
                    display: 'flex'
                    width: 100
                    height: 20
                    justifyContent: 'center'
                Text
                    style:
                        fontSize: 10
                    "try getId call"
        if @state.current_user isnt null
            View null,
                Text
                    style:
                        fontSize: 8
                    "current_user"
                View null, cursive_json_markup_keyset.bind(@) @state.current_user, 0


        Text
            style:
                fontSize: 6
            "CognitoUserAttributes"
        View null, cursive_json_markup_keyset.bind(@) @state.cognito_user_attributes, 0

        Text
            style:
                fontSize: 6
            "Cognito-State: #{@state.cognito_keyset}"
        Text
            style:
                fontSize: 7
                color: 'red'
            ( JSON.stringify @state.cognito_user_attributes )

        View null, cursive_json_markup_keyset.bind(@) @state.cognito_keyset, 0


comp = rr
    componentDidUpdate: (prevProps, prevState, snapshot) ->

        if (@state.cognito_current_user isnt null) and (@state.cognito_current_user isnt prevState.cognito_current_user )
            handle_cognito_session_pull.bind(@)()

        if @state.cognito_keyset isnt null
            try_photo_upload.bind(@)()

        # cursive_find_AccountId @state, 0

        if (@state.id_id isnt null) and (@state.id_id isnt prevState.id_id)
            send_upload.bind(@)()


    componentDidMount: ->
        # handle_cognito_auth_030.bind(@) tig


    getInitialState: ->
        id_id: null
        cognito_session: null
        cognito_keyset: null
        cognito_current_user: null
        cognito_attributes: null

    render: ->
        ScrollView
            contentContainerStyle:
                width: '100%'
            scrollview_innards.bind(@)()

















map_state_to_props = (state) ->
    c "state.get 'net_info'", (state.get 'net_info')
    counter_zero: state.get 'counter_zero'
    net_info: state.get 'net_info'




map_dispatch_to_props = (dispatch) ->

    update_auth_state: (creds) ->
        dispatch
            type: 'update_cognito_auth_state'
            payload: { creds } # or something like this

exports.default = rc connect(map_state_to_props, map_dispatch_to_props)(comp)
