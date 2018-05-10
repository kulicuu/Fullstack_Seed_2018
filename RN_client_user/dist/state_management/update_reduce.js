var Imm, _, api_arq, fp, keys_api_arq, lookup, shortid;

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

lookup = function(state, action) {
  if (action.type !== '@@redux/INIT') {
    state = state.setIn(['effects'], Imm.Map({}));
  }
  if (_.includes(keys_api_arq, action.type)) {
    return api_arq[action.type]({state, action});
  } else {
    return state;
  }
};

export default lookup;
