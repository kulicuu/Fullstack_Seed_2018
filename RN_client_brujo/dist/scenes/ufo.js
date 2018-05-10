// NOTE:  At one time a 'ufo' file was associated with a landing page inviting login/signup, but over time i've changed usage, so that ufo page is kind of a developer panel.  In this case I was carrying out prototype implementations of unrelated in a flow, in this case the "enhanced-flow" Cognito auth flow facilitating tailored access to specific S3 activities.

// NOTE "Limit your use of toJS()
// "toJS() is an expensive function and negates the purpose of using Immutable.JS. Avoid its use.
var AsyncStorage, Buffer, Button, FB_Login, Imm, ReactO, ScrollView, Text, TextInput, TouchableOpacity, View, _, aws_cognito_settings, aws_region_000, c, comp, cursive_json_markup_keyset, fp, handle_cognito_auth_030, handle_cognito_session_pull, handle_try_getId, map_dispatch_to_props, map_state_to_props, rc, rr, scrollview_innards, send_upload, shortid, tig;

_ = require('lodash');

fp = require('lodash/fp');

Imm = require('immutable');

shortid = require('shortid');

c = console.log.bind(console);

import React, {
  NativeModules,
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

import fs from "react-native-fs";

View = rc(React.View);

Text = rc(React.Text);

Button = rc(React.Button);

TextInput = rc(React.TextInput);

ScrollView = rc(React.ScrollView);

TouchableOpacity = rc(React.TouchableOpacity);

({AsyncStorage} = React);

import {
  transferUtility
} from 'react-native-s3';

tig = {
  username: 'xxxxxx',
  pwd: 'xxxxxxxx'
};

FB_Login = rc(require('./fbsdk_signin_hack.js').default); // NOTE This is the old one, not integrated into Cognito.

import AWS, {
  util,
  CognitoIdentityCredentials
} from 'aws-sdk/dist/aws-sdk-react-native';

import {
  // s3 = new S3({apiVersion: '``2006-03-01'})
  AuthenticationDetails,
  CognitoUser,
  CognitoUserPool,
  CognitoUserAttribute
} from "amazon-cognito-identity-js";

aws_region_000 = 'us-east-1';

aws_cognito_settings = {
  UserPoolId: 'us-east-1_xxxxxxxx',
  ClientId: 'xxxxxxxxxxxxx',
  IdentityPoolId: 'us-east-1:xxxxxxxxxxxxxxxxxxxxx'
};

// userPool = new CognitoUserPool(aws_cognito_settings)
// ^ NOTE ^ Normally this would be executed here., but since we have no endpoint would just result
// in error.
Buffer = require('buffer/').Buffer;

send_upload = function() {
  var credence, p33, params, s3;
  credence = this.state.id_id.Credentials;
  AWS.config.update(credence);
  p33 = {
    apiVersion: '2006-03-01',
    Credentials: credence
  };
  s3 = new AWS.S3(p33);
  params = {
    Body: new Buffer('9485aeuaeuaeu948385'),
    Bucket: 'exampleimages',
    Key: 'exampleobject333'
  };
  return s3.upload(params, function(err, data) {
    return c('383883838', err, data);
  });
};

handle_cognito_session_pull = function() {
  return this.state.cognito_current_user.getSession((err, session) => {
    var c_identity, the_logins_arq;
    the_logins_arq = {
      'cognito-idp.us-east-1.amazonaws.com/us-east-1_xxxxxxx': session.getIdToken().getJwtToken()
    };
    if (err) {
      alert('error getting session in ufo');
    }
    this.state.cognito_current_user.getUserAttributes((err2, attributes) => {
      if (err2) {
        return alert('error getting userAttributes in ufo');
      } else {
        return this.setState({
          cognito_user_attributes: attributes,
          session: session
        });
      }
    });
    AWS.config.credentials = new AWS.CognitoIdentityCredentials({
      IdentityPoolId: 'us-east-1:01xxxxxxxxxxxxxxxe',
      Logins: the_logins_arq
    });
    c_identity = new AWS.CognitoIdentity({
      apiVersion: '2014-06-30'
    });
    return c_identity.getId({
      AccountId: acc_id,
      IdentityPoolId: aws_cognito_settings.IdentityPoolId,
      Logins: the_logins_arq
    }, (err4, data) => {
      var id_id, parms_2;
      if (err4) {
        return c('err4', err4);
      } else {
        id_id = data.IdentityId;
        parms_2 = {
          IdentityId: id_id,
          Logins: the_logins_arq
        };
        return c_identity.getCredentialsForIdentity(parms_2, (err7, data7) => {
          if (err7) {
            return c(`err7 ${JSON.stringify(err7)}`);
          } else {
            // c 'data7', data7, 'data7'
            return transferUtility.setupWithCognito({
              region: 'us-east-1',
              identity_pool_id: aws_cognito_settings.IdentityPoolId,
              cognito_region: 'us-east-1',
              caching: true
            }).catch((err48) => {
              return c('there was err48', err48);
            }).then((results3) => {
              if (results3 === true) {
                return this.setState({
                  id_id: data7
                });
              }
            });
          }
        });
      }
    });
  });
};

// https://github.com/aws/aws-amplify/tree/master/packages/amazon-cognito-identity-js
handle_cognito_auth_030 = function({username, pwd}) {
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
  // cognitoUser.getId auth_details,
  //     onSuccess: (res5) =>
  //         alert ("res5 #{JSON.stringify res5}")
  return cognitoUser.authenticateUser(auth_details, {
    onSuccess: (result) => {
      // jwt_token = result.getAccessToken().getJwtToken()
      AWS.config.region = aws_region_000;
      // the_credentials = new CognitoIdentityCredentials
      //     IdentityPoolId: aws_cognito_settings.IdentityPoolId
      //     Logins:
      //         "cognito-idp.#{aws_region_000}.amazonaws.com/#{aws_cognito_settings.UserPoolId}" : result.getAccessToken().getJwtToken()
      // AWS.config.credentials = the_credentials
      this.setState({
        cognito_current_user: userPool.getCurrentUser(),
        cognito_keyset: result
      });
      return handle_cognito_session_pull.bind(this)();
    },
    onFailure: (err) => {
      return alert(`failure error ${err.message || (JSON.stringify(err))}`);
    }
  });
};

cursive_json_markup_keyset = function(keyset, level) {
  return _.map(keyset, (v, k) => {
    return View({
      key: `aeu${level}:${k}`,
      style: {
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center'
      }
    }, Text({
      style: {
        fontSize: 2.3
      }
    // color: 'black'
    }, `level: ${level},  k:`), Text({
      style: {
        fontSize: 8
      }
    // color: 'black'
    }, `${k}`, typeof v !== "object" ? Text({
      style: {
        fontSize: 2.3
      }
    // color: 'cyan'
    }, "v: ", Text({
      style: {
        fontSize: 2
      }
    }, `${v}`)) : void 0), typeof v === "object" ? arguments.callee.bind(this)(v, level + 1) : void 0);
  });
};

handle_try_getId = function() {
  var arq;
  ({
    AccountId: 'xxxxxxxxxx'
  });
  return arq = {
    AccountId: 'xxxxxxxxx',
    IdentityPoolId: aws_cognito_settings.IdentityPoolId,
    Logins: {}
  };
};

// alert (JSON.stringify (_.keys AWS.CognitoIdentityServiceProvider.apiVersions)[0])

// AWS.AWSCognitoIdentity.getId arq, (err3, res3) ->
//     if err3
//         alert "err3: #{JSON.stringify err3}"
//     else
//         alert "res3: #{JSON.stringify res3}"
scrollview_innards = function() {
  // c (JSON.stringify @props.all_users)
  // c '777777', Imm.List.isList(@props.all_users)
  // x3 = @props.all_users
  return View({
    style: {
      display: 'flex',
      backgroundColor: 'snow',
      // backgroundColor: 'lawngreen'
      height: '100%',
      flexDirection: 'column',
      alignItems: 'center'
    }
  // Button
  //     title: "test1"
  //     onPress: @props.test1
  //     style:
  //         width: 100
  //         height: 100
  //         backgroundColor: 'white'
  }, Text({
    style: {
      fontSize: 12,
      color: 'cadetblue'
    }
  }, `Terebinth ${this.props.signin_test_state}`), Text({
    style: {
      fontSize: 8
    }
  // color: 'darkgrey'
  }, `local websocket http connection: :${  // Text
  //     style:
  //         fontSize: 4
  //         # color: 'darkgrey'
  //     "local websocket https connection: :#{@props.counter_one}"
this.props.counter_zero}`), _.map(this.props.all_users, function(v, idx) {
    return View({
      key: `textusers:${idx}`,
      style: {
        margin: 10
      }
    }, Text({
      style: {
        fontSize: 10
      }
    }, v.email));
  }));
};

// Text
//     style:
//         fontSize: 10
//     JSON.stringify v
comp = rr({
  componentDidUpdate: function(prevProps, prevState, snapshot) {
    if ((this.state.cognito_current_user !== null) && (this.state.cognito_current_user !== prevState.cognito_current_user)) {
      handle_cognito_session_pull.bind(this)();
    }
    if (this.state.cognito_keyset !== null) {
      try_photo_upload.bind(this)();
    }
    // prototype testing.
    if ((this.state.id_id !== null) && (this.state.id_id !== prevState.id_id)) {
      return send_upload.bind(this)();
    }
  },
  componentDidMount: function() {},
  // handle_cognito_auth_030.bind(@) tig
  // this was for the test
  getInitialState: function() {
    return {
      id_id: null,
      cognito_session: null,
      cognito_keyset: null,
      cognito_current_user: null,
      cognito_attributes: null
    };
  },
  render: function() {
    return ScrollView({
      contentContainerStyle: {
        width: '100%'
      }
    }, scrollview_innards.bind(this)());
  }
});

// _.map
map_state_to_props = function(state) {
  return {
    // x3 = state.get 'all_users'
    // c '33333'
    // c Imm.List.isList x3
    // c _.keys x3

    // x3.map (v, idx) ->
    //     c 'v1', v
    //     c 'idx2', idx

    // all_users: state.get 'all_users'
    all_users: state.get('all_users'),
    counter_zero: state.get('counter_zero')
  };
};

// net_info: state.get 'net_info'
// signin_test_state: state.get 'test3'
map_dispatch_to_props = function(dispatch) {
  return {
    test1: function() {
      return dispatch({
        type: 'test1'
      });
    },
    update_auth_state: function(creds) {
      return dispatch({
        type: 'update_cognito_auth_state',
        payload: {creds} // or something like this
      });
    }
  };
};

exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));

