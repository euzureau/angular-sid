###
@angular_sid
(c) 2014
###
define [
    'angular'
    'directives/NavDirective'
    "directives/ErrorModalDirective"
    'directives/I18nDirective'
], (
    angular
    NavDirective
    ErrorModalDirective
    I18nDirective
) ->
    'use strict'
    angular
        .module('angular-sid-directives', ['angular-sid-factories'])
        .directive 'i18n', I18nDirective
        .directive 'errorModalDirective', ErrorModalDirective
        .directive 'navDirective', NavDirective


