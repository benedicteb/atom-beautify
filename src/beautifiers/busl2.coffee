###
Requires https://github.com/hhatto/autopep8
###

"use strict"
Beautifier = require('./beautifier')

module.exports = class Autopep8 extends Beautifier
  name: "busl2"
  link: "https://github.com/benedicteb/busl2"

  executables: [
    {
      name: "busl2"
      cmd: "busl2"
      version: {
        args: ['version'],
        parse: (text) => text.match(/version (\d+\.\d+\.\d+)\:/)[1]
      }
      homepage: "https://github.com/benedicteb/busl2"
      installation: "https://github.com/benedicteb/busl2#installation"
    }
  ]

  options: {
    Groovy: false
  }

  beautify: (text, language, options) ->
    @run("busl2", [
        ["g"]
        ["#{options.indent_size}"] if options.indent_size?
        tempFile = @tempFile("input", text)
      ])
      .then(=> @readFile(tempFile))