// Text
//     style:
//         fontSize: 6
//     if  @props.net_info and (@props.net_info.has 'type')
//         "net_info: type #{@props.net_info.get 'type' }"
// Text
//     style:
//         fontSize: 6
//     if  @props.net_info and (@props.net_info.has 'effectiveType')
//         "net_info.effectiveType: #{ @props.net_info.effectiveType }"
// Text
//     style:
//         fontSize: 10
//     "<Cognito-State>"
// TouchableOpacity
//     onPress: =>
//     View
//         style:
//             width: 100
//             height: 20
//             backgroundColor: 'ivory'
//             display: 'flex'
//             justifyContent: 'center'
//             alignItems: 'center'
//         Text
//             style:
//                 fontSize: 8
//             "Logout User"
// Text
//     style:
//         fontSize: 10
//     "<Local-Storage-Cognito>"

// TouchableOpacity
//     onPress: =>
//     View
//         style:
//             width: 100
//             height: 20
//             backgroundColor: 'ivory'
//             display: 'flex'
//             justifyContent: 'center'
//             alignItems: 'center'
//         Text
//             style:
//                 fontSize: 8
//             "Clear Local Storage"
// TouchableOpacity
//     onPress: =>
//         handle_cognito_auth_030.bind(@) tig
//     View
//         style:
//             width: 100
//             height: 20
//             backgroundColor: 'ivory'
//             display: 'flex'
//             justifyContent: 'center'
//             alignItems: 'center'
//         Text
//             style:
//                 fontSize: 8
//             "Update Cognito AuthState"
// TouchableOpacity
//     onPress: =>
//         handle_try_getId.bind(@)()
//     View
//         style:
//             display: 'flex'
//             width: 100
//             height: 20
//             justifyContent: 'center'
//         Text
//             style:
//                 fontSize: 10
//             "try getId call"
// if @state.current_user isnt null
//     View null,
//         Text
//             style:
//                 fontSize: 8
//             "current_user"
//         View null, cursive_json_markup_keyset.bind(@) @state.current_user, 0

// View null, cursive_json_markup_keyset.bind(@) @state.cognito_keyset, 0
