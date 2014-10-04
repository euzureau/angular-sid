###
@angular_sid
(c) 2014
###
define [
    'angular'
    'services/I18nService'
    'angular-resource'
], (
    angular
    I18nService
) ->
    "use strict"
    angular
        .module('angular-sid-services', ['ngResource'])
        .service 'i18nService', I18nService

