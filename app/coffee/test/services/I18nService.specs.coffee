define ["angular","app","angular-mocks"],(angular,app,mocks) ->

    describe "i18nService: ", ->
        $rootScope = undefined
        $location = undefined
        $httpBackend = undefined
        $controller = undefined
        i18nService = undefined

        beforeEach ->
            module "angular-sid"
            inject ($injector) ->
                $rootScope = $injector.get "$rootScope"
                $location = $injector.get "$location"
                $httpBackend = $injector.get "$httpBackend"
                $controller = $injector.get "$controller"
                i18nService  = $injector.get "i18nService"
                scope = $rootScope.$new()

        afterEach ->
            $httpBackend.verifyNoOutstandingExpectation()
            $httpBackend.verifyNoOutstandingRequest()

        describe "init: ", ->

            it "should getLang", ->
                lang = 'EZ_ez'
                i18nService.setLang lang
                expect(i18nService.getLang()).toBe lang

            it "should getBundles", ->
                bundle = { id : 2 }
                i18nService.setBundles bundle
                expect(i18nService.getBundles().id).toBe bundle.id

            it "should getLabel", ->
                bundle = { 'testKey' : 'testValue' }
                i18nService.setBundles bundle
                expect(i18nService.getLabel('testKey')).toBe bundle['testKey']
