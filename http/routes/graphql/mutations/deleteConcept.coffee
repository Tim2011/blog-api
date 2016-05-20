_ = require 'lodash'

SubjectType = require '../types/SubjectType'
Subject = require __base + '/common/models/Subject'

module.exports =
  type: SubjectType
  args:
    subjectId:
      type: new GraphQLNonNull GraphQLID
    mediaType:
      type: new GraphQLNonNull GraphQLString
  resolve: (root, args, info) ->
    {subjectId, mediaType} = args

    Subject.findByIdAsync subjectId
    .then (subject) ->
      if not subject
        throw new Error 'No match subject'

      subject.queries = _.reject subject.queries, (query) ->
        query.mediaType is mediaType
      subject.updatedAt = Date.now()

      subject.saveAsync()
