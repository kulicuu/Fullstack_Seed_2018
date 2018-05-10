var aa, shortid;

shortid = require('shortid');

import {
  transferUtility
} from 'react-native-s3';

import {
  ImageStore
} from 'react-native';

import React from 'react-native';

aa = {};

aa.use_photo = function({effect, state_store}) {
  var qid, snapshot;
  ({snapshot, qid} = effect.payload); // TODO Add a property qid: shortid(), which will be used to track it in the front-end only.
  
  // NOTE I was going to use ImageStore but I don't see the point since ImageStore just
  // alert snapshot

  // alert ImageStore.addImageFromBase64

  // success = (uri) ->
  //     alert "uri: #{uri}"

  // failure = (err) ->
  //     alert "err: #{err}"

  // ImageStore.addImageFromBase64 snapshot.base64
  // ,(uri) ->
  //     state_store.dispatch
  //         type: 'res_addImageFromBase64'
  //         payload: { uri, qid }
  // ,(err) ->
  //     state_store.dispatch
  //         type: 'res_addImageFromBase64'
  //         payload: { err, qid }

  // so that's nice now we can make reducer effects listeners that will get some of this.
  // Let's also do an S3 experiment to see if we can get that working
  c('38938489234829384923849283498234 \n\n');
  // transferUtility.setupWithNative()
  // .then (res) ->
  //     c 'res', res
  // .catch (err) ->
  //     c 'err3939', err

  // c x, 'x'

  // x.then (aa) ->
  //     c 'aa', aa

  // NOTE: this should be moved to init function.
  return transferUtility.setupWithCognito({
    region: 'us-east-1',
    identity_pool_id: 'us-east-xxxxxxx',
    cognito_region: 'us-east-1',
    caching: true,
    remember_last_instance: true
  }).then(function(res) {
    c(`Result of setup with Cognito: ${res}`);
    return transferUtility.upload({
      bucket: 'exampleimages',
      key: 'snatehous',
      file: 'hello there',
      key: 'satehnu',
      meta: {
        'Content-Type': 'string'
      }
    });
  }).catch(function(err) {
    c(`Err from setup with Cognito ${err}`);
    return state_store.dispatch({
      type: '',
      payload: ''
    });
  });
};

aa.process_snapshot = function({effect, state_store}) {
  var snapshot;
  ({snapshot} = effect.payload);
  // upload to S3, retrieve creds from state store first
  return c('# upload to S3, retrieve creds from state store first');
};

exports.default = aa;
