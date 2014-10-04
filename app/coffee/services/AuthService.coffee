###
@angular_sid
(c) 2014
###
define [], ->
    "use strict"
    ###*
    # @ngdoc service
    # @name angular-sid-services.authService
    # @description
    #
    # Angular I18n service.
    #
    # <h2>Settings</h2>
    # <pre>
    # <style type="text/css">
    # </style>
    # </pre>
    ###
    [
        "$log"
        ($log) ->
            token = undefined

            ###*
            @ngdoc function
            @name getToken
            @methodOf angular-sid-services.authService
            @function
            @description returns the current token
            ###
            @getToken = ->
                token

            ###*
            @ngdoc function
            @name setLang
            @methodOf angular-sid-services.authService
            @function
            @param {String} mytoken the current token
            @description set the current token
            ###
            @setToken = (mytoken) ->
                token = mytoken

            ###*
            @ngdoc function
            @name setLang
            @methodOf angular-sid-services.authService
            @function
            @param {String} mytoken the current token
            @description set the current token
            ###
            @isLogged = ()->
                if token isnt undefined then true else false


            return
    ]
