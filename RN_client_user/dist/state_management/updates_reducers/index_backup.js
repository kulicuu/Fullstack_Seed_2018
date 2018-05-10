(function() {
  var Imm, _, aa, c, fp, shortid;

  shortid = require('shortid');

  _ = require('lodash');

  fp = require('lodash/fp');

  Imm = require('immutable');

  aa = {};

  c = console.log.bind(console);

  aa.net_info_data = function({state, action}) {
    var net_info;
    ({net_info} = action.payload);
    c('net_info', net_info.type);
    state = state.setIn(['lookup', 'test1'], Imm.Map({
      hello: 43
    }));
    c('state looks like', state.getIn(['lookup', 'test1']).get('hello'));
    return state.setIn(['lookup', 'net_info'], Imm.Map(net_info));
  };

  // aa.net_info_data = ({ state, action }) ->
  //     { net_info } = action.payload
  //     state.setIn [ 'lookup', 'net_info_update' ], net_info

  // NOTE: TODO: The individual gotos can be replaced with this
  aa.dev_nav_goto = function({state, action}) {
    return state.setIn(['lookup', 'nav_loc'], action.payload);
  };

  aa.send_signup_candide = function({state, action}) {
    state = state.setIn(['lookup', 'effects', shortid], {
      type: 'send_signup_candide',
      payload: action.payload
    });
    return state;
  };

  // NOTE: These are deprecated and should be removed when convenient:
  aa.nav_product_detail = function({state, action}) {
    state = state.setIn(['lookup', 'nav_loc'], 'product_detail');
    return state;
  };

  aa.nav_gallery_loc = function({state, action}) {
    state = state.setIn(['lookup', 'nav_loc'], 'onboarding_location');
    return state;
  };

  aa.dev_goto_onboarding_gallery_sub_1 = function({state, action}) {
    state = state.setIn(['lookup', 'nav_loc'], 'onboarding_gallery_sub_1');
    return state;
  };

  aa.dev_goto_onboarding_gallery = function({state, action}) {
    state = state.setIn(['lookup', 'nav_loc'], 'onboarding_gallery');
    return state;
  };

  aa.dev_goto_onboarding_location = function({state, action}) {
    state = state.setIn(['lookup', 'nav_loc'], 'onboarding_location');
    return state;
  };

  aa.dev_goto_signin = function({state, action}) {
    state = state.setIn(['lookup', 'nav_loc'], 'signin');
    return state;
  };

  aa.set_primus_instance = function({state, action}) {
    state = state.set('primus', action.payload.primus);
    return state;
  };

  aa.local_http_primus_have_data = require('./primus_have_data').local_http_primus_have_data;

  aa.dgoc_http_primus_have_data = require('./primus_have_data').dgoc_http_primus_have_data;

  exports.default = aa;

}).call(this);
