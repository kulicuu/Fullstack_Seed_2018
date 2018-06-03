(function() {
  var Imm, aa;

  Imm = require('immutable');

  aa = {};

  aa.res_get_all_users = function({state, payload, data}) {
    var all_users_rayy;
    all_users_rayy = data.payload.all_users;
    state = state.set('all_users', all_users_rayy);
    return state;
  };

  exports.default = aa;

}).call(this);
