(function() {
  var Imm, aa;

  Imm = require('immutable');

  aa = {};

  aa.res_get_all_users = function({state, payload, data}) {
    var all_users_rayy;
    all_users_rayy = data.payload.all_users;
    // c '\n'
    // c all_users_rayy
    // c '\n'
    // x3 = Imm.List all_users_rayy
    // c 'is?'
    // c Imm.List.isList x3
    // c '...'
    // c 'so...'
    // # x3.map (v, idx) ->
    // #     c 'v', v
    // #     c 'idx', idx
    // # state = state.set 'all_users', Imm.List(all_users_rayy)
    state = state.set('all_users', all_users_rayy);
    // x4 = state.get 'all_users'
    // x4.map (v, idx) ->
    //     c 'v', v
    //     c 'idx', idx

    // state = state.set 'all_users', all_users_rayy
    return state;
  };

  exports.default = aa;

}).call(this);
