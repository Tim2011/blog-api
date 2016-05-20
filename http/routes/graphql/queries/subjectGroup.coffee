SubjectGroupType = require '../types/SubjectGroupType'

module.exports =
  type: SubjectGroupType
  description: '單個話題組'
  args:
    id:
      type: new GraphQLNonNull GraphQLID
