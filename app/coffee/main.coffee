###
@angular_sid
(c) 2014
###
require.config
    paths:
        'jquery': '/bundles/jquery/dist/jquery'
        'angular': '/bundles/angular/angular'
        'angular-route': '/bundles/angular-route/angular-route',
        'angular-resource'  : '/bundles/angular-resource/angular-resource'
        'angular-sanitize': '/bundles/angular-sanitize/angular-sanitize'
        'angular-bootstrap' : '/bundles/angular-bootstrap/ui-bootstrap-tpls'
        'templates' : '/js/templates'
    shim:
        'angular':
            deps: ['jquery']
            exports: 'angular'
        'angular-route': ['angular'],
        'angular-resource'  : ['angular']
        'angular-sanitize' : ['angular']
        'angular-bootstrap' : ['angular']
        'templates' : ['angular']
    deps: ['app']
