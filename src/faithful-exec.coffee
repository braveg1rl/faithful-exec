makePromise = require "make-promise"
exec = require("child_process").exec

module.exports = (command, options = {}) ->
  makePromise (resolve, reject) ->
    exec command, options, (err, stdout, stderr) ->
      if err
        err.stdout = stdout
        err.stderr = stderr
        reject err
      else
        resolve
          stdout: stdout
          stderr: stderr