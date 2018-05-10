


c = console.log.bind console

swallow_error = (error) ->
    c error
    this.emit 'end'

gulp = require 'gulp'
gutil = require 'gulp-util'

coffeescript = require 'gulp-coffeescript'


gulp.task 'coffee', ->
    gulp.src './src/**/*.coffee'
    .pipe coffeescript({})
    .on 'error', swallow_error
    .pipe gulp.dest('./dist/')


gulp.task 'watch', ->
    (gulp.watch ['./src/**/*.coffee'], ['coffee']).on 'error', (e) ->
        console.log e.toString()
        this.emit 'end'
