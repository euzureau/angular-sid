###
@angular_sid
(c) 2014
###
define [], ->
    "use strict"
    ###*
    # @ngdoc service
    # @name angular-sid-factories.I18nFactory
    # @description
    #
    # Angular I18n factory.
    #
    # <h2>Settings</h2>
    # <pre>
    # <style type="text/css">
    # </style>
    # </pre>
    ###
    [
        '$log'
        '$http'
        '$q'
        'i18nService'
        'config'
        (
            $log
            $http
            $q
            i18nService
            config
        ) ->
            ###
            @ngdoc function
            @name getLang
            @methodOf angular-sid-factories.I18nFactory
            @function
            @description fetch the lang and the appropriated bundles
            ###
            getLang: (mylang=null) ->
                defer = $q.defer()
                lang = i18nService.getLang()
                if mylang isnt null and mylang is lang
                    defer.resolve lang
                else if mylang is null and lang isnt undefined
                    defer.resolve lang
                else
                    mylang  = config.DEFAULT_LANG if mylang is null
                    $http
                        .get('lang/' + mylang + '.json')
                        .then (response) ->
                            i18nService.setLang mylang
                            i18nService.setBundles response.data
                            defer.resolve mylang
                defer.promise
    ]
