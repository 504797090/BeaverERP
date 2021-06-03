module.exports = (grunt) => {

  require('load-grunt-tasks')(grunt)

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      all: {
        src: ['./jquery/bootstrap-datetimepicker.js']
      }
    },
    versioncheck: {
      target: {
        options: {
          hideUpToDate: true
        }
      }
    }
  })

  grunt.registerTask('default', ['jshint', 'versioncheck'])
}
