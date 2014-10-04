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
            '$interpolateProvider'
            ($interpolateProvider) ->
            # if you need to change the interpolation symbols
            # $interpolateProvider.startSymbol '(('
            # $interpolateProvider.endSymbol '))'
        ]
        .config [
            '$locationProvider'
            ($locationProvider) ->
                # enable or disable the html5 mode
                $locationProvider.html5Mode true
        ]
        .config [
            "$httpProvider"
            ($httpProvider) ->
              "use strict"
              $httpProvider.interceptors.push "errorInterceptorFactory"
              $httpProvider.interceptors.push "requestInterceptorFactory"
        ]
        .config routes
    $body = angular.element('body')
    angular.bootstrap $body, [name]
