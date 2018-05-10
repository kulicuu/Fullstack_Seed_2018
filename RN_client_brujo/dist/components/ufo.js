var ReactO, comp, map_dispatch_to_props, map_state_to_props;

global._ = require('lodash');

global.fp = require('lodash/fp');

global.Imm = require('immutable');

global.shortid = require('shortid');

global.c = console.log.bind(console);

import React, {
  createElement
} from 'react-native';

ReactO = require('react'); // NOTE: `require` still works.

import createReactClass from 'create-react-class';

global.rr = function() {
  return ReactO.createFactory(createReactClass.apply(ReactO, arguments));
};

global.rc = function() {
  return ReactO.createFactory.apply(ReactO, arguments);
};

import {
  connect
} from 'react-redux';

global.View = rc(React.View);

global.Text = rc(React.Text);

comp = rr({
  render: function() {
    return View({}, Text({}, "best3333 store"));
  }
});

map_state_to_props = function() {
  return {};
};

map_dispatch_to_props = function() {
  return {};
};

exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));
