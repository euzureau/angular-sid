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
        "$log", 'i18nFactory', '$location'
        ($log, i18nFactory, $location) ->
            restrict: 'A'
            templateUrl: "directives/nav.directive.tpl.html"
            replace: false
            scope: true

            link: ($scope, $element, $attrs) ->
                ###*
                # @ngdoc function
                # @name switchLanguage
                # @methodOf angular-sid-directives.navDirective
                # @function
                # @param {String} lang the request lang
                # @description switch to the requested language
                ###
                $scope.switchLang = (lang) ->
                    i18nFactory
                        .getLang lang
                        .then (data) ->
                            $location.path '/'
    ]
