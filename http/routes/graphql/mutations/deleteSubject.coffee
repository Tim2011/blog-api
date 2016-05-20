SubjectType = require '../types/SubjectType'
Subject = require __base + '/common/models/Subject'

module.exports =
  type: SubjectType
  args:
    id:
      type: new GraphQLNonNull GraphQLID
  resolve: (root, args, info) ->
    {id} = args

    Subject.removeAsync
      _id: id
