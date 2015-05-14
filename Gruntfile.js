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
          '<%=globalConfig.themeDir %>/css/master.css' : '<%=globalConfig.themeDir %>/scss/master.scss'
        },                  // Target
        options: {              // Target options
          style: 'compressed',
          sourcemap: 'true',
          loadPath: '<%=globalConfig.themeDir %>/bower_components/foundation/scss/'
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
        '<%=globalConfig.themeDir %>/bower_components/blazy/blazy.js',
        '<%=globalConfig.themeDir %>/bower_components/slick-carousel/slick/slick.js',
        '<%=globalConfig.themeDir %>/bower_components/sticky-kit/jquery.sticky-kit.js',
        '<%=globalConfig.themeDir %>/bower_components/stickymojo/stickyMojo.js',
        //'<%=globalConfig.themeDir %>/bower_components/masonry/dist/masonry.pkgd.js',
        //'<%=globalConfig.themeDir %>/bower_components/imagesloaded/imagesloaded.pkgd.js',
        '<%=globalConfig.themeDir %>/bower_components/foundation/js/foundation.js',
        '<%=globalConfig.themeDir %>/js/vendor/mailchimp.js',
        '<%=globalConfig.themeDir %>/js/afterClassEventPage.js',
        '<%=globalConfig.themeDir %>/js/MapStyles.js',
        '<%=globalConfig.themeDir %>/js/mappingWidget.js',
        '<%=globalConfig.themeDir %>/js/nearby.js',
        '<%=globalConfig.themeDir %>/js/init.js'],

        dest: '<%=globalConfig.themeDir %>/build/build.src.js'
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
        '<%=globalConfig.themeDir %>/build/build.js': ['<%=globalConfig.themeDir %>/build/build.src.js'],
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
        tasks: ['sass'],
        options: {
          spawn: true,
        }
      }
    },

    criticalcss: {
            custom: {
                options: {
                    url: "http://localhost:8888/after-class/",
                    width: 1200,
                    height: 900,
                    outputfile: "<%=globalConfig.themeDir %>/templates/Includes/CriticalCss.ss",
                    filename: "<%=globalConfig.themeDir %>/css/master.css", // Using path.resolve( path.join( ... ) ) is a good idea here
                    buffer: 800*1024,
                    ignoreConsole: false
                }
            }
        }
  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-criticalcss');

  // Default task(s).
  // Note: order of tasks is very important
  grunt.registerTask('default', ['sass', 'concat', 'uglify', 'criticalcss', 'watch']);

};