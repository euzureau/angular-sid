###
@angular_sid
(c) 2014
###
define [
    'angular'
    'controllers/MainCtrl'
    'controllers/IndexCtrl'
    'controllers/LoginCtrl'
], (
    angular
    MainCtrl
    IndexCtrl
    LoginCtrl
) ->
    "use strict"
    angular
        .module('angular-sid-controllers', [])
        .controller 'mainCtrl', MainCtrl
        .controller 'indexCtrl', IndexCtrl
        .controller 'loginCtrl', LoginCtrl
