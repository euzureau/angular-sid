###
e-xode freelances
(c) 2014
###
tests = []
for file of window.__karma__.files
    if window.__karma__.files.hasOwnProperty(file)
        tests.push file  if /specs\.js$/.test(file)
require.config
    baseUrl: '/base/web/js',
    paths:
        'jquery': '../bundles/jquery/dist/jquery'
        'angular': '../bundles/angular/angular'
        'angular-route': '../bundles/angular-route/angular-route',
        'angular-resource'  : '../bundles/angular-resource/angular-resource'
        'angular-sanitize': '../bundles/angular-sanitize/angular-sanitize'
        'angular-bootstrap' : '../bundles/angular-bootstrap/ui-bootstrap-tpls'
        'angular-mocks' : '../bundles/angular-mocks/angular-mocks'
        'templates' : 'templates'
    shim:
        'angular':
            deps: ['jquery']
            exports: 'angular'
        'angular-route': ['angular'],
        'angular-resource'  : ['angular']
        'angular-sanitize' : ['angular']
        'angular-bootstrap' : ['angular']
        'angular-mocks' : ['angular']
        'templates' : ['angular']
    priority:
        'angular'
    deps: tests
require tests, ->
    window.__karma__.start()
    return
