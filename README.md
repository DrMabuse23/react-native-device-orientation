# react-native-device-orientation
Dispatch device orientation. 
### Usage
Add the BrewingDeviceOrientation to your Xcode like [this](https://developer.apple.com/library/ios/recipes/xcode_help-structure_navigator/articles/Adding_an_Existing_File_or_Folder.html)

Example Usage React Native
````

'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  NativeModules,
  NativeAppEventEmitter
} = React;

var orientation = React.createClass({
  getInitialState() {

    return { orientation: 'No Orientation.' };
  },
  componentDidMount() {
    NativeModules.BrewingDeviceOrientation.getOrientation((orientation) => {
      NativeAppEventEmitter.addListener(
        'orientationOnChange',
        (response) => this.setState({orientation: response.orientation})
      );
      this.setState({orientation});
    });


  },
  render: function() {
    return (
      <Text style={{marginTop: 44}}>{this.state.orientation}</Text>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('orientation', () => orientation);

````
