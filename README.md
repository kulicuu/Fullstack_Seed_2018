# Terebinth Fullstack Seed 2018


#### Stack: RethinkDB, React-Native, NodeJS/Primus, AWS,


#### Architecture

Native clients starting with React-Native, but really hoping for a smooth transition to pure-native heavy apps on a fully developed system.

Backend is basically stateless nodeJS/Primus websocket servers, which can be clustered in a 'dumb' (i.e. no sticky-sessions) way.  Authentication is token based, the token is stored on the Spark (a Primus abstraction for websocket connection) for speed, but also stored on RethinkDB for persisting through websocket reconnects.

It should scale.

Everything is an API.

I tend to program in a functional pattern, but not exclusively or purely.

The system servers are stateless and just basically have what I call an "effects-API", whereas the simulator nodes need to maintain state.  For those I use a pattern quite similar to Flux/Redux.  It's some variation on that state-machine idea.  You can see this pattern also in the React clients, which actually is using Redux, but also contains aspects of my own pattern, such as the effects abstraction, for "side effects".



#### Development process outline:

I'm developing on OSX currently, before was on Ubuntu.  It's more or less the same I think.

Assuming installed nodeJS (through nvm is recommended), rethinkDB.

Global npm modules installed: nodemon, gulp, coffeescript, react-native-cli, maybe some more I'll add later.


###### client apps:  

There are two native clients, the normal forward-facing main one for the users, and the backdoor administrative/development/analytical backdoor app, which I call brujo-terminal, roughly that's the client and the API that supports it.

- `gulp watch` from the client root.
- `react-native run-android` et cetera, `react-native log-android`



###### backend
Everything is in the subfolder nodejs-websocket-server.

There are two main server types, correlated with the user-facing API and the brujo-terminal-facing API.  There are command examples for running them with nodemon.  Then typically if I'm developing in a focused way on the backend (like currently) I leave the native clients out of it and just use the simulator, which is in mock-test-simulate folder. This also run with nodemon and can be setup in such a way as to provide very fast iteration time on code changes, throughout quite complex interactions.  For example, in a few seconds it can delete the db, start a fresh db system state instance, spawn up some number of websocket client mock users, have them sign in, post stuff, transact in all kinds of ways.  It's much better than a typical unit test runner.  It's basically an arbitrarily complex & customisable integration test system, which I rolled myself.  And to start it I just trigger nodemon with a file save.
