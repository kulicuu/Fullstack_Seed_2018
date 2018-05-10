import React from 'react-native'
{AppRegistry} = React

App = require('./dist/App.js').default
AppRegistry.registerComponent 'vinder_react_native', -> App
