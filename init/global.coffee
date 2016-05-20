#
# 全局變量
#

path = require 'path'

global.__base = path.normalize __dirname + '/..'

global.Error400 = class Error400 extends Error
  constructor: (@message) ->
    @name = "Error400"
    Error.captureStackTrace(this, Error400)

global.Promise = require 'bluebird'

{
  GraphQLSchema

  GraphQLObjectType
  GraphQLList
  GraphQLNonNull

  GraphQLInt
  GraphQLFloat
  GraphQLString
  GraphQLBoolean
  GraphQLID
} = require 'graphql'

global.GraphqlSchema = global.GraphQLSchema = GraphQLSchema

global.GraphqlObjectType = global.GraphQLObjectType = GraphQLObjectType
global.GraphqlList = global.GraphQLList = GraphQLList
global.GraphqlNonNull = global.GraphQLNonNull = GraphQLNonNull

global.GraphqlInt = global.GraphQLInt = GraphQLInt
global.GraphqlFloat = global.GraphQLFloat = GraphQLFloat
global.GraphqlString = global.GraphQLString = GraphQLString
global.GraphqlBoolean = global.GraphQLBoolean = GraphQLBoolean
global.GraphqlID = global.GraphQLID = GraphQLID

global.DateTime = require 'graphql-custom-datetype'
