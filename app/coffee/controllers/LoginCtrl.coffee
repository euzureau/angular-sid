###
@angular_sid
(c) 2014
###
define [], ->
    "use strict"
    ###*
    # @ngdoc object
    # @name angular-sid-controllers.loginCtrl
    # @description
    # angular sid login Ctrl
    # <h2>Settings</h2>
    # <pre>
    # <style type="text/css">
    # </style>
    # </pre>
    ###
    [
        '$log'
        '$http'
        '$scope'
        'authService'
        'config'
        (
            $log
            $http
            $scope
            authService
            config
        ) ->
            $scope.auth =
                login : undefined
                password: undefined
            ###*
            # @ngdoc function
            # @name logout
            # @methodOf angular-sid-controllers.loginCtrl
            # @function
            # @param {object} $event the event
            # @description logout the user
            ###
            $scope.logout = ($event) ->
                authService.setToken undefined

            ###*
            # @ngdoc function
            # @name login
            # @methodOf angular-sid-controllers.loginCtrl
            # @function
            # @param {object} $event the event
            # @description hand the post request to authenticate user
            ###
            $scope.login = ($event) ->
                $http
                    .post config.AUTH_URL, $scope.auth
                    .then (response) ->
                        if response.status is 200
                            authService.setToken response.data.token
    ]
