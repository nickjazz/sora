gulp        = require 'gulp'
jade        = require 'gulp-jade'
sass        = require 'gulp-sass'
please      = require 'gulp-pleeease'
webpack     = require 'gulp-webpack'
notify      = require 'gulp-notify'
cached      = require 'gulp-cached'
changed     = require 'gulp-changed'
plumber     = require 'gulp-plumber'
coffee      = require 'gulp-coffee'
sourcemaps  = require 'gulp-sourcemaps'
browserSync = require 'browser-sync'

# Get gulp config
config      = require './gulp.config'
options     = config.options

# markups ########################################################################################

gulp.task 'markups', ->
  gulp.src config.markups.src
    .pipe(cached('markups'))
    .pipe(plumber options.plumber)
    .pipe(jade options.jade)
    .pipe(gulp.dest(config.markups.dest))
    .pipe(browserSync.reload({stream: true}))

# styles ########################################################################################
gulp.task 'styles', ->
  gulp.src config.styles.src
    .pipe(sourcemaps.init())
    .pipe(cached('styles'))
    .pipe(plumber options.plumber)
    .pipe(sass options.sass)
    .pipe(please options.please)
    .pipe(sourcemaps.write('./maps'))
    .pipe(gulp.dest(config.styles.dest))
    .pipe(browserSync.reload({stream: true}))
# scripts #######################################################################################
gulp.task 'scripts', ->
  gulp.src config.scripts.src
    .pipe(cached('scripts'))
    .pipe(plumber options.plumber)
    .pipe(coffee options.coffee)
    # .pipe(webpack(options.webpack))
    .pipe(gulp.dest(config.scripts.dest))
    .pipe(browserSync.reload({stream: true}))
# files #########################################################################################
gulp.task 'files', ->
  gulp.src config.files.src
    .pipe(plumber options.plumber)
    .pipe(changed config.dest)
    .pipe(gulp.dest(config.files.dest))
    .pipe(browserSync.reload({stream: true}))
# utils #########################################################################################
gulp.task 'browserSync', ['watch'], ->
  browserSync options.browserSync

gulp.task 'watch', ['styles', 'scripts', 'files','markups'], ->
  gulp.watch config.markups.src, ['markups']
  gulp.watch config.styles.src, ['styles']
  gulp.watch config.scripts.watch, ['scripts']
  gulp.watch config.files.src, ['files']

gulp.task 'default', ['browserSync']