

console.disableYellowBox = true


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


import { connect } from 'react-redux'
import { Provider } from 'react-redux'
rc_Provider = rc Provider



# nexus = require('./nexus').default
# import state_store from './state_management/create_state_store'


# exports.default = rr
#     render: ->
#         rc_Provider
#             store: state_store
#             nexus()


View = rc React.View
Image = rc React.Image
Text = rc React.Text
TouchableOpacity = rc React.TouchableOpacity

exports.default = rr
    render: ->
        View
            style:
                width: '100%'
                height: '100%'
                backgroundColor: 'red'
            Text null, 'hlelo'
