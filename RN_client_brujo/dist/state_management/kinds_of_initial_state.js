(function() {
  var Imm, _, c, dev_counters, fp, iis, initial_effects_030, nav_loc, shortid, signin_state, user_state_030;

  c = console.log.bind(console);

  _ = require('lodash');

  fp = require('lodash/fp');

  Imm = require('immutable');

  shortid = require('shortid');

  nav_loc = 'ufo';

  initial_effects_030 = require('./parts_of_state/initial_effects').initial_effects_030;

  signin_state = require('./parts_of_state/signin').default;

  user_state_030 = Imm.Map({
    user_id: null,
    username: null,
    email: null
  });

  dev_counters = {
    counter_zero: 0,
    counter_one: 100,
    counter_two: 200,
    counter_three: 300
  };

  iis = Imm.Map({
    nav_loc: nav_loc,
    primus_ready: false,
    effects: initial_effects_030,
    user_state: user_state_030
  });

  iis = iis.merge(iis, dev_counters);

  iis = iis.merge(iis, signin_state);

  exports.imm_initial_state = iis;

  // # template typical
  // exports.imm_initial_state = Imm.Map

  //     counter_zero: 0
  //     counter_one: 100
  //     counter_two: 200
  //     counter_three: 300

  //     cursor_post_product_photos: Imm.List([])

  //     # nav_loc: 'photograph_stuff'
  //     nav_loc: nav_loc

  //     effects : initial_effects
  exports.dev_mock_load_user = Imm.Map({
    cursor_post_product_photos: Imm.List([]),
    nav_loc: 'signin',
    effects: {
      [`${shortid()}`]: {
        type: 'init_primus'
      },
      [`${shortid()}`]: {
        type: 'init_netinfo'
      }
    }
  });

}).call(this);
