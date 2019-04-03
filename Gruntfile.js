module.exports = function(grunt) {

  var globalConfig = {
    themeDir: 'themes/afterclass2'
  };

  // Project configuration.
  grunt.initConfig({

    globalConfig: globalConfig,
    pkg: grunt.file.readJSON('package.json'),
    

    sass: {
      dist: { 
        files: {
          '<%=globalConfig.themeDir %>/css/main.css' : '<%=globalConfig.themeDir %>/scss/main.scss'
        },                  // Target
        options: {              // Target options
          style: 'compressed',
          sourcemap: 'true',
          loadPath: ['vendor/md/division-project/src/scss']

        }
      }
    },
    //concat all the files into the build folder

    concat: {
      js:{
        src: [
        // 'division-bar/js/division-bar.js',
        '<%=globalConfig.themeDir %>/js/calendar/calendar.js',
        '<%=globalConfig.themeDir %>/js/calendar/calendar_widget.js',
        '<%=globalConfig.themeDir %>/js/calendar/calendar_en.js',
        '<%=globalConfig.themeDir %>/js/calendar/calendar_widget_init.js',
        '<%=globalConfig.themeDir %>/js/lib/**/*.js',
        '<%=globalConfig.themeDir %>/js/lib/*.js',
        '<%=globalConfig.themeDir %>/js/*.js'
        ],
        dest: '<%=globalConfig.themeDir %>/build/app.src.js'
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
        '<%=globalConfig.themeDir %>/build/app.js': ['<%=globalConfig.themeDir %>/build/app.src.js'],
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
        files: ['<%=globalConfig.themeDir %>/scss/*.scss', '<%=globalConfig.themeDir %>/scss/**/*.scss', 'uiowa-bar/scss/*.scss'],
        tasks: ['sass'],
        options: {
          spawn: true,
        }
      }
    },

  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Default task(s).
  // Note: order of tasks is very important
  grunt.registerTask('default', ['sass', 'concat', 'uglify', 'watch']);

};