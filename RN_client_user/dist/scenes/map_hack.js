


import React, { Component } from 'react';
import { AppRegistry, Text, StyleSheet, View } from 'react-native';

import MapView from 'react-native-maps';

var comp = () => {
    // return '33';
    return (

        <View style={{
            ...StyleSheet.absoluteFillObject,
            height: '100%',
            width: '100%',
            justifyContent: 'flex-end',
            alignItems: 'center'
        }}>
            <MapView
                style={{...StyleSheet.absoluteFillObject}}
                initialRegion={{
                  latitude: 37.78825,
                  longitude: -122.4324,
                  latitudeDelta: 0.0922,
                  longitudeDelta: 0.0421,
                }}
            />
        </View>






        // <View style={{zIndex: 5000}}>
        //
        //
        //
        //     <Text style={{fontSize: 20, color: 'red'}}>hello hollo</Text>
        //
        // </View>
        //
        // // sch: 32
    );
};
// comp = 42;

module.exports = comp;
