###
@angular_sid
(c) 2014
###
define [], ->
    "use strict"
    ###*
    # @ngdoc service
    # @name angular-sid-factories.i18nFactory
    # @description
    #
    # Angular i18n factory.
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
            ###*
            @ngdoc function
            @name getLang
            @methodOf angular-sid-factories.i18nFactory
            @function
            @description fetch the lang and the appropriated bundles
            ###
            getLang: (mylang=null) ->
                defer = $q.defer()
                oldLang = i18nService.getLang()
                newlang = mylang or oldLang or config.DEFAULT_LANG
                if newlang is oldLang
                    defer.resolve newlang
                else
                    $http
                        .get('lang/' + newlang + '/bundles.json')
                        .then (response) ->
                            i18nService.setLang newlang
                            i18nService.setBundles response.data
                            defer.resolve newlang
                defer.promise
    ]
