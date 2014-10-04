###
@angular_sid
(c) 2014
###
define [
    'angular'
    'routes'
    'angular-route'
    'angular-resource',
    'angular-sanitize'
    'angular-bootstrap'
    'controllers'
    'providers'
    'services'
    'factories'
    'directives'
    'filters'
    'constants'
    'templates'
], (
    angular
    routes
) ->
    "use strict"
    name = 'angular-sid'
    angular
        .module name, [
            'ngRoute'
            'ngResource'
            'ngSanitize'
            'ui.bootstrap'
            'angular-sid-controllers'
            'angular-sid-providers'
            'angular-sid-services'
            'angular-sid-factories'
            'angular-sid-directives'
            'angular-sid-filters'
            'angular-sid-templates'
            'angular-sid-constants'
        ]
        .config [
            '$interpolateProvider', '$logProvider', '$locationProvider', '$httpProvider'
            ($interpolateProvider, $logProvider, $locationProvider, $httpProvider) ->
                #$interpolateProvider.startSymbol '(('
                #$interpolateProvider.endSymbol '))'
                # need to check debugEnabled existance due to angular-mock lack
                # $logProvider.debugEnabled? '<%= grunt_template_debug %>' == 'true'
                $locationProvider.html5Mode true
        ]
        .config [
            "$httpProvider"
            ($httpProvider) ->
              "use strict"
              $httpProvider.interceptors.push "errorInterceptorFactory"
        ]
        .config routes
    $body = angular.element('body')
    angular.bootstrap $body, [name]
