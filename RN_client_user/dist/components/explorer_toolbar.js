// explorer toolbar
var Image, ReactO, TextInput, TouchableOpacity, comp, icon_height_width, map_dispatch_to_props, map_state_to_props;

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

icon_height_width = 30;

comp = rr({
  getInitialState: function() {
    return {
      station_green: 0
    };
  },
  render: function() {
    return View({
      style: {
        position: 'absolute',
        height: 100,
        width: '100%',
        backgroundColor: "rgba(0,0,0,0)",
        bottom: 0,
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'center'
      }
    }, TouchableOpacity({
      onPress: () => {
        this.props.nav_goto('post_product');
        return this.setState({
          station_green: 2
        });
      }
    }, Image({
      style: {
        // marginLeft: 0
        width: 130,
        height: 130,
        top: 18
      },
      source: require('../icons/plusButton.png')
    })), View({
      position: 'absolute',
      width: '20%',
      height: '5%',
      borderRadius: 8,
      backgroundColor: 'lightgreen',
      left: `${this.state.station_green * 20}%`,
      bottom: 0
    }), View({
      style: {
        zIndex: -4000,
        position: 'absolute',
        width: '100%',
        height: 60,
        bottom: 0,
        backgroundColor: 'lightgrey',
        display: 'flex',
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-around'
      }
    }, TouchableOpacity({
      onPress: () => {
        return this.setState({
          station_green: 0
        });
      }
    }, View({
      style: {
        width: icon_height_width,
        height: icon_height_width
      }
    }, Image({
      resizeMode: 'contain',
      resizeMethod: 'scale',
      style: {
        width: icon_height_width,
        height: icon_height_width
      },
      source: require('../icons/Exploreicon.png')
    }))), TouchableOpacity({
      onPress: () => {
        return this.setState({
          station_green: 1
        });
      }
    }, View({
      style: {
        width: icon_height_width,
        height: icon_height_width
      }
    }, Image({
      resizeMode: 'contain',
      resizeMethod: 'scale',
      style: {
        width: icon_height_width,
        height: icon_height_width
      },
      source: require('../icons/Communicateicon.png')
    }))), View({
      style: {
        width: icon_height_width,
        height: icon_height_width,
        opacity: 0
      }
    }), TouchableOpacity({
      onPress: () => {
        return this.setState({
          station_green: 3
        });
      }
    }, View({
      style: {
        width: icon_height_width,
        height: icon_height_width
      }
    }, Image({
      resizeMode: 'contain',
      resizeMethod: 'scale',
      style: {
        width: icon_height_width,
        height: icon_height_width
      },
      source: require('../icons/MyAccounticon.png')
    }))), TouchableOpacity({
      onPress: () => {
        return this.setState({
          station_green: 4
        });
      }
    }, View({
      style: {
        width: icon_height_width,
        height: icon_height_width
      }
    }, Image({
      resizeMode: 'contain',
      resizeMethod: 'scale',
      style: {
        width: icon_height_width,
        height: icon_height_width
      },
      source: require('../icons/cart.png')
    })))));
  }
});

map_state_to_props = function(state) {
  return {};
};

map_dispatch_to_props = function(dispatch) {
  return {
    nav_goto: function(loc) {
      return dispatch({
        type: 'nav_goto',
        payload: loc
      });
    }
  };
};

exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));
