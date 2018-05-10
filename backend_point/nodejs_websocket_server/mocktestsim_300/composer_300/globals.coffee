
global.flow = require 'async'
global.Bluebird = require 'bluebird'
global.Imm = require 'immutable'
global.c = console.log.bind console
global.color = require 'bash-color'
# global.c = ->
#     # arguments.push (color.blue 'composer:' , on)
#     # console.log (color.blue 'composer:', on), arguments
#     arrg = _.map arguments, (v, k) ->
#         v
#     console.log (color.blue 'composer:', on), arrg

global._ = require 'lodash'
global.fp = require 'lodash/fp'
global.color = require 'bash-color'
global.shortid = require 'shortid'
global.v4 = require 'uuid/v4'
global.path = require 'path'



global.m_dispatch = ({ state, update_name }) ->
    state = state.setIn ['effects', shortid()], Imm.Map
        type: 'meta_dispatch'
        payload: { update_name }
    state
