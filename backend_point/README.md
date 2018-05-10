



# Backend System Endpoint

Stateless NodeJS servers can be scaled easily, Primus websocket abstraction layer.


_todo: much of the readme_











Note:

Currently running tests from "mock_and_test" folder, which is simulations


My current development console is 3 terrminalss:

- from `./nodjs_websocket_server` run `sudo nodemon -i ./mocktestsim_300 index.coffee` starts and logs for the normal app user api endpoint.
- from `./nodjs_websocket_server` run `sudo nodemon -i ./mocktestsim_300 brujo_index.coffee` starts and logs for the admin-dev API server endpoint.
- from `./nodejs_websocket_server/mocktestsim_300` run `nodemon -w ./bot_300/ -w ./composer_300/ system_type_300.coffee` starts up a scripted simulation/test server, on which things may be run automatically, but also maintains its own websocket endpoint on which it listens for commands.  Therefore it could also be used headless and remote to run system tests.
