{
  GraphQLObjectType
  GraphQLList
  GraphQLInt
} = require 'graphql'

module.exports = ({nodeType}) ->
  new GraphQLObjectType
    name: "#{nodeType.name}Collection"
    fields:
      data:
        type: new GraphQLList nodeType
      count:
        type: GraphQLInt
