






c = console.log.bind console
_ = require 'lodash'
fp = require 'lodash/fp'
Imm = require 'immutable'
shortid = require 'shortid'




# nav_loc = 'photograph_stuff'
# nav_loc = 'ufo'
# nav_loc ='verification'
# nav_loc = 'login'
nav_loc = 'signin'








initial_effects_030 = require('./parts_of_state/initial_effects').initial_effects_030

signin_state = require('./parts_of_state/signin').default


user_state_030 = Imm.Map
    user_id: null
    username: null
    email: null




dev_counters =
    counter_zero: 0
    counter_one: 100
    counter_two: 200
    counter_three: 300



iis = Imm.Map
    nav_loc: nav_loc
    effects: initial_effects_030
    user_state: user_state_030




iis = iis.merge iis, dev_counters
iis = iis.merge iis, signin_state







exports.imm_initial_state = iis

# # template typical
# exports.imm_initial_state = Imm.Map
#
#
#
#     counter_zero: 0
#     counter_one: 100
#     counter_two: 200
#     counter_three: 300
#
#     cursor_post_product_photos: Imm.List([])
#
#
#     # nav_loc: 'photograph_stuff'
#     nav_loc: nav_loc
#
#     effects : initial_effects



exports.dev_mock_load_user = Imm.Map

    cursor_post_product_photos: ( Imm.List [] )
    nav_loc: 'ufo'



    effects :
        "#{shortid()}":
            type: 'init_primus'
        "#{shortid()}":
            type: 'init_netinfo'
