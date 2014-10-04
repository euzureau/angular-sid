###
@angular_sid
(c) 2014
###
define [
    'angular'
    'controllers/MainCtrl'
    'controllers/IndexCtrl'
], (
    angular
    MainCtrl
    IndexCtrl
) ->
    "use strict"
    angular
        .module('angular-sid-controllers', [])
        .controller 'mainCtrl', MainCtrl
        .controller 'indexCtrl', IndexCtrl
