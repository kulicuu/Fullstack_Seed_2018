






c = console.log.bind console
shortid = require 'shortid'
Imm = require 'immutable'




initial_effects_030 = Imm.Map
    "#{shortid()}": Imm.Map
        type: 'init_primus'
    "#{shortid()}": Imm.Map
        type: 'init_netinfo'




exports.initial_effects_030 = initial_effects_030
