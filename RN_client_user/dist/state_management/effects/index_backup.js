var Primus, aa, c, https_Primus, primus_config;

c = console.log.bind(console);

Primus = require('../../client_libs/http_primus.js');

https_Primus = require('../../client_libs/https_primus.js');

aa = {};

aa.placeholder = function() {
  return 43;
};

import React, {
  NetInfo
} from 'react-native';

primus_config = {
  url: 'http://127.0.0.1:9000'
};

aa.init_netinfo = function({effect, state_store}) {
  NetInfo.getConnectionInfo().then(function(net_info) {
    // c 'net_info', net_info
    return state_store.dispatch({
      type: 'net_info_data',
      payload: {net_info}
    });
  });
  return NetInfo.addEventListener('connectionChange', function(net_info) {
    return state_store.dispatch({
      type: 'net_info_update_data',
      payload: {net_info}
    });
  });
};

aa.init_primus = function({effect, state_store}) {
  var http_local_primus;
  http_local_primus = new Primus({
    url: 'http://127.0.0.1:9000'
  }, {
    websockets: true
  });
  global.http_local_primus = http_local_primus;
  state_store.dispatch({
    type: 'set_primus_instance',
    payload: {
      primus: http_local_primus
    }
  });
  http_local_primus.on('open', function() {
    return c('local http primus is open');
  });
  http_local_primus.on('error', function(e) {
    return c('primus error', e, 'primus_error');
  });
  return http_local_primus.on('data', function(data) {
    // c 'local http primus have data', data, 'primus have data'
    return state_store.dispatch({
      type: 'local_http_primus_have_data',
      payload: {data}
    }, {
      data: data,
      server_type: 'http_local'
    });
  });
};

// https_local_primus = new https_Primus({ url: 'https://127.0.0.1:7084' }, { websockets: true })

// https_local_primus.on 'open', ->
//     c 'local https primus is open'

// https_local_primus.on 'error', (e) ->
//     c 'local https primus error', 'primus_error'

// https_local_primus.on 'data', (data) ->
//     c 'local https primus have data', data, 'primus have data'
//     state_store.dispatch
//         type: 'local_https_primus_have_data'
//         payload: { data }

// http_digi_ocean_primus = new Primus({url: 'http://138.68.232.74:9000'}, {websockets: true})
// c 'http_digi_ocean_primus', http_digi_ocean_primus
// http_digi_ocean_primus.on 'open', ->
//     c 'http digital ocean websocket open \n\n\n'
// http_digi_ocean_primus.on 'error', (e) ->
//     c 'http_digital_ocean has error\n\n\n', e
// http_digi_ocean_primus.on 'data', (data) ->
//     c 'digi ocean has data', data
// state_store.dispatch
//     type: 'dgoc_http_primus_have_data'
//     payload: { data }

// TODO: https_digi_ocean_primus = new Primus({}, {websockets: true})

// state_store.dispatch
//     type: 'feedback loop feedback loop feedback loop feedback loop feedback loop feedback loop feedback loop feedback loop feedback loop'
//     payload: {aaaaa: 3838383}
exports.default = aa;
