define [], ->
    "use strict"
    ###*
    # @ngdoc object
    # @name angular-sid-directives.errorModalDirective
    # @description
    # angular sid error modal directive
    # <h2>Settings</h2>
    # <pre>
    # <style type="text/css">
    # </style>
    # </pre>
    ###
    [
        "$log",
        ($log) ->
            templateUrl: "directives/error.modal.directive.tpl.html"
            replace: false
            scope: false
            link: (scope, element, attrs) ->
    ]
