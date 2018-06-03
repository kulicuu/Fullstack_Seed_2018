(function() {
  var Imm, _, aa, c, fp, shortid;

  shortid = require('shortid');

  _ = require('lodash');

  fp = require('lodash/fp');

  Imm = require('immutable');

  aa = {};

  c = console.log.bind(console);

  aa.net_info_data = function({state, action}) {
    return state.set('net_info', Imm.Map(net_info));
  };

  aa.net_info_update_data = function({state, action}) {
    var net_info;
    ({net_info} = action.payload);
    return state.set('net_info', Imm.Map(net_info));
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

  aa.res_init_primus = function({state, action, effects_q}) {
    state = state.set('primus_ready', true);
    effects_q.init_brujoTerm = {
      type: 'gapic_brujo',
      payload: {
        type: 'init_brujoTerm',
        payload: {
          token: 'aeousnth'
        }
      }
    };
    return state;
  };

  aa.local_http_primus_have_data = require('./primus_have_data').local_http_primus_have_data;

  aa.dgoc_http_primus_have_data = require('./primus_have_data').dgoc_http_primus_have_data;

  exports.default = aa;

}).call(this);
