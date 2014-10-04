define [
    "angular"
    "app"
    "angular-mocks"
],(
    angular,
    app,
    mocks) ->

        describe "navDirective: ", ->
            $rootScope = undefined
            $location = undefined
            $httpBackend = undefined
            $controller = undefined
            $compile = undefined
            $location = undefined
            $timeout = undefined
            scope = undefined
            i18nFactory = undefined
            i18nService = undefined
            navDirective = undefined

            beforeEach ->
                module "angular-sid"
                inject ($injector) ->
                    $rootScope = $injector.get "$rootScope"
                    $location = $injector.get "$location"
                    $httpBackend = $injector.get "$httpBackend"
                    $controller = $injector.get "$controller"
                    $compile = $injector.get "$compile"
                    $location = $injector.get "$location"
                    $timeout = $injector.get "$timeout"
                    i18nFactory = $injector.get "i18nFactory"
                    i18nService = $injector.get "i18nService"
                    scope = $rootScope.$new()

            afterEach ->
                $httpBackend.verifyNoOutstandingExpectation()
                $httpBackend.verifyNoOutstandingRequest()

            describe "init: ", ->
                it "should exists", ->
                    navDirective = $compile('<div nav-directive></div>')(scope)
                    expect(navDirective.length).toEqual 1

                it "should switch to lang", ->
                    navDirective = $compile('<div nav-directive></div>')(scope)
                    scope.$apply()
                    $httpBackend
                        .when("GET", "lang/FR_fr.json")
                        .respond (method, url, data, headers) ->
                            [ 200, {}, {}]
                    navDirective.scope().switchLang 'FR_fr'
                    $httpBackend.flush()
                    expect(i18nService.getLang()).toEqual 'FR_fr'
