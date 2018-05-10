














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





ufo = require('./scenes/ufo').default
dev_menu = require('./components/developer_menu').default
verification = require('./scenes/verification').default
login = require('./scenes/login').default
signin = require('./scenes/signin').default


photograph_stuff = require('./scenes/photograph_stuff').default




View = rc React.View
Image = rc React.Image
Text = rc React.Text
TouchableOpacity = rc React.TouchableOpacity




render_0 = ->
    View
        style: #{}
            width: '100%'
            height: '100%'
        switch @props.nav_loc
            when 'photograph_stuff'
                photograph_stuff()
            when 'login'
                login()
            when 'signin'
                signin()
            when 'verification'
                verification()
            when 'ufo'
                ufo()
        dev_menu.bind(@)()






comp = rr

    getInitialState: ->
        menu_open: false

    render: render_0





map_state_to_props = (state) ->
    nav_loc: state.get 'nav_loc'






map_dispatch_to_props = (dispatch) ->
    dev_nav_goto: ( loc ) ->
        dispatch
            type: 'dev_nav_goto'
            payload: loc

    # These are deprecated
    dev_goto_onboarding_gallery_sub_1: ->
        dispatch
            type: 'dev_goto_onboarding_gallery_sub_1'
    dev_goto_onboarding_gallery: ->
        dispatch
            type: 'dev_goto_onboarding_gallery'
    dev_goto_onboarding_location: ->
        dispatch
            type: 'dev_goto_onboarding_location'
    dev_goto_signin: ->
        dispatch
            type: 'dev_goto_signin'






exports.default = rc connect(map_state_to_props, map_dispatch_to_props)(comp)
