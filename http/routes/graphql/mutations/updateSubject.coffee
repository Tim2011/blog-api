_ = require 'lodash'

SubjectType = require '../types/SubjectType'
Subject = require __base + '/common/models/Subject'
mvSubjectImage = require __base + '/common/helpers/mvSubjectImage'

module.exports =
  type: SubjectType
  args:
    id:
      type: new GraphQLNonNull GraphQLID
    name:
      type: GraphQLString
    q:
      type: GraphQLString
    not:
      type: GraphQLString
    startDate:
      type: GraphQLString
    isDailyHot:
      type: GraphQLBoolean
    mediaTypes:
      type: new GraphQLList GraphQLString
  resolve: (root, args, info) ->
    {id, name, q, not: _not, isDailyHot, mediaTypes, startDate} = args
    {req} = root
    file = req.files?.file

    {promise, imagePath} = mvSubjectImage file

    promise.then ->
      Subject.findByIdAsync id
    .then (subject) ->

      queriesByMediaType = _.indexBy subject.queries, 'mediaType'

      _.extend subject, {
        name
        imagePath: imagePath or subject.imagePath
        query: {
          q
          not: _not
          startDate
        }
        queries: _.map mediaTypes, (mediaType) ->
          queriesByMediaType[mediaType] or {
            mediaType
          }
        isDailyHot
        updatedAt: Date.now()
      }

      subject.saveAsync()
