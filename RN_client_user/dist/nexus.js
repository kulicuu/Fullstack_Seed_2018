var Image, Imm, ReactO, Text, TouchableOpacity, View, _, c, comp, dev_menu, fp, login, map_dispatch_to_props, map_state_to_props, photograph_stuff, rc, render_0, rr, shortid, signin, ufo, verification;

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

ufo = require('./scenes/ufo').default;

dev_menu = require('./components/developer_menu').default;

verification = require('./scenes/verification').default;

login = require('./scenes/login').default;

signin = require('./scenes/signin').default;

photograph_stuff = require('./scenes/photograph_stuff').default;

View = rc(React.View);

Image = rc(React.Image);

Text = rc(React.Text);

TouchableOpacity = rc(React.TouchableOpacity);

render_0 = function() {
  return View({
    style: {
      width: '100%',
      height: '100%'
    }
  }, (function() {
    switch (this.props.nav_loc) {
      case 'photograph_stuff':
        return photograph_stuff();
      case 'login':
        return login();
      case 'signin':
        return signin();
      case 'verification':
        return verification();
      case 'ufo':
        return ufo();
    }
  }).call(this), dev_menu.bind(this)());
};

comp = rr({
  getInitialState: function() {
    return {
      menu_open: false
    };
  },
  render: render_0
});

map_state_to_props = function(state) {
  return {
    nav_loc: state.get('nav_loc')
  };
};

map_dispatch_to_props = function(dispatch) {
  return {
    dev_nav_goto: function(loc) {
      return dispatch({
        type: 'dev_nav_goto',
        payload: loc
      });
    },
    // These are deprecated
    dev_goto_onboarding_gallery_sub_1: function() {
      return dispatch({
        type: 'dev_goto_onboarding_gallery_sub_1'
      });
    },
    dev_goto_onboarding_gallery: function() {
      return dispatch({
        type: 'dev_goto_onboarding_gallery'
      });
    },
    dev_goto_onboarding_location: function() {
      return dispatch({
        type: 'dev_goto_onboarding_location'
      });
    },
    dev_goto_signin: function() {
      return dispatch({
        type: 'dev_goto_signin'
      });
    }
  };
};

exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));
