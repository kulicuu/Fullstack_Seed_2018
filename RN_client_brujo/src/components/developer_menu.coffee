










_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
shortid = require 'shortid'
c = console.log.bind console
import React, {createElement} from 'react-native'
ReactO = require 'react' # NOTE: `require` still works.
import createReactClass from 'create-react-class'
rr = -> ReactO.createFactory(createReactClass.apply(ReactO, arguments))
rc = -> ReactO.createFactory.apply(ReactO, arguments)









View = rc React.View
Image = rc React.Image
Text = rc React.Text
TouchableOpacity = rc React.TouchableOpacity












exports.default = ->
    if @state.menu_open is false
        TouchableOpacity
            style:
                position: 'absolute'
                top: 0
                right: 0
            onPress: =>
                if @state.menu_open is false
                    @setState
                        menu_open: true
            View
                style:
                    width: 40
                    height: 40
                    backgroundColor: 'magenta'
                    opacity: .07
    else
        View
            style:
                position: 'absolute'
                display: 'flex'
                flexDirection: 'column'
                alignItems: 'center'
                justifyContent: 'space-around'
                width: 360
                height: 600
                right: 0
                top: 0
                backgroundColor: 'snow'
                opacity: .83
            Text
                style:
                    fontSize: 10
                "React.version: #{React.version}"
            TouchableOpacity
                onPress: =>
                    @setState
                        menu_open: false
                View
                    style:
                        display: 'flex'
                        alignItems: 'center'
                        justifyContent: 'center'
                        width: 40
                        height: 40
                        backgroundColor: 'lightgrey'
                    Text
                        style:
                            fontSize: 20
                            color: 'darkgrey'
                        "X"
            TouchableOpacity
                onPress: =>
                    @props.dev_nav_goto 'login'
                    @setState
                        menu_open: false
                View
                    style:
                        display: 'flex'
                        alignItems: 'center'
                        justifyContent: 'center'
                        width: 40
                        height: 40
                        backgroundColor: 'ivory'
                    Text
                        style:
                            textAlign: 'center'
                            fontSize: 10
                            color: 'darkgrey'
                        "login"
            TouchableOpacity
                onPress: =>
                    @props.dev_nav_goto 'signin'
                    @setState
                        menu_open: false
                View
                    style:
                        display: 'flex'
                        alignItems: 'center'
                        justifyContent: 'center'
                        width: 40
                        height: 40
                        backgroundColor: 'ivory'
                    Text
                        style:
                            textAlign: 'center'
                            fontSize: 10
                            color: 'darkgrey'
                        "signin"
            TouchableOpacity
                onPress: =>
                    @props.dev_nav_goto 'verification'
                    @setState
                        menu_open: false
                View
                    style:
                        display: 'flex'
                        alignItems: 'center'
                        justifyContent: 'center'
                        width: 40
                        height: 40
                        backgroundColor: 'ivory'
                    Text
                        style:
                            textAlign: 'center'
                            fontSize: 10
                            color: 'darkgrey'
                        "verification"
            TouchableOpacity
                onPress: =>
                    @props.dev_nav_goto 'other53'
                    @setState
                        menu_open: false
                View
                    style:
                        display: 'flex'
                        alignItems: 'center'
                        justifyContent: 'center'
                        width: 40
                        height: 40
                        backgroundColor: 'ivory'
                    Text
                        style:
                            textAlign: 'center'
                            fontSize: 10
                            color: 'darkgrey'
                        "map_station"
            TouchableOpacity
                onPress: =>
                    @props.dev_nav_goto 'photograph_stuff'
                    @setState
                        menu_open: false
                View
                    style:
                        display: 'flex'
                        alignItems: 'center'
                        justifyContent: 'center'
                        width: 40
                        height: 40
                        backgroundColor: 'ivory'
                    Text
                        style:
                            textAlign: 'center'
                            fontSize: 10
                            color: 'darkgrey'
                        "photograph_stuff"
            TouchableOpacity
                onPress: =>
                    @props.dev_nav_goto 'ufo'
                    @setState
                        menu_open: false
                View
                    style:
                        display: 'flex'
                        alignItems: 'center'
                        justifyContent: 'center'
                        width: 40
                        height: 40
                        backgroundColor: 'ivory'
                    Text
                        style:
                            textAlign: 'center'
                            fontSize: 10
                            color: 'darkgrey'
                        "ufo (conn)"
            TouchableOpacity
                onPress: =>
                    # @props.dev_nav_goto 'ufo'
                    # @setState
                    #     menu_open: false
                View
                    style:
                        display: 'flex'
                        alignItems: 'center'
                        justifyContent: 'center'
                        width: 120
                        height: 40
                        backgroundColor: 'snow'
                    Text
                        style:
                            fontFamily: 'courier'
                            textAlign: 'center'
                            fontSize: 8
                            color: 'magenta'
                        "reset state to UFO & kill + reopen websocket connection"
