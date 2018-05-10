









_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
shortid = require 'shortid'
c = console.log.bind console
import React, {createElement} from 'react-native'
ReactO = require 'react' # NOTE: `require` still works.
import createReactClass from 'create-react-class'
rr = -> ReactO.createFactory(createReactClass.apply(ReactO, arguments))
rc = -> ReactO.createFactory.apply(ReactO, arguments)
import { connect } from 'react-redux'








View = rc React.View
Text = rc React.Text
TextInput = rc React.TextInput
TouchableOpacity = rc React.TouchableOpacity
FB_Login = rc require('./fbsdk_signin_hack.js').default  # NOTE This is the old one, not integrated into Cognito.






import AWS, { util, CognitoIdentityCredentials, S3 } from 'aws-sdk/dist/aws-sdk-react-native'
import {
    AuthenticationDetails
    CognitoUser
    CognitoUserPool
    CognitoUserAttribute
} from "amazon-cognito-identity-js";





aws_region_000 = 'us-east-1'
aws_cognito_settings =
    UserPoolId: 'us-east-1_xxxxxxxxxxx'
    ClientId: 'xxxxxxxxxx'
    IdentityPoolId: 'us-easxxxxxxxxxe'
userPool = new CognitoUserPool(aws_cognito_settings)












handle_cognito_auth = ({ username, pwd }) ->

    auth_data =
        Username: username
        Password: pwd

    auth_details = new AuthenticationDetails(auth_data)
    userData =
        Username: username
        Pool: userPool

    cognitoUser = new CognitoUser(userData)
    cognitoUser.authenticateUser auth_details,
        onSuccess: (result) =>
            # alert "total result: #{JSON.stringify result}"
            # alert (JSON.stringify (_.keys result))
            jwt_token = result.getAccessToken().getJwtToken()
            # alert "AccessToken: #{jwt_token}"

            AWS.config.region = aws_region_000

            AWS.config.credentials = new CognitoIdentityCredentials
                IdentityPoolId: aws_cognito_settings.IdentityPoolId
                Logins:
                    "cognito-idp.#{aws_region_000}.amazonaws.com/#{aws_cognito_settings.UserPoolId}" : jwt_token


            @props.cognito_login { AWS, result }
            @props.nav_goto 'dasbboard'



        onFailure: (err) =>
            alert "failure error #{( err.message or (JSON.stringify err) )}"










comp = rr
    getInitialState: ->
        username: ''
        email_input: ''
        pwd: ''
    render: ->
        View
            style:
                display: 'flex'
                height: '100%'
                flexDirection: 'column'
                alignItems: 'center'
                backgroundColor: 'limegreen'
            Text
                style:
                    fontSize: 30
                    marginTop: 40
                    marginBottom: 24
                    # color: 'darkgrey'
                    color: 'red'
                "LOGIN"
            Text
                style:
                    fontSize: 18
                    marginTop: 20
                    marginBottom: 14
                    # color: 'darkgrey'
                "Login with"
            View
                style:
                    display: 'flex'
                    flexDirection: 'row'
                # View {},
                #     TouchableOpacity
                #         onTouch: (e) =>
                #             # c e, 'e TouchableOpacity'
                #         View
                #             style:
                #                 display: 'flex'
                #                 justifyContent: 'center'
                #                 alignItems: 'center'
                #                 width: 100
                #                 height: 40
                #                 # backgroundColor: 'magenta'
                #                 borderRightWidth: 1
                #                 borderBottomWidth: 1
                #                 borderTopWidth: 1
                #                 borderLeftWidth: 1
                #                 borderColor: 'black'
                #                 borderRadius: 8
                #             Text
                #                 style:
                #                     fontSize: 12
                #                 "GOOGLE"
                # View {},
                #     FB_Login()
            View
                style:
                    display: 'flex'
                Text {}, 'USERNAME'
                TextInput
                    value: @state.username
                    onChangeText: (e) =>
                        @setState
                            username: e
                    style:
                        borderRadius: 6
                        height: 40
                        width: 280
                        borderRightWidth: 1
                        borderBottomWidth: 1
                        borderTopWidth: 1
                        borderLeftWidth: 1
                        borderColor: 'black'
                    placeholder: 'username'
                    underlineColorAndroid: 'rgba(0,0,0,0)'
            View
                style:
                    display: 'flex'
                Text {}, 'PASSWORD'
                TextInput
                    value: @state.pwd
                    onChangeText: (e) =>
                        @setState
                            pwd: e
                    style:
                        borderRadius: 6
                        height: 40
                        width: 280
                        borderRightWidth: 1
                        borderBottomWidth: 1
                        borderTopWidth: 1
                        borderLeftWidth: 1
                        borderColor: 'black'
                    placeholder: 'password'
                    underlineColorAndroid: 'rgba(0,0,0,0)'
            TouchableOpacity
                onPress: =>
                    { email, pwd, first_name, last_name } = @state
                    payload = { email, pwd, first_name, last_name }
                    # @props.send_signup_candide payload
                    handle_cognito_auth.bind(@)
                        username: @state.username
                        pwd: @state.pwd
                View
                    style:
                        display: 'flex'
                        justifyContent: 'center'
                        alignItems: 'center'
                        width: 280
                        height: 40
                        backgroundColor: "rgba(124,181,24,1)"
                        borderRadius: 6
                        borderRightWidth: 1
                        borderBottomWidth: 1
                        borderTopWidth: 1
                        borderLeftWidth: 1
                        borderColor: 'black'
                        marginTop: 24
                    Text
                        style:
                            fontSize: 10
                            color: 'snow'
                        "Login"

            TouchableOpacity
                onPress: =>
                    @props.nav_goto 'signin'
                Text
                    style:
                        fontSize: 10
                        marginTop: 100
                    "New User? Sign up Here"






map_state_to_props = (state) -> {}






map_dispatch_to_props = (dispatch) ->




    cognito_login: (payload) ->
        dispatch
            type: 'cognito_login'
            payload: payload

    nav_goto: ( loc ) ->
        dispatch
            type: 'nav_goto'
            payload: loc


    send_cognito_signup_data: (payload) ->
        dispatch
            type: 'send_cognito_signup_data'
            payload: payload





exports.default = rc connect(map_state_to_props, map_dispatch_to_props)(comp)
