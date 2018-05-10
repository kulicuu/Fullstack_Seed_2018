// product card
var Image, PixelRatio, ReactO, TextInput, TouchableOpacity, comp, map_dispatch_to_props, map_state_to_props;

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

TextInput = rc(React.TextInput);

TouchableOpacity = rc(React.TouchableOpacity);

// Slider = rc React.Slider
Image = rc(React.Image);

// NOTE: We need to work with absolute pixel ratios width to height to get certain things right.
// For example, for the product-card presented in a ScrollView, we need to specify the width and height in a way that fixes the ratio of the
PixelRatio = React.PixelRatio;

comp = rr({
  getInitialState: function() {
    return {
      logs: []
    };
  },
  componentDidMount: function() {},
  // c 'PixelRatio', PixelRatio, PixelRatio.get()
  // @setState
  //     logs: (_.keys PixelRatio.get())
  // logs: ['aeu', 'aoeu', 'santoehus', 'saotenuh']
  render: function() {
    return View({
      style: {
        backgroundColor: 'red',
        width: '100%',
        height: 300
      }
    }, Text({
      style: {
        fontSize: 24
      }
    // View
    //     style:
    //         display: 'flex'
    //         backgroundColor: 'red'
    //         width: 100
    //         height: 100
    }, "hello"), Image({
      style: {
        width: 200,
        height: 200
      },
      source: require('./s1.jpg')
    }));
  }
});

map_state_to_props = function(state) {
  return {};
};

map_dispatch_to_props = function(dispatch) {
  return {};
};

exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));
