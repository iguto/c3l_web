module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    watch :
      options:
        livereload: true
      html:
        files: ['*.html'],
      coffee:
        tasks: 'coffee',
        files: ['coffee/**/*.coffee']
      slim:
        tasks: "slim:dist"
        files: ['**/*.slim']

    coffee:
      compile:
        files: [
          expand: true,
          cwd: 'coffee/',
          src: ['**/*.coffee'],
          dest: 'js/',
          ext: '.js',
        ]
    slim:
      dist:
        files: [
          expand: true
          cwd: './views'
          src: ['**/*.slim']
          dest: './'
          ext: '.html'
        ]


    connect:
      server:
        options:
          port: 9000
          base: './'

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-slim')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.registerTask("default", ["connect", "watch"])
