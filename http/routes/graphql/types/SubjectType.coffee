config = require 'config'

module.exports = new GraphQLObjectType
  name: 'Subject'
  description: '話題'
  fields: ->
    id:
      type: GraphQLID
      resolve: (d) ->
        d._id
    groupId:
      type: GraphQLID
    userId:
      type: GraphQLID
    name:
      type: GraphQLString
    image:
      type: GraphQLString
      resolve: (d) ->
        if d.imagePath
          config.http.baseUrl + '/public' + d.imagePath
    groupName:
      type: GraphQLString
    query:
      type: new GraphQLObjectType
        name: 'SubjectQuery'
        fields: ->
          q:
            type: GraphQLString
          not:
            type: GraphQLString
          startDate:
            type: GraphQLString
    queries:
      type: new GraphQLList new GraphQLObjectType
        name: 'SubjectMediaQuery'
        fields: ->
          mediaType:
            type: GraphQLString
          q:
            type: GraphQLString
          not:
            type: GraphQLString
          sourceGroup:
            type: new GraphQLList GraphQLString
          from:
            type: new GraphQLList GraphQLString
          in:
            type: new GraphQLList GraphQLString
          by:
            type: new GraphQLList GraphQLString
    isDailyHot:
      type: GraphQLBoolean
    rank:
      type: GraphQLInt
    members:
      description: '成員'
      type: new GraphQLList GraphQLString
    createdAt:
      type: DateTime
    updatedAt:
      type: DateTime
