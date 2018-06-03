


# When the App gets big, break initial state structure and documentation down, using the opportunity to specify the structure and logical architectural choices of the app.












For example, at the moment I'm needing a piece of state that will be getting effected from server calls, telling the user if the email/username is taken already, as they type it in.  I don't want nested state, where I can avoid it, so everything stays really flat, and imaginative naming creates space.  There will be some space reserved in name for whatever Signin station/scene needs, and it's easier in general to design those pieces individually by domain -- they can be reintegrated later as an optimisation.
