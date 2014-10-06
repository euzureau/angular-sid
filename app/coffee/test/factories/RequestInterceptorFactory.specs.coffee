define ["angular","app","angular-mocks"],(angular,app,mocks) ->

    describe "requestInterceptorFactory: ", ->
        $rootScope = undefined
        $location = undefined
        $httpBackend = undefined
        $route = undefined
        scope = undefined
        $controller = undefined
        requestInterceptorFactory = undefined
        i18nFactory = undefined
        authService = undefined
        indexCtrl = undefined
        token = 'ABC'

        beforeEach ->
            module "angular-sid"
            inject ($injector) ->
                $rootScope = $injector.get "$rootScope"
                $location = $injector.get "$location"
                $httpBackend = $injector.get "$httpBackend"
                $controller = $injector.get "$controller"
                $route = $injector.get "$route"
                i18nFactory = $injector.get "i18nFactory"
                requestInterceptorFactory = $injector
                    .get("requestInterceptorFactory")
                authService = $injector.get "authService"
                scope = $rootScope.$new()
                $location.path '/index'

                $httpBackend
                    .when("GET", "lang/EN_en/bundles.json")
                    .respond (method, url, data, headers) ->
                        [ 200, {}, {}]

                indexCtrl = $controller("indexCtrl",
                    $scope: scope
                )
                $httpBackend.flush()

        afterEach ->
            $httpBackend.verifyNoOutstandingExpectation()
            $httpBackend.verifyNoOutstandingRequest()

        describe "init: ", ->
            it "should set the token", ->
                requestSpy = spyOn(requestInterceptorFactory, 'request')
                    .andCallThrough()
                authSpy = spyOn(authService, 'getToken').andCallThrough()
                authService.setToken token
                $httpBackend
                    .when("GET", "lang/FR_fr/bundles.json")
                    .respond (method, url, data, headers) ->
                        [ 200, {}, {}]
                i18nFactory.getLang 'FR_fr'
                $httpBackend.flush()
                expect(requestSpy).toHaveBeenCalled()
                expect(authSpy).toHaveBeenCalled()

