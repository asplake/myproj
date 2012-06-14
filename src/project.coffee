class Project
  constructor: (data) ->
    for k, v of data
      this[k] = v
    this

  @_projectData = []
  @setProjectData: (list) ->
    @_projectData = Project(data) for data in list

  @all: -> @_projectData

  @oneForFolderAndId: (folder, projectId) ->
    @projectsForFolder(folder)[projectId]


exports = this
exports.Project = Project
