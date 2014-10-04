###
@angular_sid
(c) 2014
###
define [
    'angular'
    'services/I18nService'
    'services/AuthService'
    'angular-resource'
], (
    angular
    I18nService
    AuthService
) ->
    "use strict"
    angular
        .module('angular-sid-services', ['ngResource'])
        .service 'i18nService', I18nService
        .service 'authService', AuthService

