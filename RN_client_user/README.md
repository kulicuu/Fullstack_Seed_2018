









# Basically How To Do Stuff:

- `npm i`
- `gulp watch` (https://gulpjs.com/) to always compile your `.coffee` files in `./src`
- or you can code directly into `./dist` if you prefer es6, just watch for naming collisions with any compiling files.
- `react-native run-android` with a suitable sim running or device connected.
- `react-native log-android` for JS logs and JS layer stack traces. (You can try getting the native level stack-traces in Android Studio, I found their main tool for that not working on MacOS.)

- Websocket connections assume the dev-server is running.


#### must run this to be able to connect to local websocket server:
`adb reverse tcp:9000 tcp:9000`






#### This cleans stuff:
`watchman watch-del-all && rm -rf node_modules/ && yarn cache clean && yarn install && yarn start -- --reset-cache`



#### After dependency updates

Run gradle clean with (from ./android) `./gradlew clean`. after already letting watchman clean run.
