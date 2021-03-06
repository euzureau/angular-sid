define [], ->
    "use strict"
    ###*
    # @ngdoc object
    # @name angular-sid-directives.navDirective
    # @description
    # angular sid nav directive
    # <h2>Settings</h2>
    # <pre>
    # <style type="text/css">
    # </style>
    # </pre>
    ###
    [
        "$log", 'i18nFactory','i18nService', '$location'
        ($log, i18nFactory, i18nService, $location) ->
            restrict: 'A'
            templateUrl: "directives/nav.directive.tpl.html"
            replace: false
            scope: true

            link: ($scope, $element, $attrs) ->
                $scope.lang = i18nService.getLang()
                ###*
                # @ngdoc function
                # @name switchLanguage
                # @methodOf angular-sid-directives.navDirective
                # @function
                # @param {String} lang the request lang
                # @description switch to the requested language
                ###
                $scope.switchLang = ($event) ->
                    i18nFactory
                        .getLang $scope.lang
                        .then (data) ->
                            $location.path '/'
    ]
