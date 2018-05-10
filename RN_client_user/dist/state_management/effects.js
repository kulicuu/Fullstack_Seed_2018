var Imm, _, api_arq, c, effects_precursor, fp, keys_api_arq, shortid;

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

// NOTE TODO Change this function so it won't be using Imm.toJS(),
// instead using Imm's own iterator funcitons.
effects_precursor = function({state_store}) {
  return function({state_js}) {
    var effect, key_id, ref, results;
    c('have state_js', state_js);
    ref = state_js.effects;
    results = [];
    for (key_id in ref) {
      effect = ref[key_id];
      if (_.includes(keys_api_arq, effect.type)) {
        c('have effect.type', effect.type);
        results.push(api_arq[effect.type]({effect, state_store}));
      } else {
        results.push(c("No-op in effects with type", effect.type, effect));
      }
    }
    return results;
  };
};

//     # NOTE: No logs in production for performance
export default effects_precursor;
