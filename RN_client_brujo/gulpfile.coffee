


c = console.log.bind console
color = require 'bash-color'

c color.red "satonehusatehusatheousntheou", on

swallow_error = (error) ->
    c ',,,gulp wallow', error
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
    gulp.watch './src/**/*.coffee', gulp.parallel('coffee')#.on 'error', (e) ->
        # c JSON.stringify e
        # this.emit 'end'
