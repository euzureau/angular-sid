define ["angular","app","angular-mocks"],(angular,app,mocks) ->

    describe "i18nFactory: ", ->
        $rootScope = undefined
        $location = undefined
        $httpBackend = undefined
        $controller = undefined
        i18nFactory = undefined
        i18nService = undefined
        config = undefined

        beforeEach ->
            module "angular-sid"
            inject ($injector) ->
                $rootScope = $injector.get "$rootScope"
                $location = $injector.get "$location"
                $httpBackend = $injector.get "$httpBackend"
                $controller = $injector.get "$controller"
                i18nFactory  = $injector.get "i18nFactory"
                i18nService  = $injector.get "i18nService"
                config = $injector.get "config"
                scope = $rootScope.$new()

        afterEach ->
            $httpBackend.verifyNoOutstandingExpectation()
            $httpBackend.verifyNoOutstandingRequest()

        describe "init: ", ->

            it "should fetch default bundle", ->
                alternative = 'FR_fr'
                $httpBackend
                    .when("GET", "lang/EN_en/bundles.json")
                    .respond (method, url, data, headers) ->
                        [ 200, {}, {}]
                $httpBackend
                    .when("GET", "lang/FR_fr/bundles.json")
                    .respond (method, url, data, headers) ->
                        [ 200, {}, {}]
                i18nFactory.getLang(config.DEFAULT_LANG)
                $httpBackend.flush()
                expect(i18nService.getLang()).toBe config.DEFAULT_LANG
                i18nFactory.getLang()
                expect(i18nService.getLang()).toBe config.DEFAULT_LANG
                i18nFactory.getLang(alternative)
                $httpBackend.flush()
                expect(i18nService.getLang()).toBe alternative
                i18nFactory.getLang(alternative)
                expect(i18nService.getLang()).toBe alternative

