#
# local express instance
#
express = require("express")
http = require("http")
path = require("path")
request = require("request")
app = express()
app.set "port", 9002
app.use express.bodyParser()
app.use express.methodOverride()
appDirName = "web"

allowCrossDomain = (req, res, next) ->
    res.header "Access-Control-Allow-Origin", "*"
    res.header "Access-Control-Allow-Headers", "X-Requested-With"
    next()

app.configure "local", ->
  # live reload script
  liveReloadPort = 35729
  excludeList = [
    ".woff"
    ".flv"
  ]
  app.use require("connect-livereload")(
    port: liveReloadPort
    excludeList: excludeList
  )
  app.use allowCrossDomain

app.use express.static(path.join(__dirname, "..", appDirName))
app.use app.router

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
