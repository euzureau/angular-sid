#
# dependencies
#
express = require 'express'
#routes = require './routes'
#user = require './routes/user'
path = require "path"
favicon = require 'serve-favicon'
logger = require 'morgan'
methodOverride = require 'method-override'
session = require 'express-session'
bodyParser = require 'body-parser'
multer = require 'multer'
errorHandler = require 'errorhandler'
livereload = require 'connect-livereload'

#
# app
#
appDirName = "web"
app = express()

app.set "port", 9002
app.use logger('dev')
app.use methodOverride()
app.use bodyParser.json()
app.use bodyParser.urlencoded({ extended: true })
app.use multer()
app.use express.static(path.join(__dirname, "..", appDirName))
app.use errorHandler()

allowCrossDomain = (req, res, next) ->
    res.header "Access-Control-Allow-Origin", "*"
    res.header "Access-Control-Allow-Headers", "X-Requested-With"
    next()

app.use livereload(
    port: 35729
    excludeList: [
        ".woff"
        ".flv"
    ]
)
app.use allowCrossDomain

#
# requests
#
app.post '/login', (req, res) ->
    res.send { token : 'XYZ' }

app.get '/docs/*', (req, res) ->
    if !req.xhr
        res.sendfile 'web/docs/index.html'

app.get '/report/*', (req, res) ->
    if !req.xhr
        res.sendfile 'web/report/index.html'

app.get '*', (req, res) ->
    if !req.xhr
        res.sendfile 'web/index.html'

app.listen app.get("port"), ->
  console.log "server listening, port: " + app.get("port") + " path: " + appDirName
