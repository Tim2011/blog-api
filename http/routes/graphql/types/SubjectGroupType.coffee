SubjectType = require './SubjectType'

module.exports = new GraphQLObjectType
  name: 'SubjectGroup'
  description: '話題組'
  fields: ->
    id:
      type: GraphQLID
    name:
      type: GraphQLString
    subjects:
      type: new GraphQLList SubjectType
    createdAt:
      type: DateTime
    updatedAt:
      type: DateTime
