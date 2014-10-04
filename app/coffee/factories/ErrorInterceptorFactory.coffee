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
        "$log","$rootScope", "$location"
        ($log, $rootScope, $location) ->
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
                    when 401
                        $location.path '/login'
                    when 500
                        $rootScope.$broadcast 'API_ERROR', error
                rejection
    ]
