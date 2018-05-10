(function() {
  var Imm, api_arq, keys_api_arq, lookup;

  global._ = require('lodash');

  global.fp = require('lodash/fp');

  Imm = require('immutable');

  global.shortid = require('shortid');

  global.c = console.log.bind(console);

  api_arq = {};

  api_arq.placeholder = function({state, action}) {
    return state;
  };

  keys_api_arq = _.keys(api_arq);

  lookup = function(state, action) {
    state = state.setIn(['effects'], Imm.Map({}));
    if (_.includes(keys_api_arq, action.type)) {
      return api[action.type]({state, action});
    } else {
      c('no-op in reducer with', action.type);
      return state;
    }
  };

}).call(this);
