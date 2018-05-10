var FB_Login, Imm, ReactO, Text, TextInput, TouchableOpacity, View, _, aws_cognito_settings, aws_region_000, c, comp, fp, handle_cognito_auth, map_dispatch_to_props, map_state_to_props, rc, rr, shortid, userPool;

_ = require('lodash');

fp = require('lodash/fp');

Imm = require('immutable');

shortid = require('shortid');

c = console.log.bind(console);

import React, {
  createElement
} from 'react-native';

ReactO = require('react'); // NOTE: `require` still works.

import createReactClass from 'create-react-class';

rr = function() {
  return ReactO.createFactory(createReactClass.apply(ReactO, arguments));
};

rc = function() {
  return ReactO.createFactory.apply(ReactO, arguments);
};

import {
  connect
} from 'react-redux';

View = rc(React.View);

Text = rc(React.Text);

TextInput = rc(React.TextInput);

TouchableOpacity = rc(React.TouchableOpacity);

FB_Login = rc(require('./fbsdk_signin_hack.js').default); // NOTE This is the old one, not integrated into Cognito.

import AWS, {
  util,
  CognitoIdentityCredentials,
  S3
} from 'aws-sdk/dist/aws-sdk-react-native';

import {
  AuthenticationDetails,
  CognitoUser,
  CognitoUserPool,
  CognitoUserAttribute
} from "amazon-cognito-identity-js";

aws_region_000 = 'us-east-1';

aws_cognito_settings = {
  UserPoolId: 'us-east-1_xxxxxxxxxxx',
  ClientId: 'xxxxxxxxxx',
  IdentityPoolId: 'us-easxxxxxxxxxe'
};

userPool = new CognitoUserPool(aws_cognito_settings);

handle_cognito_auth = function({username, pwd}) {
  var auth_data, auth_details, cognitoUser, userData;
  auth_data = {
    Username: username,
    Password: pwd
  };
  auth_details = new AuthenticationDetails(auth_data);
  userData = {
    Username: username,
    Pool: userPool
  };
  cognitoUser = new CognitoUser(userData);
  return cognitoUser.authenticateUser(auth_details, {
    onSuccess: (result) => {
      var jwt_token;
      // alert "total result: #{JSON.stringify result}"
      // alert (JSON.stringify (_.keys result))
      jwt_token = result.getAccessToken().getJwtToken();
      // alert "AccessToken: #{jwt_token}"
      AWS.config.region = aws_region_000;
      AWS.config.credentials = new CognitoIdentityCredentials({
        IdentityPoolId: aws_cognito_settings.IdentityPoolId,
        Logins: {
          [`cognito-idp.${aws_region_000}.amazonaws.com/${aws_cognito_settings.UserPoolId}`]: jwt_token
        }
      });
      this.props.cognito_login({AWS, result});
      return this.props.nav_goto('dasbboard');
    },
    onFailure: (err) => {
      return alert(`failure error ${err.message || (JSON.stringify(err))}`);
    }
  });
};

comp = rr({
  getInitialState: function() {
    return {
      username: '',
      email_input: '',
      pwd: ''
    };
  },
  render: function() {
    return View({
      style: {
        display: 'flex',
        height: '100%',
        flexDirection: 'column',
        alignItems: 'center',
        backgroundColor: 'limegreen'
      }
    }, Text({
      style: {
        fontSize: 30,
        marginTop: 40,
        marginBottom: 24,
        // color: 'darkgrey'
        color: 'red'
      }
    }, "LOGIN"), Text({
      style: {
        fontSize: 18,
        marginTop: 20,
        marginBottom: 14
      }
    // color: 'darkgrey'
    }, "Login with"), View({
      style: {
        display: 'flex',
        flexDirection: 'row'
      }
    // View {},
    //     TouchableOpacity
    //         onTouch: (e) =>
    //             # c e, 'e TouchableOpacity'
    //         View
    //             style:
    //                 display: 'flex'
    //                 justifyContent: 'center'
    //                 alignItems: 'center'
    //                 width: 100
    //                 height: 40
    //                 # backgroundColor: 'magenta'
    //                 borderRightWidth: 1
    //                 borderBottomWidth: 1
    //                 borderTopWidth: 1
    //                 borderLeftWidth: 1
    //                 borderColor: 'black'
    //                 borderRadius: 8
    //             Text
    //                 style:
    //                     fontSize: 12
    //                 "GOOGLE"
    // View {},
    //     FB_Login()
    }), View({
      style: {
        display: 'flex'
      }
    }, Text({}, 'USERNAME'), TextInput({
      value: this.state.username,
      onChangeText: (e) => {
        return this.setState({
          username: e
        });
      },
      style: {
        borderRadius: 6,
        height: 40,
        width: 280,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderColor: 'black'
      },
      placeholder: 'username',
      underlineColorAndroid: 'rgba(0,0,0,0)'
    })), View({
      style: {
        display: 'flex'
      }
    }, Text({}, 'PASSWORD'), TextInput({
      value: this.state.pwd,
      onChangeText: (e) => {
        return this.setState({
          pwd: e
        });
      },
      style: {
        borderRadius: 6,
        height: 40,
        width: 280,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderColor: 'black'
      },
      placeholder: 'password',
      underlineColorAndroid: 'rgba(0,0,0,0)'
    })), TouchableOpacity({
      onPress: () => {
        var email, first_name, last_name, payload, pwd;
        ({email, pwd, first_name, last_name} = this.state);
        payload = {email, pwd, first_name, last_name};
        // @props.send_signup_candide payload
        return handle_cognito_auth.bind(this)({
          username: this.state.username,
          pwd: this.state.pwd
        });
      }
    }, View({
      style: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        width: 280,
        height: 40,
        backgroundColor: "rgba(124,181,24,1)",
        borderRadius: 6,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderColor: 'black',
        marginTop: 24
      }
    }, Text({
      style: {
        fontSize: 10,
        color: 'snow'
      }
    }, "Login"))), TouchableOpacity({
      onPress: () => {
        return this.props.nav_goto('signin');
      }
    }, Text({
      style: {
        fontSize: 10,
        marginTop: 100
      }
    }, "New User? Sign up Here")));
  }
});

map_state_to_props = function(state) {
  return {};
};

map_dispatch_to_props = function(dispatch) {
  return {
    cognito_login: function(payload) {
      return dispatch({
        type: 'cognito_login',
        payload: payload
      });
    },
    nav_goto: function(loc) {
      return dispatch({
        type: 'nav_goto',
        payload: loc
      });
    },
    send_cognito_signup_data: function(payload) {
      return dispatch({
        type: 'send_cognito_signup_data',
        payload: payload
      });
    }
  };
};

exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));
