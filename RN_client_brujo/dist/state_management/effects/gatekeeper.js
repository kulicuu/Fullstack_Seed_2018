(function() {
  // NOTE This usage is deprecated.  The primus instances processed in index init_primus
  // will be passed to the
  var aa;

  aa = {};

  aa.send_cognito_signup_data = function({effect, state_store}) {
    var primus;
    primus = p1; // NOTE: Think about how to normalize this through the dev to prod stages.
    return primus.write(effect);
  };

  aa.send_signup_candide = function({effect, state_store}) {
    var primus;
    // primus = http_local_primus
    primus = p1;
    return primus.write({
      type: 'send_signup_candide',
      payload: effect.payload
    });
  };

  exports.default = aa;

}).call(this);
