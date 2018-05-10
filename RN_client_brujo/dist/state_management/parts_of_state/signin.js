(function() {
  // NOTE: Wrt to spinning out the parts of state:
  //  This will seem ridiculous at first, but in the more complex flows will help a lot to keep the app state-space spec
  // clear.
  var Imm, c, signin_state;

  c = console.log.bind(console);

  Imm = require('immutable');

  signin_state = Imm.Map({
    candide_username_available: "indycyndi",
    candide_email_available: null,
    test3: 43
  });

  exports.default = signin_state;

}).call(this);
