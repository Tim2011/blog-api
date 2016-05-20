SubjectType = require '../types/SubjectType'
Subject = require __base + '/common/models/Subject'

module.exports =
  type: SubjectType
  description: '單個話題'
  args:
    id:
      type: new GraphQLNonNull GraphQLID
  resolve: (root, args) ->
    {id} = args

    Subject.findByIdAsync id
