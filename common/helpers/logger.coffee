bunyan = require 'bunyan'
config = require 'config'
packageJson = require __base + '/package.json'

module.exports = bunyan.createLogger
  name: config.clientId or packageJson.name
  streams: do ->
    if process.env.NODE_ENV is 'production'
      [path: config.logPath]
    else
      [stream: process.stdout]
