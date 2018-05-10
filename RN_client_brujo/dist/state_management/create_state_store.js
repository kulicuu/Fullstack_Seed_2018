var Imm, ReactO, _, c, effect_trigger, effects, effects_q, fp, imm_initial_state, lookup, lookup_precursor, rc, rc_Provider, shortid, state_store;

c = console.log.bind(console);

_ = require('lodash');

fp = require('lodash/fp');

Imm = require('immutable');

shortid = require('shortid');

ReactO = require('react'); // NOTE: `require` still works.

rc = function() {
  return ReactO.createFactory.apply(ReactO, arguments);
};

import {
  compose,
  createStore,
  applyMiddleware,
  bindActionCreators,
  combineReducers
} from 'redux';

import thunk from 'redux-thunk';

({imm_initial_state} = require('./kinds_of_initial_state'));

import {
  EventRegister
} from 'react-native-event-listeners';

import {
  Provider
} from 'react-redux';

rc_Provider = rc(Provider);

effects_q = {
  [`${shortid()}`]: {
    type: 'init_primus'
  }
};

// "#{shortid()}":
//     type: 'init_netinfo'
lookup_precursor = require('./update_reduce').default;

lookup = lookup_precursor({effects_q});

state_store = createStore(lookup, imm_initial_state, compose(applyMiddleware(thunk)));

effects = require('./effects').default({state_store});

effect_trigger = function() {
  return effects({effects_q});
};

state_store.subscribe(effect_trigger);

effects({effects_q});

export default state_store;
