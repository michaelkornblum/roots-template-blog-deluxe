axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
dynamic = require 'dynamic-content'
accord = require 'accord'
postcss = accord.load 'postcss'
lost = require 'lost'
_ = require 'lodash'
moment = require 'moment'


module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf']

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.styl', out: 'css/master.css'),
    dynamic()
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
    _ : _
    moment: moment

  postcss:
    use: [lost()]

  locals:
    title: "Template Blog Deluxe"
    description: "a WordPress-like template for Roots"
    author: "Michael S. Kornblum"
    
