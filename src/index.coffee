mongoose = require("mongoose")

exports.timestamps = (schema, options) ->
  options = {} unless options

  schema.add
    stats: {
      createdAt: Date
      lastModified: Date
    }

  schema.pre "save", (next) ->
    unless @stats.createdAt
      @stats.createdAt = @stats.lastModified = new Date
    else
      @stats.lastModified = new Date
    next()