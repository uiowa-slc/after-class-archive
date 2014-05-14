module.exports = function(grunt) {

  var globalConfig = {
    themeDir: 'themes/afterclass2'
  };

  // Project configuration.
  grunt.initConfig({

    globalConfig: globalConfig,
    pkg: grunt.file.readJSON('package.json'),
    
    //compile the sass

    compass: {
      dist: {                   // Target
        options: {              // Target options
          sassDir: ['<%=globalConfig.themeDir %>/scss'],
          cssDir: '<%=globalConfig.themeDir %>/css',
          environment: 'production'
        }
      }
    },

    //concat all the files into the build folder

    concat: {
      js:{
        src: [
        'division-bar/js/division-bar.js',
        'event_calendar/javascript/calendar.js',
        'event_calendar/javascript/calendar_widget.js',
        'event_calendar/javascript/lang/calendar_en.js',
        'event_calendar/javascript/calendar_widget_init.js',
        '<%=globalConfig.themeDir %>/js/vendor/**/*.js',
        '<%=globalConfig.themeDir %>/js/vendor/*.js',
        '<%=globalConfig.themeDir %>/js/*.js'],
        dest: '<%=globalConfig.themeDir %>/build/src/main_concat.js'
      }
    },

    //minify those concated files
    //toggle mangle to leave variable names intact

    uglify: {
      options: {
        mangle: true
      },
      my_target:{
        files:{
        '<%=globalConfig.themeDir %>/build/build.js': ['<%=globalConfig.themeDir %>/build/src/main_concat.js'],
        }
      }
    },
    watch: {
      scripts: {
        files: ['<%=globalConfig.themeDir %>/js/*.js', '<%=globalConfig.themeDir %>/js/**/*.js'],
        tasks: ['concat', 'uglify'],
        options: {
          spawn: true,
        }
      },
      css: {
        files: ['<%=globalConfig.themeDir %>/scss/*.scss', '<%=globalConfig.themeDir %>/scss/**/*.scss'],
        tasks: ['compass'],
        options: {
          spawn: true,
        }
      }
    },

  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-simple-watch');

  // Default task(s).
  // Note: order of tasks is very important
  grunt.registerTask('default', ['compass', 'concat', 'uglify', 'simple-watch']);

};