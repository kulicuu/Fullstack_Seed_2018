





# Brujo-Terminal
##### a React-Native client for development, analysis, administration...

###### Likely usage during development on local machine:
It may be possbile to run BrujoTerm from APK with a bluetooth connection for server access, while the UserClient would be run dynamically from simulator or device connected to the `react-native run-android command`; however, for monitoring pure server-side test runs, would just need the one RN client running, so it could be running from sim. In some cases it might be more convenient to have the BrujoTerm as a web-browser client with React instead of RN, but I'll do an RN first, would like to eventually optimise it for hi-res tablets.



# Basically How To Do Stuff:

- `npm i`
- `gulp watch` (https://gulpjs.com/) to always compile your `.coffee` files in `./src`
- or you can code directly into `./dist` if you prefer es6, just watch for naming collisions with any compiling files.
- `react-native run-android` with a suitable sim running or device connected.
- `react-native log-android` for JS logs and JS layer stack traces. (You can try getting the native level stack-traces in Android Studio, I found their main tool for that not working on MacOS.)

- Websocket connections assume the dev-server is running.


#### must run this to be able to connect to local websocket server:
`adb reverse tcp:8999 tcp:8999`






#### This cleans stuff:
`watchman watch-del-all && rm -rf node_modules/ && yarn cache clean && yarn install && yarn start -- --reset-cache`




##### Also good:
(from react-native-rename)
`watchman watch-del-all`, `npm start --reset-cache`

<!-- ###### Output from `react-native-rename BrujoTerm` -->
<!-- > Podfile has been modified, please run "pod install" inside ios directory. [...] -->



#### After dependency updates

Run gradle clean with (from ./android) `./gradlew clean`. after already letting watchman clean run.




### For finding gradle problems:

`./gradlew -q dependencies app:dependencies --configuration compile > output3.txt`



#### If you're getting inexplicable metro bundler issues:

> We faced this issue, In order to fix this, solution is dead simple is below.
>
>    Cancel the current process of“react-native run-android” by CTRL + C
>    or CMD + C
>    Close metro bundler window command line which opened
>    automatically.
>    Run the command again, “react-native run-android”.
>
>    Basically this error tells that your current build got failed due to reasons like Code issue or dependency issue.
