notify = require 'gulp-notify'

dev = 'dev/'
dest = 'public/'

config =
  dev: dev
  dest: dest
  markups:
    src: ["#{dev}*.jade", "#{dev}*/*.jade"]
    dest: dest
  styles:
    src: ["#{dev}**/*.sass"]
    dest: dest
  scripts:
    src: ["#{dev}**/*.coffee"]
    dest: dest
    watch: ["#{dev}assets/**/*.coffee"]
  files:
    src: ["#{dev}**/*.+(jpg|jpeg|png|gif|svg|js|html|css)"]
    dest: dest

  options:
    jade:
      pretty: true
    sass:
      indentedSyntax: true
      errLogToConsole: true
      sourceComments : false
    please:
      minifier: false
      autoprefixer:
        browsers: ['last 4 version', 'ie 8', 'iOS 4', 'Android 2.3']
    coffee:
      bare: true
    webpack:
      output:
        sourceMapFilename: 'sourcemap'
      resolve:
        extensions: ['', '.js', '.coffee']
      devtool: 'source-map'
    plumber:
      errorHandler: notify.onError "Error: <%= error.message %>"
    browserSync:
      server:
        baseDir: dest
      notify: false

module.exports = config