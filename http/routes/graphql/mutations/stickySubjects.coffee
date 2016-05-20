_ = require 'lodash'
SubjectType = require '../types/SubjectType'
Subject = require __base + '/common/models/Subject'

module.exports =
  type: new GraphQLList SubjectType
  args:
    subjectIds:
      type: new GraphQLList GraphQLID
  resolve: (root, args, info) ->
    {subjectIds} = args

    Promise.all _.map subjectIds, (subjectId, index) ->
      Subject.findByIdAndUpdate subjectId,
        rank: index
      .execAsync()


