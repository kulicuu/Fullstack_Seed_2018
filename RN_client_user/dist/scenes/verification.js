var Imm, ReactO, Text, TextInput, TouchableOpacity, View, _, aws_cognito_settings, aws_region_000, c, comp, fp, handle_cognito_confirm, handle_cognito_resend_code, map_dispatch_to_props, map_state_to_props, rc, rr, shortid;

_ = require('lodash');

fp = require('lodash/fp');

Imm = require('immutable');

shortid = require('shortid');

c = console.log.bind(console);

import React, {
  createElement
} from 'react-native';

ReactO = require('react');

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
  UserPoolId: 'xxxxxxxxxxxxx',
  ClientId: 'xxxxxxxxxx'
};

// userPool = new CognitoUserPool(aws_cognito_settings)
handle_cognito_confirm = function({username, confirm_code}) {
  var cognitoUser, userData, userPool;
  //this would normally be initiated early but for seed, without a specific AWS endpoint I haven't worked out the configuration.
  userPool = new CognitoUserPool(aws_cognito_settings);
  userData = {
    Username: username,
    Pool: userPool
  };
  cognitoUser = new CognitoUser(userData);
  return cognitoUser.confirmRegistration(confirm_code, true, (err, result) => {
    if (err) {
      alert(err.message || (JSON.stringify(err)));
    }
    if (result === 'SUCCESS') {
      return this.props.nav_goto('dashboard');
    }
  });
};

handle_cognito_resend_code = function({username}) {
  var cognitoUser, userData;
  userData = {
    Username: username,
    Pool: userPool
  };
  cognitoUser = new CognitoUser(userData);
  return cognitoUser.resendConfirmationCode((err, result) => {
    if (err) {
      return alert(err.message || (JSON.stringify(err)));
    }
  });
};

// handle_cognito_auth = ({ username, pwd }) ->

//     auth_data =
//         Username: username
//         Password: pwd

//     auth_details = new AuthenticationDetails(auth_data)
//     userData =
//         Username: username
//         Pool: userPool

//     cognitoUser = new CognitoUser(userData)
//     cognitoUser.authenticateUser auth_details,
//         onSuccess: (result) =>
//             jwt_token = result.getAccessToken().getJwtToken()
//             alert "AccessToken: #{jwt_token}"

//             AWS.config.region = aws_region_000

//             AWS.config.credentials = new CognitoIdentityCredentials
//                 IdentityPoolId: aws_cognito_settings.UserPoolId
//                 Logins:
//                     "cognito-idp.#{aws_region_000}.amazonaws.com/#{aws_cognito_settings.UserPoolId}" : jwt_token

//             AWS.config.credentials.refresh (error) =>
//                 if error
//                     alert error
//                 else
//                     # successfully logged: Here instantiate aws sdk service objects now that the credentials have been updated. Example: var s3 = new AWS.S3()
//                     alert 'successfully logged: Here instantiate aws sdk service objects now that the credentials have been updated. Example: var s3 = new AWS.S3()'

//         onFailure: (err) =>
//             alert ( err.message or (JSON.stringify err) )

comp = rr({
  getInitialState: function() {
    return {
      hidden_username_input: false,
      username: this.props.username || '',
      ver: ''
    };
  },
  render: function() {
    return View({
      style: {
        display: 'flex',
        height: '100%',
        // backgroundColor: 'cyan'
        flexDirection: 'column',
        justifyContent: 'space-between',
        alignItems: 'center'
      }
    }, View({
      style: {
        display: 'flex',
        height: '50%',
        // backgroundColor: 'yellow'
        flexDirection: 'column',
        // justifyContent: 'space-between'
        alignItems: 'center'
      }
    }, Text({
      style: {
        fontSize: 30,
        marginTop: 40,
        marginBottom: 24
      }
    // color: 'darkgrey'
    }, "VERIFICATION"), View({
      style: {
        display: 'flex',
        flexDirection: 'row'
      }
    }), View({
      style: {
        display: 'flex'
      }
    }, Text({}, 'VERIFICATION CODE'), TextInput({
      value: this.state.ver,
      onChangeText: (e) => {
        return this.setState({
          ver: e
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
      placeholder: 'Enter verification code here',
      underlineColorAndroid: 'rgba(0,0,0,0)'
    })), TouchableOpacity({
      onPress: () => {
        return handle_cognito_confirm.bind(this)({
          username: this.state.username,
          confirm_code: this.state.ver
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
    }, "Enter"))), TouchableOpacity({
      onPress: () => {
        return handle_cognito_resend_code.bind(this)({
          username: this.state.username
        });
      }
    }, Text({
      style: {
        fontSize: 10,
        marginTop: 100
      }
    }, "Click here to resend code."))), View({
      style: {
        width: '100%',
        height: 100,
        // backgroundColor: 'magenta'
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'center'
      }
    }, this.state.hidden_username_input ? TextInput({
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
      placeholder: 'Username',
      underlineColorAndroid: 'rgba(0,0,0,0)'
    }) : TouchableOpacity({
      onPress: () => {
        return this.setState({
          hidden_username_input: true
        });
      }
    }, View({
      style: {
        opacity: .13,
        width: 30,
        height: 30,
        backgroundColor: 'cyan'
      }
    }))));
  }
});

map_state_to_props = function(state) {
  return {
    username: state.get('username')
  };
};

map_dispatch_to_props = function(dispatch) {
  return {
    nav_goto: function(loc) {
      return dispatch({
        type: 'nav_goto',
        payload: loc
      });
    }
  };
};

exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));
