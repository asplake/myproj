class Project
  constructor: (@headers, data) ->
    for k, v of data
      this[k] = v
    this

  @items = []
  @headers = []

  @setProjectData: (dataset) ->
    @headers = dataset.headers
    @items = Project(@headers, item) for item in dataset.data

  @all: -> @items


exports = this
exports.Project = Project
