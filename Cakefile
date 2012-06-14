{exec} = require 'child_process'

sh = (cmd) ->
  console.log cmd
  exec cmd, (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'compile', 'Compile from src/*.coffee to lib/*.js', ->
  sh 'coffee --compile --output lib src'

task 'compile_data', 'Compile data', ->
  sh 'python tools/csv2json.py data/projects.csv this.Project.setData > lib/projects.js'

task 'build', 'Build project', ->
  invoke 'compile'
  invoke 'compile_data'
