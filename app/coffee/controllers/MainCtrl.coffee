###
@angular_sid
(c) 2014
###
define [], ->
    "use strict"
    ###*
    # @ngdoc object
    # @name angular-sid-controllers.mainCtrl
    # @description
    # angular sid main Ctrl
    # <h2>Settings</h2>
    # <pre>
    # <style type="text/css">
    # </style>
    # </pre>
    ###
    [
        '$log'
        '$scope'
        'i18nFactory'
        (
            $log
            $scope
            i18nFactory
        ) ->
            $scope.modalError =
                show: false

            $scope.$on 'API_ERROR', (event, error) ->
                $scope.modalError.show = true

            ###*
            # @ngdoc function
            # @name toggleModalError
            # @methodOf angular-sid-controllers.mainCtrl
            # @function
            # @param {object} $event the event
            # @description show, hide the modal error
            ###
            $scope.toggleModalError = ($event) ->
                $scope.modalError.show = !$scope.modalError.show
    ]
