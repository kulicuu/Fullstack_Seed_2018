(function() {
  var Imm, _, api_arq, fp, keys_api_arq, lookup_precursor, shortid;

  _ = require('lodash');

  fp = require('lodash/fp');

  Imm = require('immutable');

  shortid = require('shortid');

  api_arq = {};

  api_arq = fp.assign(api_arq, require('./updates_reducers/index').default);

  api_arq.placeholder = function({state, action}) {
    return state;
  };

  keys_api_arq = _.keys(api_arq);

  lookup_precursor = function({effects_q}) {
    return function(state, action) {
      // c 'action.type', action.type
      if (_.includes(keys_api_arq, action.type)) {
        return api_arq[action.type]({state, action, effects_q});
      } else {
        c('no-op in updates', action.type);
        return state;
      }
    };
  };

  exports.default = lookup_precursor;

}).call(this);
