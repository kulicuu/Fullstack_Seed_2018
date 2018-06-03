(function() {
  var Imm, _, api_arq, c, effects_precursor, fp, keys_api_arq, shortid;

  _ = require('lodash');

  fp = require('lodash/fp');

  Imm = require('immutable');

  shortid = require('shortid');

  c = console.log.bind(console);

  api_arq = {};

  api_arq = fp.assign(api_arq, require('./effects/index').default);

  keys_api_arq = _.keys(api_arq);

  effects_precursor = function({state_store}) {
    return function({effects_q}) {
      if (_.size(effects_q) > 0) {
        return _.map(effects_q, function(effect, eid) {
          var etype;
          etype = effect.type;
          delete effects_q[eid];
          if (_.includes(keys_api_arq, etype)) {
            return api_arq[etype]({effect, eid, state_store});
          } else {
            return c("No-op in effects with type", etype);
          }
        });
      }
    };
  };

  //     # NOTE: No logs in production for performance
  exports.default = effects_precursor;

}).call(this);
