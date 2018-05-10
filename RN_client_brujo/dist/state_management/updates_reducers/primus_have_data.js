(function() {
  var Imm, aa, keys_aa;

  global._ = require('lodash');

  global.fp = require('lodash/fp');

  Imm = require('immutable');

  global.shortid = require('shortid');

  global.c = console.log.bind(console);

  aa = {};

  // aa.res_send_signup_candide = ({ state, data }) ->
  //     c 'res_send_signup_candide has data', data
  //     # signup_status = d
  aa = fp.assign(aa, require('./brujo_msgs').default);

  keys_aa = _.keys(aa);

  exports.local_http_primus_have_data = function({state, action}) {
    var data;
    data = action.payload.data;
    state = state.setIn(['counter_zero'], state.getIn(['counter_zero']) + 1);
    // c 'action at http etec handler', action
    if (_.includes(keys_aa, data.type)) {
      return aa[data.type]({
        state: state,
        payload: action.payload,
        data: data
      });
    } else {
      return state;
    }
  };

  // exports.local_https_primus_have_data = ({ state, action }) ->
//     data = action.payload.data
//     state = state.setIn(['lookup','counter_one'], (state.getIn(['lookup', 'counter_one']) + 1))
//     if _.includes(keys_aa, data.type)
//         aa[data.type]
//             state: state
//             payload: action.payload
//             data: data
//     else
//         state

}).call(this);
