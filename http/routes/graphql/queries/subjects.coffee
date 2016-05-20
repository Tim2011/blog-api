_ = require 'lodash'
Promise = require 'bluebird'

collectionArgs = require __base + '/common/helpers/collectionArgs'
SubjectCollectionType = require '../types/SubjectCollectionType'
Subject = require __base + '/common/models/Subject'

module.exports =
  type: SubjectCollectionType
  args: _.extend {}, collectionArgs,
    ids:
      type: new GraphQLList GraphQLID
    userId:
      type: GraphQLID
    groupId:
      type: GraphQLID
    isPrivate:
      type: GraphQLBoolean
    isDailyHot:
      type: GraphQLBoolean
  resolve: (root, args, info) ->
    {ids, userId, groupId, isPrivate, limit, offset, isDailyHot} = args
    {session} = root

    query = Subject.find()
    .limit limit or 20
    .skip offset or 0
    .sort 'rank _id'
    .lean()

    if not _.isEmpty ids
      query.where('_id').in ids
    else if userId
      query.where('userId').equals userId
    else if isPrivate
      query.where('userId').equals session.userId
    else
      query.where('groupId').equals groupId or session.groupId

    if isDailyHot is true
      query.where('isDailyHot').equals true
    else if isDailyHot is false
      query.where('isDailyHot').equals false

    Promise.props
      data: query.execAsync()
      count: query.countAsync()
