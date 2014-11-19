os = require "os"
pkg = require "./package.json"
fs = require "fs"
path = require "path"

recursive = require "recursive-readdir"

TMPDIR = os.tmpdir()


module.exports = (grunt) ->
  pkgs = ["sdl", "sdl-gfx"]
  cc = []
  files = []
  source = false

  if os.platform() is "win32"
    cc.push "-mconsole"

  pkgs = pkgs.map((pkg) -> "--pkg=#{pkg}").join " "
  cc = cc.map((option) -> "--Xcc=#{option}").join " "
  source = if source then "-C" else ""

  readdir = (path) ->
    for file in fs.readdirSync(path) when file not in [".build", "node_modules", "Gruntfile.coffee", "package.json"]
      if fs.statSync("#{path}/#{file}").isDirectory()
        readdir "#{path}/#{file}"
      else
        if file.split(".")[file.split(".").length - 1] is "vala"
          files.push("#{path}/#{file}")

  readdir(".")

  files = files.join " "

  command = "valac --output=.build/#{pkg.name} #{source} #{pkgs} #{cc} #{files}"
  console.log command

  grunt.initConfig
    mkdir:
      build:
        options:
          create: [".build"]
    shell:
      options:
        stderr: true
      compile:
        command: command
    watch:
      files: [
        "**/*.vala", 
        "**/**/*.vala"
      ]
      tasks: ["mkdir", "shell:compile"]

  grunt.loadNpmTasks "grunt-shell"
  grunt.loadNpmTasks "grunt-mkdir"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default", ["mkdir", "shell:compile"]
