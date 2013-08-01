Viff = require './viff.js'
Reporter = require './reporter.js'
processArgs = require './process.argv.js'

config = processArgs process.argv

viff = new Viff config.seleniumHost
viff.takeScreenshots(config.browsers, config.envHosts, config.paths).done (compares)->
  Viff.diff compares, (compares) ->
    console.log new Reporter(compares).to config.reportFormat

