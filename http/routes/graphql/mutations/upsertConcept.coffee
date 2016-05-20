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
  resolve: (root, args, info) ->
    {subjectId, mediaType, q, not: _not, sourceGroup, from, in: _in, by: _by} = args

    Subject.findByIdAsync subjectId
    .then (subject) ->
      if not subject
        throw new Error 'No match subject'

      subject.queries = _.reject subject.queries, (query) ->
        query.mediaType is mediaType

      subject.queries.push {mediaType, q, not: _not, sourceGroup, from, in: _in, by: _by}
      subject.updatedAt = Date.now()

      subject.saveAsync()
