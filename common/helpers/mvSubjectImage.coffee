mv = require 'mv'
moment = require 'moment'

module.exports = (file)->
  if file
    imagePath = "/subjects/#{moment().valueOf()}.#{file.mimetype?.match(/\w+$/)?[0]}"
    promise = Promise.fromCallback (cb) ->
      mv file.path, __base + '/http/public' + imagePath, {mkdirp: true}, cb
  else
    promise = Promise.resolve()

  {promise, imagePath}
