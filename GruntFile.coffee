#
# Angular Sid
# GruntFile
#
renameCoffee = (dest, name) ->
    dest + '/' + name.replace 'coffee', 'js'

renameLess = (dest, name) ->
    dest + '/' + name.replace 'less', 'css'

renameConfig = (dest, name) ->
    dest + '/config.js'
#
# exports
#
module.exports = (grunt) ->

    grunt.initConfig
        #
        # ngdocs
        #
        ngdocs:
            options:
                dest: 'web/docs'
                html5Mode: true
                startPage : '/api'
                title: "angular-sid docs"
            api:
                src: ['web/js/**/*.js', '!web/js/**/*.specs.js']
                title: 'API documentation'
        #
        # karma
        #
        karma:
            unit:
                configFile: 'karma.config.coffee'
        #
        # html2js
        #
        html2js:
            options:
                base : 'app/tpl'
            main:
                src: ['app/tpl/**/*.tpl.html']
                dest: 'web/js/templates.js'
                module: 'angular-sid-templates'
        #
        # watch
        #
        watch :
            options:
                livereload: true
            coffee:
                files: ['**/*.coffee', '!**/_*.coffee']
                tasks: ['coffee:local', 'coffee:all']
            less:
                files : ['**/*.less', '!**/_*.less']
                tasks : ['less:all']
            html2js:
                files : ['app/tpl/**/*.tpl.html']
                tasks : ['html2js']
            server:
                files: ['server/server.coffee']
                tasks: ['express']
                options :
                    spawn: false
        #
        # express
        #
        express:
            options:
                debug: false
                port: 9002
                background: true
                opts: ['node_modules/coffee-script/bin/coffee']
                args: []
            local:
                options :
                    script: 'server/server.coffee'
                    node_env: 'local'
        #
        # open
        #
        open:
            server:
                path: 'http://localhost:<%= express.options.port %>/index.html'
        #
        # clean, delete before compile
        #
        clean:
            all: do ->
                folders = []
                folders.push(
                    'web/css'
                    'web/js'
                )
                folders
        #
        # less
        #
        less:
            all:
                options:
                    dumpLineNumbers: 'all'
                files: do ->
                    folders = []
                    folders.push(
                        expand: true
                        cwd: 'app/less'
                        src: ['**/*.less', '!**/_*.less']
                        dest: 'web/css'
                        rename: renameLess
                    )
                    folders

        #
        # coffee
        #
        coffee:
            options:
                bare: true
            local:
                options:
                    sourcemap: true
                files: [
                    expand: true
                    cwd: 'app/coffee'
                    src: ['constants/config/_local.coffee']
                    dest: 'web/js'
                    rename: renameConfig
                ]
            all:
                options:
                    sourcemap: true
                files: [
                    expand: true
                    cwd: 'app/coffee'
                    src: ['**/*.coffee', '!**/_*.coffee']
                    dest: 'web/js'
                    rename: renameCoffee
                ]

    grunt.loadNpmTasks 'grunt-express-server'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-open'
    grunt.loadNpmTasks 'grunt-html2js'
    grunt.loadNpmTasks 'grunt-karma'
    grunt.loadNpmTasks 'grunt-ngdocs'

    grunt.registerTask 'serve', () ->
        grunt.task.run([
            'express:local'
            'open:server'
            'watch'
        ])

    grunt.registerTask 'build', [
        'clean:all'
        'less:all'
        'coffee:local'
        'coffee:all'
        'html2js:main'
        'ngdocs'
        'karma'
    ]

    grunt.registerTask 'test', [
        'karma'
    ]

    grunt.registerTask 'default', [
        'build'
        'serve'
    ]
