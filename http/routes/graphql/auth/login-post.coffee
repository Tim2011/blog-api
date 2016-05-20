request = require 'superagent'
config = require 'config'

module.exports = (req, res, next) ->
  {email, password} = req.body

  request.post config.eadmin.baseUrl + '/oauth/signin'
  .send
    client_id: config.clientId
    email: email
    password: password
  .endAsync()
  .then (response) ->
    res.redirect "/graphql?access_token=#{response.body.access_token}"
  .catch next
