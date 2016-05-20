_ = require 'lodash'

collectionArgs = require __base + '/common/helpers/collectionArgs'
SubjectGroupCollectionType = require '../types/SubjectGroupCollectionType'

module.exports =
  type: SubjectGroupCollectionType
  args: _.extend {}, collectionArgs
