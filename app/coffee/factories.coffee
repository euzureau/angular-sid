###
@angular_sid
(c) 2014
###
define [
    'angular'
    'factories/ErrorInterceptorFactory'
    'factories/I18nFactory'
    'angular-resource'
], (
    angular
    ErrorInterceptorFactory
    I18nFactory
) ->
    "use strict"
    angular
        .module 'angular-sid-factories', ['ngResource']
        .factory 'errorInterceptorFactory', ErrorInterceptorFactory
        .factory 'i18nFactory', I18nFactory

