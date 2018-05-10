var Image, Imm, PixelRatio, ReactO, Text, TextInput, TouchableOpacity, View, _, c, comp, fp, main_face, map_dispatch_to_props, map_dispatch_to_props_pc, map_state_to_props, map_state_to_props_pc, minimap_face, minimap_icon_size, product_card, product_card_c, product_card_comp, rc, rr, shortid;

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

View = rc(React.View);

Text = rc(React.Text);

TextInput = rc(React.TextInput);

TouchableOpacity = rc(React.TouchableOpacity);

Image = rc(React.Image);

// NOTE: We need to work with absolute pixel ratios width to height to get certain things right.
// For example, for the product-card presented in a ScrollView, we need to specify the width and height in a way that fixes the ratio of the
PixelRatio = React.PixelRatio;

minimap_icon_size = 20;

// x = 484848
minimap_face = function() {
  return View({
    style: {
      width: '100%',
      height: '100%',
      backgroundColor: 'lightgrey',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'space-around',
      borderRadius: 4,
      marginTop: 0,
      marginBottom: 0,
      paddingBottom: 0,
      paddingTop: 0
    }
  }, View({
    style: {
      width: '100%',
      height: '10%',
      display: 'flex',
      flexDirection: 'row',
      justifyContent: 'flex-end',
      alignItems: 'center'
    }
  // backgroundColor: 'magenta'
  }, TouchableOpacity({
    onPress: () => {
      return this.setState({
        mini: false
      });
    }
  }, View({
    style: {
      height: minimap_icon_size,
      width: minimap_icon_size
    }
  }, Image({
    resizeMode: 'contain',
    resizeMethod: 'scale',
    style: {
      height: minimap_icon_size,
      width: minimap_icon_size
    },
    source: require('../icons/minusController.png')
  })))), View({
    style: {
      width: '100%',
      height: '30%',
      display: 'flex',
      flexDirection: 'row',
      justifyContent: 'space-around',
      alignItems: 'center'
    }
  }, Text({
    style: {
      fontSize: 12,
      color: 'black'
    }
  }, "Favorite"), View({
    style: {
      height: minimap_icon_size,
      width: minimap_icon_size
    }
  }, Image({
    style: {
      height: minimap_icon_size,
      width: minimap_icon_size
    },
    resizeMode: 'contain',
    resizeMethod: 'scale',
    source: require('../icons/favoriteicon.png')
  }))), View({
    style: {
      width: '100%',
      height: '30%',
      display: 'flex',
      flexDirection: 'row',
      justifyContent: 'space-around',
      alignItems: 'center'
    }
  }, Text({
    style: {
      fontSize: 12,
      color: 'black'
    }
  }, "Share"), View({
    style: {
      width: minimap_icon_size,
      height: minimap_icon_size
    }
  }, Image({
    resizeMode: 'contain',
    resizeMethod: 'scale',
    style: {
      width: minimap_icon_size,
      height: minimap_icon_size
    },
    source: require('../icons/shareicon.png')
  }))), View({
    style: {
      width: '100%',
      height: '30%',
      display: 'flex',
      flexDirection: 'row',
      justifyContent: 'space-around',
      alignItems: 'center'
    }
  }, Text({
    style: {
      fontSize: 12,
      color: 'black'
    }
  }, "Report"), View({
    style: {
      width: minimap_icon_size,
      height: minimap_icon_size
    }
  }, Image({
    resizeMode: 'contain',
    resizeMethod: 'scale',
    style: {
      width: minimap_icon_size,
      height: minimap_icon_size
    },
    source: require('../icons/minusController.png')
  }))));
};

main_face = function() {
  return View({
    style: {
      width: '100%',
      height: '100%',
      backgroundColor: 'ivory',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'space-around',
      borderRadius: 4
    }
  }, Image({
    style: {
      width: '100%',
      height: 170,
      borderRadius: 4
    },
    source: require('./s1.jpg')
  }), Text({
    style: {
      fontSize: 12
    }
  }, "Strawberries"), Text({
    style: {
      fontSize: 12
    }
  }, "$3.00", Text({
    style: {
      fontSize: 10
    }
  }, "             / lbs")));
};

product_card = function() {
  return TouchableOpacity({
    style: {
      width: '44%',
      height: 210
    },
    onLongPress: () => {
      if (!this.state.mini) {
        return this.setState({
          mini: true
        });
      }
    },
    onPress: () => {
      return this.props.nav_product_detail();
    }
  // alert 'go to detail page'
  }, this.state.mini === false ? main_face.bind(this)() : minimap_face.bind(this)());
};

product_card_comp = rr({
  getInitialState: function() {
    return {
      mini: false
    };
  },
  render: function() {
    return product_card.bind(this)();
  }
});

map_state_to_props_pc = function() {
  return {};
};

map_dispatch_to_props_pc = function(dispatch) {
  return {
    nav_product_detail: function() {
      return dispatch({
        type: 'nav_product_detail'
      });
    }
  };
};

exports.product_card = product_card_c = rc(connect(map_state_to_props_pc, map_dispatch_to_props_pc)(product_card_comp));

comp = rr({
  getInitialState: function() {
    return {};
  },
  componentDidMount: function() {},
  render: function() {
    return View({
      key: this.props.item,
      style: {
        width: '100%',
        height: 220,
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-around',
        borderRadius: 4
      }
    }, product_card_c.bind(this)(), product_card_c.bind(this)());
  }
});

map_state_to_props = function(state) {
  return {};
};

map_dispatch_to_props = function(dispatch) {
  return {};
};

exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));
