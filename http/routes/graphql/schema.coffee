
module.exports = new GraphQLSchema

  query: new GraphQLObjectType
    name: 'Query'
    fields: ->
      # subjectGroups: require './queries/subjectGroups'
      # subjectGroup: require './queries/subjectGroup'
      subjects: require './queries/subjects'
      subject: require './queries/subject'

  mutation: new GraphQLObjectType
    name: 'Mutation'
    fields: ->
      createSubject: require './mutations/createSubject'
      updateSubject: require './mutations/updateSubject'
      deleteSubject: require './mutations/deleteSubject'
      upsertConcept: require './mutations/upsertConcept'
      deleteConcept: require './mutations/deleteConcept'
      stickySubjects: require './mutations/stickySubjects'
