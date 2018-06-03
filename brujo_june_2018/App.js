import React from 'react';
import { StyleSheet, Text, View } from 'react-native';



// import App from './dist/App'


var App = require('./dist/App').default;


// console.log(c_App);
// export default class App extends React.Component {
//   render() {
//     return (
//       <View style={styles.container}>
//         <Text>Open up App.js to start working on your app!</Text>
//         <Text>Changes you make will automatically reload.</Text>
//         <Text>Shake your phone to open aoeuaeousntauh developer menu.</Text>
//       </View>
//     );
//   }
// }

export default App

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
