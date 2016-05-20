_ = require 'lodash'

SubjectType = require '../types/SubjectType'
Subject = require __base + '/common/models/Subject'
mvSubjectImage = require __base + '/common/helpers/mvSubjectImage'

module.exports =
  type: SubjectType
  args:
    name:
      type: new GraphQLNonNull GraphQLString
    mediaTypes:
      type: new GraphQLList GraphQLString
    q:
      type: GraphQLString
    not:
      type: GraphQLString
    startDate:
      type: GraphQLString
    isPrivate:
      type: GraphQLBoolean
    isDailyHot:
      type: GraphQLBoolean
  resolve: (root, args, info) ->
    {name, mediaTypes, q, not: _not, isPrivate, isDailyHot, startDate} = args
    {session, req} = root
    file = req.files?.file

    {promise, imagePath} = mvSubjectImage file

    promise.then ->
      Subject.createAsync {
        name
        imagePath
        userId: if isPrivate then session.userId else undefined
        groupId: if not isPrivate then session.groupId else undefined
        isDailyHot
        query: {
          q
          not: _not
          startDate
        }
        queries: _.map mediaTypes, (mediaType) ->
          {mediaType}
      }


