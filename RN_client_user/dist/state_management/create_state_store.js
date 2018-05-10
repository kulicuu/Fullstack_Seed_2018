var Imm, ReactO, _, c, effect_trigger_next, effects_next, fp, imm_initial_state, rc, rc_Provider, set_next, shortid, state_store;

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
  Provider
} from 'react-redux';

rc_Provider = rc(Provider);

import lookup from './update_reduce';

state_store = createStore(lookup, imm_initial_state, compose(applyMiddleware(thunk)));

import effects_precursor_next from './effects_next';

effects_next = effects_precursor_next({state_store});

effects_next({
  imm_state: state_store.getState()
});

effect_trigger_next = function({state_store}) {
  return function() {
    return effects_next({
      imm_state: state_store.getState()
    });
  };
};

set_next = effect_trigger_next({state_store});

state_store.subscribe(set_next);

export default state_store;
