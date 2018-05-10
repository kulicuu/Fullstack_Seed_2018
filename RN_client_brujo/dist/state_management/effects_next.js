var Imm, _, api_arq, c, effects_precursor_next, fp, keys_api_arq, shortid;

_ = require('lodash');

fp = require('lodash/fp');

Imm = require('immutable');

shortid = require('shortid');

c = console.log.bind(console);

api_arq = {};

api_arq = fp.assign(api_arq, require('./effects/index').default);

api_arq = fp.assign(api_arq, require('./effects/gatekeeper').default);

api_arq = fp.assign(api_arq, require('./effects/camera').default);

keys_api_arq = _.keys(api_arq);

// TODO Lose the 'next' in the name.
effects_precursor_next = function({state_store}) {
  return function({imm_state}) {
    return imm_state.get('effects').map(function(effect, eid) {
      var etype;
      etype = effect.get('type');
      c('doing effect', etype);
      if (_.includes(keys_api_arq, etype)) {
        return api_arq[etype]({effect, state_store});
      } else {
        return c("No-op in effects with type", etype);
      }
    });
  };
};

//     # NOTE: No logs in production for performance
export default effects_precursor_next;
