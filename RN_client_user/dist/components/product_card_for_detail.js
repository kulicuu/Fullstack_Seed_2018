// product card
var Image, PixelRatio, ReactO, TextInput, TouchableOpacity, main_face, map_dispatch_to_props_pc, map_state_to_props_pc, minimap_face, minimap_icon_size, product_card, product_card_c, product_card_comp;

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

minimap_icon_size = 20;

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
      width: 120,
      height: 160,
      marginLeft: 10,
      // backgroundColor: 'yellow'
      backgroundColor: 'ivory',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'flex-start',
      borderRadius: 4
    }
  // Text null, 'hello'
  }, View({
    style: {
      width: 120,
      height: 120
    }
  }, Image({
    resizeMode: 'contain',
    resizeMethod: 'scale',
    style: {
      width: 120,
      height: 120,
      borderRadius: 4
    },
    source: require('./s1.jpg')
  })), Text({
    style: {
      fontSize: 8
    }
  }, "Strawberries"), Text({
    style: {
      fontSize: 8
    }
  }, "$3.00", Text({
    style: {
      fontSize: 7
    }
  }, "             / lbs")));
};

product_card = function() {
  return TouchableOpacity({
    // style:
    //     width: 120
    //     height: 160
    //     marginLeft: 10
    onLongPress: () => {
      if (!this.state.mini) {
        return this.setState({
          mini: true
        });
      }
    },
    onPress: () => {}
  // main_face.bind(@)()
  //     # alert 'go to detail page'
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

map_dispatch_to_props_pc = function() {
  return {};
};

exports.product_card = product_card_c = rc(connect(map_state_to_props_pc, map_dispatch_to_props_pc)(product_card_comp));
