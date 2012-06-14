// Generated by CoffeeScript 1.3.3
(function() {
  var Project, exports;

  Project = (function() {

    function Project(data) {
      var k, v;
      for (k in data) {
        v = data[k];
        this[k] = v;
      }
      this;

    }

    Project._projectData = [];

    Project.setProjectData = function(list) {
      var data, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = list.length; _i < _len; _i++) {
        data = list[_i];
        _results.push(this._projectData = Project(data));
      }
      return _results;
    };

    Project.all = function() {
      return this._projectData;
    };

    Project.oneForFolderAndId = function(folder, projectId) {
      return this.projectsForFolder(folder)[projectId];
    };

    return Project;

  })();

  exports = this;

  exports.Project = Project;

}).call(this);