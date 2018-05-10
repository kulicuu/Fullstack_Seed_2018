











# NOTE TODO Factor out the AWS flows into a config variation that will be called only











_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
shortid = require 'shortid'
c = console.log.bind console
import React, {createElement} from 'react-native'
ReactO = require 'react'
import createReactClass from 'create-react-class'
rr = -> ReactO.createFactory(createReactClass.apply(ReactO, arguments))
rc = -> ReactO.createFactory.apply(ReactO, arguments)
import { connect } from 'react-redux'




View = rc React.View
Text = rc React.Text
TextInput = rc React.TextInput
TouchableOpacity = rc React.TouchableOpacity







import AWS, { util, CognitoIdentityCredentials, S3 } from 'aws-sdk/dist/aws-sdk-react-native'


import {
    AuthenticationDetails
    CognitoUser
    CognitoUserPool
    CognitoUserAttribute
} from "amazon-cognito-identity-js";

aws_region_000 = 'us-east-1'

aws_cognito_settings =
    UserPoolId: 'us-east-1_BNbkHDuD7'
    ClientId: 'xxxxxxxxxx'


# NOTE TODO: Find a better name to flag these .js files than 'hack', they are not
# really hacks at all just implementations
FB_Login = rc require('./fbsdk_signin_hack.js').default  # NOTE This is the old one, not integrated into Cognito.







handle_cognito_signup = ({ username, pwd, email }) ->

    attributeList = []
    attributeList.push new CognitoUserAttribute
        Name: 'email',
        Value: email



    userPool.signUp username, pwd, attributeList, null, (err, result) =>
        if err
            (alert ('err' + (JSON.stringify err)))
        else
            # (alert (JSON.stringify result))
            @props.send_cognito_signup_data result
            username = do ->
                if result and result.user
                    result.user.username
                else
                    null
            if (username isnt undefined) and (username isnt null)
                @props.set_username { username }
                @props.nav_verification()



comp = rr

    getInitialState: ->
        username: ''
        email: ''
        pwd: ''
    render: ->
        View
            style:
                display: 'flex'
                height: '100%'
                flexDirection: 'column'
                alignItems: 'center'
            Text
                style:
                    fontSize: 30
                    marginTop: 40
                    marginBottom: 24
                    color: 'darkgrey'
                "SIGN UP"
            Text
                style:
                    fontSize: 18
                    marginTop: 20
                    marginBottom: 14
                    color: 'darkgrey'
                "Continue with"
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
                        borderRadius: 12
                        height: 40
                        width: 280
                        borderRightWidth: 1
                        borderBottomWidth: 1
                        borderTopWidth: 1
                        borderLeftWidth: 1
                        borderColor: 'black'
                        # placeholderColor: 'red'
                    placeholder: 'username'
                    underlineColorAndroid: 'rgba(0,0,0,0)'
                Text
                    style:
                        fontSize: 10
                    # " hello"
                    @props.username_available
            View
                style:
                    display: 'flex'
                Text {}, 'EMAIL'
                TextInput
                    value: @state.email
                    onChangeText: (e) =>
                        @setState
                            email: e
                    style:
                        borderRadius: 12
                        height: 40
                        width: 280
                        borderRightWidth: 1
                        borderBottomWidth: 1
                        borderTopWidth: 1
                        borderLeftWidth: 1
                        borderColor: 'black'
                        # placeholderColor: 'red'
                    placeholder: 'email'
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
                        borderRadius: 12
                        height: 40
                        width: 280
                        borderRightWidth: 1
                        borderBottomWidth: 1
                        borderTopWidth: 1
                        borderLeftWidth: 1
                        borderColor: 'black'
                    placeholder: 'password'
                    underlineColorAndroid: 'rgba(0,0,0,0)'
            View
                style:
                    display: 'flex'
                Text {}, 'FIRST NAME'
                TextInput
                    value: @state.first_name
                    onChangeText: (e) =>
                        @setState
                            first_name: e
                    style:
                        borderRadius: 12
                        height: 40
                        width: 280
                        borderRightWidth: 1
                        borderBottomWidth: 1
                        borderTopWidth: 1
                        borderLeftWidth: 1
                        borderColor: 'black'
                    placeholder: 'first name'
                    underlineColorAndroid: 'rgba(0,0,0,0)'
            View
                style:
                    display: 'flex'
                Text {}, 'LAST NAME'
                TextInput
                    value: @state.last_name
                    onChangeText: (e) =>
                        @setState
                            last_name: e
                    style:
                        borderRadius: 12
                        height: 40
                        width: 280
                        borderRightWidth: 1
                        borderBottomWidth: 1
                        borderTopWidth: 1
                        borderLeftWidth: 1
                        borderColor: 'black'
                    placeholder: 'last name'
                    underlineColorAndroid: 'rgba(0,0,0,0)'


            TouchableOpacity
                onPress: =>
                    { email, pwd, first_name, last_name } = @state
                    payload = { email, pwd, first_name, last_name }
                    # @props.send_signup_candide payload
                    handle_cognito_signup.bind(@)
                        username: @state.username
                        pwd: @state.pwd
                        email: @state.email
                View
                    style:
                        display: 'flex'
                        justifyContent: 'center'
                        alignItems: 'center'
                        width: 120
                        height: 32
                        # backgroundColor: 'cyan'
                        borderRadius: 6
                        borderRightWidth: 1
                        borderBottomWidth: 1
                        borderTopWidth: 1
                        borderLeftWidth: 1
                        borderColor: 'black'
                        marginTop: 8
                    Text
                        style:
                            fontSize: 22
                        "SIGN UP"


map_state_to_props = (state) ->
    username_available: state.get 'candide_username_available'




map_dispatch_to_props = (dispatch) ->

    set_username: ({ username }) ->
        dispatch
            type: 'set_username'
            payload: { username }


    nav_verification: ->
        dispatch
            type: 'nav_goto'
            payload: 'verification'




    # this should be given a generic name; the branching between
    # AWS Cognito and some other routine will not occur at this level
    send_cognito_signup_data: (payload) ->
        dispatch
            type: 'send_cognito_signup_data'
            payload: payload


    # send_signup_candide: (payload) ->
    #     dispatch
    #         type: 'send_signup_candide'
    #         payload: payload


exports.default = rc connect(map_state_to_props, map_dispatch_to_props)(comp)
