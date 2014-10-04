###*
@angular_sid
(c) 2014
###
define [], ->
    "use strict"
    ###*
    # @ngdoc object
    # @name angular-sid-factories.requestInterceptorFactory
    # @description
    # angular sid requestInterceptorFactory
    # Intercepts all http errors and broadcast to application specific error event
    # to allow custom handling.
    # <h2>Settings</h2>
    # <pre>
    # <style type="text/css">
    # </style>
    # </pre>
    ###
    [
        "$log","$rootScope", "$location", "authService",
        ($log, $rootScope, $location, authService) ->

            ###*
            # @ngdoc function
            # @name request
            # @methodOf angular-sid-factories.requestInterceptorFactory
            # @function
            # @param {object} config the config
            # @description returns the config
            ###
            request: (config) ->
                if authService.isLogged()
                    config.headers.Authorization = 'Bearer ' + authService.getToken()
                config

            ###*
            # @ngdoc function
            # @name response
            # @methodOf angular-sid-factories.requestInterceptorFactory
            # @function
            # @param {object} response the response
            # @description returns the response
            ###
            response: (response) ->
                if response.status is 401
                    $location.path '/login'
                response
    ]
