###
@angular_sid
(c) 2014
###
define [
    'angular'
], (
    angular
) ->
    "use strict"
    [
        '$routeProvider',
        ($routeProvider) ->

            # index
            $routeProvider.when "/index",
                templateUrl: "index.tpl.html"
                controller: "indexCtrl"
                resolve :
                    getLang : ['i18nFactory', (i18nFactory) ->
                        i18nFactory.getLang()
                    ]

            $routeProvider.otherwise redirectTo: "/index"
    ]
