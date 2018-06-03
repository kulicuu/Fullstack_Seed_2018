(function() {
  var aa;

  aa = {};

  aa.gapic_brujo = function({state, action, effects_q}) {
    return effects_q[`${shortid()}`] = {
      type: 'gapic_brujo',
      payload: action.payload
    };
  };

  exports.default = aa;

}).call(this);
