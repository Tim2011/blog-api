mongoose = require 'mongoose'

db = require '../connections/mongo'

ObjectId = mongoose.Schema.Types.ObjectId

schema = new mongoose.Schema
  name: String
  userId: String
  groupId: String
  imagePath: String
  query: Object
  queries: Array
  isDailyHot:
    type: Boolean
    default: true
  rank:
    type: Number
    default: 99
  createdAt:
    type: Date
    default: Date.now
  updatedAt:
    type: Date
    default: Date.now

module.exports = db.model 'subject', schema
