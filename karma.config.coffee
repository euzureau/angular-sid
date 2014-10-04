module.exports = (config) ->
  config.set

    # base path, that will be used to resolve files and exclude
    basePath: ""

    # frameworks to use
    frameworks: [
      "jasmine"
      "requirejs"
    ]

    # list of files / patterns to load in the browser
    files: [
      {
        pattern: "web/js/test/test-main.js"
        included: true
      }
      {

        # config

        #lib file
        pattern: "web/bundles/jquery/dist/jquery.js"
        included: false
      }
      {
        pattern: "web/bundles/angular/angular.js"
        included: false
      }
      {
        pattern: "web/bundles/angular-mocks/angular-mocks.js"
        included: false
      }
      {
        pattern: "web/bundles/angular-route/angular-route.js"
        included: false
      }
      {
        pattern: "web/bundles/angular-resource/angular-resource.js"
        included: false
      }
      {
        pattern: "web/bundles/angular-sanitize/angular-sanitize.js"
        included: false
      }
      {
        pattern: "web/bundles/angular-bootstrap/ui-bootstrap-tpls.js"
        included: false
      }
      {

        # app file
        pattern: "web/js/controllers.js"
        included: false
      }
      {
        pattern: "web/js/directives.js"
        included: false
      }
      {
        pattern: "web/js/factories.js"
        included: false
      }
      {
        pattern: "web/js/filters.js"
        included: false
      }
      {
        pattern: "web/js/providers.js"
        included: false
      }
      {
        pattern: "web/js/routes.js"
        included: false
      }
      {
        pattern: "web/js/services.js"
        included: false
      }
      {
        pattern: "web/js/**/*.js"
        included: false
      }
      {

        #test file
        pattern: "web/js/test/**/*.specs.js"
        included: false
      }
    ]

    # list of files to exclude
    exclude: ["web/js/main.js"]

    preprocessors:
      'web/js/**/*.js' : ['coverage']

    # possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters : ['progress','junit','coverage']

    # web server port
    port: 8082

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true

    # Start these browsers, currently available:
    # - Chrome
    # - ChromeCanary
    # - Firefox
    # - Opera (has to be installed with `npm install karma-opera-launcher`)
    # - Safari (only Mac; has to be installed with `npm install karma-safari-launcher`)
    # - PhantomJS
    # - IE (only Windows; has to be installed with `npm install karma-ie-launcher`)
    browsers: ["PhantomJS"]

    coverageReporter:
      type: 'html',
      dir: 'web/report/',
      subdir: '.',
      file: 'index.html'


    # If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000

    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: true

  return
