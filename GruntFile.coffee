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
        # coffeelint
        #
        coffeelint:
            app: [
                'app/coffee/**/*.coffee',
                '!app/coffee/test/**/*',
                '!app/coffee/**/*._coffee'
            ]
            test:
                files:
                    src: ['app/coffee/test/**/*.coffee']
            options:
                'indentation' :
                    "value": 4
                    "level": "error"

                'no_trailing_whitespace' :
                    'level' : 'error'

                'max_line_length' :
                    'level' : 'warn'
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
        # requirejs
        #
        requirejs:
            compile:
                options:
                    mainConfigFile: "web/js/main.js"
                    name: "main"
                    out: "web/js/main.js"
                    paths:
                        'jquery': '../bundles/jquery/dist/jquery'
                        'angular': '../bundles/angular/angular'
                        'angular-animate': '../bundles/angular-animate/angular-animate'
                        'angular-route': '../bundles/angular-route/angular-route',
                        'angular-resource'  : '../bundles/angular-resource/angular-resource'
                        'angular-cookies'  : '../bundles/angular-cookies/angular-cookies'
                        'angular-sanitize': '../bundles/angular-sanitize/angular-sanitize'
                        'angular-bootstrap' : '../bundles/angular-bootstrap/ui-bootstrap'
                        'templates' : '../js/templates'
        #
        # compress
        #
        compress:
            main:
                options:
                    archive: do ->
                        d = new Date()
                        c_date = d.getDate()
                        c_month = d.getMonth() + 1
                        c_year = d.getFullYear()
                        c_date = '0' + c_date if c_date <= 9
                        c_month = '0' + c_month if c_month <= 9
                        now = c_year + "-" + c_month + "-" + c_date
                        return 'angular-sid-' + now + '.tar.gz'
                    mode: 'tgz'
                files: [
                    src: ['web/**'], 'dest' : ''
                ]
        #
        # watch
        #
        watch :
            options:
                livereload: true
            coffee:
                files: ['**/*.coffee']
                tasks: ['coffee:local']
            less:
                files : ['**/*.less']
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
                cmd: process.argv[0],
                opts: ['node_modules/coffee-script/bin/coffee']
                args: []
            local:
                options :
                    script: 'server/server.coffee'
                    node_env: 'local'
            dev:
                options :
                    script: 'server/server.coffee'
                    node_env: 'dev'
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
            dev:
                options:
                    sourcemap: false
                files: [
                    expand: true
                    cwd: 'app/coffee'
                    src: ['constants/config/_dev.coffee']
                    dest: 'web/js'
                    rename: renameConfig
                ]
            all:
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
    grunt.loadNpmTasks 'grunt-contrib-requirejs'
    grunt.loadNpmTasks 'grunt-contrib-compress'
    grunt.loadNpmTasks 'grunt-coffeelint'

    grunt.registerTask 'serve', (target) ->
        target = 'local' if target is undefined
        grunt.task.run([
            'build:' + target
            'express:' + target
            'open:server'
            'watch'
        ])

    grunt.registerTask 'release', (target) ->
        target = 'local' if target is undefined
        grunt.task.run([
            'build:' + target
            'requirejs'
            'compress'
        ])

    grunt.registerTask 'build', (target) ->
        target = 'local' if target is undefined
        grunt.task.run([
            'coffeelint'
            'clean:all'
            'less:all'
            'coffee:' + target
            'coffee:all'
            'html2js:main'
            'ngdocs'
            'karma'
        ])

    grunt.registerTask 'test', [
        'karma'
    ]

    grunt.registerTask 'default', [
        'build'
        'serve'
    ]
