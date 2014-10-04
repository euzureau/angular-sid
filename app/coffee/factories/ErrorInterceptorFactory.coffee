###*
@angular_sid
(c) 2014
###
define [], ->
    "use strict"
    ###*
    # @ngdoc object
    # @name angular-sid-factories.errorInterceptorFactory
    # @description
    # angular sid errorInterceptorFactory
    # Intercepts all http errors and broadcast to application specific error event
    # to allow custom handling.
    # <h2>Settings</h2>
    # <pre>
    # <style type="text/css">
    # </style>
    # </pre>
    ###
    [
        "$log","$window","$rootScope",
        ($log, $window, $rootScope) ->

            ###*
            # @ngdoc function
            # @name request
            # @methodOf angular-sid-factories.errorInterceptorFactory
            # @function
            # @param {object} config the config
            # @description returns the config
            ###
            request: (config) ->
                config

            ###*
            # @ngdoc function
            # @name response
            # @methodOf angular-sid-factories.errorInterceptorFactory
            # @function
            # @param {object} response the response
            # @description returns the response
            ###
            response: (response) ->
                response

            ###*
            # @ngdoc function
            # @name responseError
            # @methodOf angular-sid-factories.errorInterceptorFactory
            # @function
            # @param {object} rejection the rejection
            # @description returns the rejection, broadcast an error event
            # if error status has been intercepted.
            ###
            responseError: (rejection) ->
                error =
                    status: rejection.status
                    message: rejection.data

                switch rejection.status
                    when 500
                        $rootScope.$broadcast 'API_ERROR', error
                rejection
    ]
