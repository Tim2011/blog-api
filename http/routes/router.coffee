#
# 註冊路由
#

express = require 'express'
config = require 'config'
graphqlHttp = require 'express-graphql'

restrict = require __base + '/http/middlewares/restrict'

app = module.exports = express.Router()

app.use '/public', express.static __base + '/http/public'

app.route '/graphql/login'
.get require './graphql/auth/login-get'
.post require './graphql/auth/login-post'

app.use '/graphql', restrict(), graphqlHttp (req) ->
  schema: require './graphql/schema'
  rootValue:
    session: req.session
    req: req
  graphiql: true
