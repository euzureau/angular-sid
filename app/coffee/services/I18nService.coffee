###
@angular_sid
(c) 2014
###
define [], ->
    "use strict"
    ###*
    # @ngdoc service
    # @name angular-sid-services.i18nService
    # @description
    #
    # Angular i18n service.
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
            lang = undefined
            bundles = undefined

            ###*
            @ngdoc function
            @name getLang
            @methodOf angular-sid-services.i18nService
            @function
            @description returns the current lang
            ###
            @getLang = ->
                lang

            ###*
            @ngdoc function
            @name setLang
            @methodOf angular-sid-services.i18nService
            @function
            @param {String} mylang the current lang
            @description sets the current lang
            ###
            @setLang = (mylang) ->
                lang = mylang
                @

            ###*
            @ngdoc function
            @name getBundles
            @methodOf angular-sid-services.i18nService
            @function
            @description returns the current bundle
            ###
            @getBundles = ->
                bundles

            ###*
            @ngdoc function
            @name setBundles
            @methodOf angular-sid-services.i18nService
            @function
            @param {Object} mybundles the bundles
            @description sets the current bundle
            ###
            @setBundles = (mybundles) ->
                bundles = mybundles
                @

            ###*
            @ngdoc function
            @name getLabel
            @methodOf angular-sid-services.i18nService
            @function
            @description returns the label of provided key
            ###
            @getLabel = (key)->
                bundles?[key] or '??' + key + '??'

            return
    ]
