SubjectType = require './SubjectType'

module.exports = new GraphQLObjectType
  name: 'Feed'
  fields: ->
    id:
      type: GraphQLID
    mediaType:
      type: GraphQLString
    title:
      type: GraphQLString
    content:
      type: GraphQLString
    createdAt:
      type: DateTime
    updatedAt:
      type: DateTime
