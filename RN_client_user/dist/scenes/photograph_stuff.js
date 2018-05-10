var FlatList, Image, Imm, List, ListItem, ReactO, ScrollView, Slider, Text, TextInput, TouchableOpacity, V_Camera, View, _, accounting, c, comp, fp, map_dispatch_to_props, map_state_to_props, rc, rr, shortid;

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

Image = rc(React.Image);

ScrollView = rc(React.ScrollView);

TouchableOpacity = rc(React.TouchableOpacity);

Slider = rc(React.Slider);

FlatList = rc(React.FlatList);

List = rc(React.List);

ListItem = rc(React.ListItem);

accounting = require('accounting');

import {
  RNCamera
} from 'react-native-camera';

V_Camera = rc(RNCamera);

comp = rr({
  getInitialState: function() {
    return {
      quantity: 0,
      image_sample_base64: '',
      snapshot: null
    };
  },
  takePicture: function() {
    var options;
    if (this.camera) {
      options = {
        quality: .5,
        base64: true,
        fixOrientation: true
      };
      // data = await @camera.takePictureAsync options #NOTE Async works
      return this.camera.takePictureAsync(options).then((snapshot) => {
        this.setState({
          image_sample_base64: snapshot.base64,
          snapshot: snapshot
        });
        return this.props.process_snapshot(snapshot);
      });
    }
  },
  render: function() {
    return View({
      style: {
        display: 'flex',
        width: '100%',
        height: '100%',
        flexDirection: 'column',
        backgroundColor: 'black',
        justifyContent: 'flex-start',
        alignItems: 'center'
      }
    }, V_Camera({
      ref: (ref) => {
        return this.camera = ref;
      },
      style: {
        width: '100%',
        height: '64%',
        marginTop: 0,
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'flex-end',
        alignItems: 'center'
      },
      type: RNCamera.Constants.Type.back
    // flashMode: RNCamera.Constants.FLashMode.on
    }, TouchableOpacity({
      onPress: () => {
        return this.takePicture();
      }
    }, View({
      style: {
        backgroundColor: "rgba( 34, 24, 43, .63)",
        width: 80,
        height: 80,
        borderRadius: 40,
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        marginBottom: 48
      }
    }, Text({
      style: {
        fontSize: 12,
        color: 'snow'
      }
    }, 'SNAP')))), View({
      style: {
        height: '36%',
        width: '100%',
        backgroundColor: "rgba(200, 200, 200, .7)",
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center'
      }
    }, View({
      style: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-around'
      }
    }, View({
      style: {
        marginTop: 32,
        marginHorizontal: 32,
        width: 160,
        height: 160,
        // aspectRatio: 1
        backgroundColor: 'beige'
      }
    }, Image({
      resizeMode: 'contain',
      resizeMethod: 'scale',
      style: {
        width: 160,
        height: 160
      },
      source: {
        isStatic: true,
        uri: 'data:image/jpeg;base64,' + this.state.image_sample_base64
      }
    })), TouchableOpacity({
      onPress: () => {
        return this.props.use_photo(this.state.snapshot);
      }
    }, View({
      style: {
        width: 60,
        height: 60,
        borderRadius: 30,
        backgroundColor: 'snow',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center'
      }
    }, Text({
      style: {
        fontSize: 12,
        color: 'black'
      }
    }, "USE"))))));
  }
});

// FlatList
//     style:
//         width: '100%'
//         height: '40%'
//     horizontal: true
//     data: [0 .. 30]
//     renderItem: ({ item }) =>
// View
//     style:
//         marginTop: 120
//         marginHorizontal: 10
//         width: 60
//         height: '80%'
//         aspectRatio: 1
//         backgroundColor: 'beige'

//     Image
//         resizeMode: 'contain'
//         resizeMethod: 'scale'
//         style:
//             width: '100%'
//             height: '100%'
//         source:
//             isStatic: true
//             uri: 'data:image/jpeg;base64,'+ @state.image_sample_base64
map_state_to_props = function(state) {
  return {};
};

map_dispatch_to_props = function(dispatch) {
  return {
    use_photo: function(snapshot) {
      return dispatch({
        type: 'use_photo',
        payload: {snapshot}
      });
    },
    process_snapshot: function(snapshot) {
      return dispatch({
        type: 'process_snapshot',
        payload: {snapshot}
      });
    },
    nav_goto: function(loc) {
      return dispatch({
        type: 'nav_goto',
        payload: loc
      });
    }
  };
};

exports.default = rc(connect(map_state_to_props, map_dispatch_to_props)(comp));
