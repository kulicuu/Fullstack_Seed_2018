// NOTE TODO Factor out the AWS flows into a config variation that will be called only
var FB_Login, Imm, ReactO, Text, TextInput, TouchableOpacity, View, _, aws_cognito_settings, aws_region_000, c, comp, fp, handle_cognito_signup, map_dispatch_to_props, map_state_to_props, rc, rr, shortid;

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
  UserPoolId: 'us-east-1_BNbkHDuD7',
  ClientId: 'xxxxxxxxxx'
};

// NOTE TODO: Find a better name to flag these .js files than 'hack', they are not
// really hacks at all just implementations
FB_Login = rc(require('./fbsdk_signin_hack.js').default); // NOTE This is the old one, not integrated into Cognito.

handle_cognito_signup = function({username, pwd, email}) {
  var attributeList;
  attributeList = [];
  attributeList.push(new CognitoUserAttribute({
    Name: 'email',
    Value: email
  }));
  return userPool.signUp(username, pwd, attributeList, null, (err, result) => {
    if (err) {
      return alert('err' + (JSON.stringify(err)));
    } else {
      // (alert (JSON.stringify result))
      this.props.send_cognito_signup_data(result);
      username = (function() {
        if (result && result.user) {
          return result.user.username;
        } else {
          return null;
        }
      })();
      if ((username !== void 0) && (username !== null)) {
        this.props.set_username({username});
        return this.props.nav_verification();
      }
    }
  });
};

comp = rr({
  getInitialState: function() {
    return {
      username: '',
      email: '',
      pwd: ''
    };
  },
  render: function() {
    return View({
      style: {
        display: 'flex',
        height: '100%',
        flexDirection: 'column',
        alignItems: 'center'
      }
    }, Text({
      style: {
        fontSize: 30,
        marginTop: 40,
        marginBottom: 24,
        color: 'darkgrey'
      }
    }, "SIGN UP"), Text({
      style: {
        fontSize: 18,
        marginTop: 20,
        marginBottom: 14,
        color: 'darkgrey'
      }
    }, "Continue with"), View({
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
        borderRadius: 12,
        height: 40,
        width: 280,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderColor: 'black'
      },
      // placeholderColor: 'red'
      placeholder: 'username',
      underlineColorAndroid: 'rgba(0,0,0,0)'
    }), Text({
      style: {
        fontSize: 10
      }
    // " hello"
    }, this.props.username_available)), View({
      style: {
        display: 'flex'
      }
    }, Text({}, 'EMAIL'), TextInput({
      value: this.state.email,
      onChangeText: (e) => {
        return this.setState({
          email: e
        });
      },
      style: {
        borderRadius: 12,
        height: 40,
        width: 280,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderColor: 'black'
      },
      // placeholderColor: 'red'
      placeholder: 'email',
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
        borderRadius: 12,
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
    })), View({
      style: {
        display: 'flex'
      }
    }, Text({}, 'FIRST NAME'), TextInput({
      value: this.state.first_name,
      onChangeText: (e) => {
        return this.setState({
          first_name: e
        });
      },
      style: {
        borderRadius: 12,
        height: 40,
        width: 280,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderColor: 'black'
      },
      placeholder: 'first name',
      underlineColorAndroid: 'rgba(0,0,0,0)'
    })), View({
      style: {
        display: 'flex'
      }
    }, Text({}, 'LAST NAME'), TextInput({
      value: this.state.last_name,
      onChangeText: (e) => {
        return this.setState({
          last_name: e
        });
      },
      style: {
        borderRadius: 12,
        height: 40,
        width: 280,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderColor: 'black'
      },
      placeholder: 'last name',
      underlineColorAndroid: 'rgba(0,0,0,0)'
    })), TouchableOpacity({
      onPress: () => {
        var email, first_name, last_name, payload, pwd;
        ({email, pwd, first_name, last_name} = this.state);
        payload = {email, pwd, first_name, last_name};
        // @props.send_signup_candide payload
        return handle_cognito_signup.bind(this)({
          username: this.state.username,
          pwd: this.state.pwd,
          email: this.state.email
        });
      }
    }, View({
      style: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        width: 120,
        height: 32,
        // backgroundColor: 'cyan'
        borderRadius: 6,
        borderRightWidth: 1,
        borderBottomWidth: 1,
        borderTopWidth: 1,
        borderLeftWidth: 1,
        borderColor: 'black',
        marginTop: 8
      }
    }, Text({
      style: {
        fontSize: 22
      }
    }, "SIGN UP"))));
  }
});

map_state_to_props = function(state) {
  return {
    username_available: state.get('candide_username_available')
  };
};

map_dispatch_to_props = function(dispatch) {
  return {
    set_username: function({username}) {
      return dispatch({
        type: 'set_username',
        payload: {username}
      });
    },
    nav_verification: function() {
      return dispatch({
        type: 'nav_goto',
        payload: 'verification'
      });
    },
    // this should be given a generic name; the branching between
    // AWS Cognito and some other routine will not occur at this level
    send_cognito_signup_data: function(payload) {
      return dispatch({
        type: 'send_cognito_signup_data',
        payload: payload
      });
    }
  };
};

// send_signup_candide: (payload) ->
//     dispatch
//         type: 'send_signup_candide'
//         payload: payload
exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));
