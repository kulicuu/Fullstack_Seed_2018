var Imm, ReactO, _, c, fp, nexus, rc, rc_Provider, rr, shortid;

console.disableYellowBox = true;

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

import {
  Provider
} from 'react-redux';

rc_Provider = rc(Provider);

nexus = require('./nexus').default;

import state_store from './state_management/create_state_store';

exports.default = rr({
  render: function() {
    return rc_Provider({
      store: state_store
    }, nexus());
  }
});
