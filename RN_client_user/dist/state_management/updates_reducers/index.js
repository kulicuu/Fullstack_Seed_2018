(function() {
  var Imm, _, aa, c, fp, shortid;

  shortid = require('shortid');

  _ = require('lodash');

  fp = require('lodash/fp');

  Imm = require('immutable');

  aa = {};

  c = console.log.bind(console);

  // given some cogniot authorisation action, put the relevant tokens and such into
  // state. During development we may fire this directly from Ufo view, or better maybe from an effects group.
  aa.update_cognito_auth_state = function({state, action}) {
    // TODO: attach payload relevant parts to state
    return state;
  };

  aa.net_info_data = function({state, action}) {
    return state.set('net_info', Imm.Map(net_info));
  };

  // { net_info } = action.payload
  // c 'net_info', net_info.type

  // state = state.set 'test1', Imm.Map({ hello: 63 })
  // # c 'state looks like', state.getIn(['test1']).get('hello')
  // # g = state.getIn(['test1']).toJS()
  // g = Imm.List([ 1, 2, 3, 4 ])
  // h = [ 1, 2, 3, 4 ]
  // state = state.set 'test2', Imm.List(h)
  // state = state.set 'test7', (g.map.toString() )

  // state = state.set 'net_info', net_info

  // state
  aa.net_info_update_data = function({state, action}) {
    var net_info;
    ({net_info} = action.payload);
    return state.set('net_info', Imm.Map(net_info));
  };

  // NOTE: TODO: The individual gotos can be replaced with this
  aa.use_photo = function({state, action}) {
    state = state.set('cursor_post_product_photos', (state.get('cursor_post_product_photos')).push(action.payload.snapshot));
    state = state.set('nav_loc', 'post_product');
    state = state.setIn(['effects', shortid()], action);
    return state;
  };

  aa.process_snapshot = function({state, action}) {
    // NOTE: probably will alter state here for feedback.
    state = state.setIn(['effects', shortid()], action);
    return state;
  };

  aa.dev_nav_goto = function({state, action}) {
    return state.set('nav_loc', action.payload);
  };

  aa.nav_goto = function({state, action}) {
    return state.set('nav_loc', action.payload);
  };

  aa.cognito_login = function({state, action}) {
    var AWS, result;
    ({AWS, result} = action.payload);
    //TODO Make an effect that puts creds into AsyncStorage,

    // NOTE: Here we can add essential credentials to state.
    // We'll see what essentials there are when we try S3.
    return state;
  };

  aa.set_username = function({state, action}) {
    return state.set('username', action.payload.username);
  };

  aa.send_cognito_signup_data = function({state, action}) {
    return state.setIn(['effects', shortid()], {
      type: 'send_cognito_signup_data',
      payload: action.payload
    });
  };

  aa.send_signup_candide = function({state, action}) {
    return state.setIn(['effects', shortid()], {
      type: 'send_signup_candide',
      payload: action.payload
    });
  };

  // NOTE: These are deprecated and should be removed when convenient:
  aa.nav_product_detail = function({state, action}) {
    state = state.setIn('nav_loc', 'product_detail');
    return state;
  };

  aa.nav_gallery_loc = function({state, action}) {
    state = state.setIn('nav_loc', 'onboarding_location');
    return state;
  };

  aa.dev_goto_onboarding_gallery_sub_1 = function({state, action}) {
    state = state.setIn('nav_loc', 'onboarding_gallery_sub_1');
    return state;
  };

  aa.dev_goto_onboarding_gallery = function({state, action}) {
    state = state.set('nav_loc', 'onboarding_gallery');
    return state;
  };

  aa.dev_goto_onboarding_location = function({state, action}) {
    state = state.set('nav_loc', 'onboarding_location');
    return state;
  };

  aa.dev_goto_signin = function({state, action}) {
    state = state.set('nav_loc', 'signin');
    return state;
  };

  // NOTE Don't put this on state, just a shared object reference should be fine  In fact this needn't even be in
  // state, as primus will only ever be used from effects.  Maybe developer info would want to know if it were updated
  // aa.set_primus_instance = ({ state, action }) ->
  //     state = state.set 'primus', action.payload.primus
  //     state
  aa.local_http_primus_have_data = require('./primus_have_data').local_http_primus_have_data;

  aa.dgoc_http_primus_have_data = require('./primus_have_data').dgoc_http_primus_have_data;

  exports.default = aa;

}).call(this);
