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
        "$log",
        ($log) ->
            templateUrl: "directives/nav.directive.tpl.html"
            replace: false
            scope: false
            link: (scope, element, attrs) ->
    ]
