_ = require 'lodash'

collectionArgs = require __base + '/common/helpers/collectionArgs'
dataCollectionType = require '../types/dataCollectionType'

module.exports =
  type: dataCollectionType
  args: _.extend {}, collectionArgs,
    subjectId:
      type: new GraphQLNonNull GraphQLID
    mediaType:
      type: GraphQLString
