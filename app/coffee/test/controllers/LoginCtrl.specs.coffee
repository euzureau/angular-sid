define ["angular","app","angular-mocks"],(angular,app,mocks) ->

    describe "loginCtrl: ", ->
        $rootScope = undefined
        $location = undefined
        $httpBackend = undefined
        $route = undefined
        scope = undefined
        $controller = undefined
        authService = undefined
        loginCtrl = undefined
        token = 'ABC'

        beforeEach ->
            module "angular-sid"
            inject ($injector) ->
                $rootScope = $injector.get "$rootScope"
                $location = $injector.get "$location"
                $httpBackend = $injector.get "$httpBackend"
                $controller = $injector.get "$controller"
                $route = $injector.get "$route"
                authService = $injector.get "authService"
                scope = $rootScope.$new()
                $location.path '/login'

                $httpBackend
                    .when("GET", "lang/EN_en/bundles.json")
                    .respond (method, url, data, headers) ->
                        [ 200, {}, {}]

                loginCtrl = $controller("loginCtrl",
                    $scope: scope
                )
                $httpBackend.flush()

        afterEach ->
            $httpBackend.verifyNoOutstandingExpectation()
            $httpBackend.verifyNoOutstandingRequest()

        describe "init: ", ->

            it "should have /login as url", ->
                expect($location.path()).toBe '/login'
                expect($route.current.controller).toBe 'loginCtrl'

            it "should authenticate and logout user", ->
                $httpBackend
                    .when("POST", "/login")
                    .respond (method, url, data, headers) ->
                        [ 200, { token : token }, {}]
                scope.auth =
                    login : 'test'
                    password : 'test'
                scope.login()
                $httpBackend.flush()
                expect(authService.getToken()).toEqual token
                expect(authService.isLogged()).toBeTruthy()
                scope.logout()
                expect(authService.getToken()).toBeUndefined()
                expect(authService.isLogged()).toBeFalsy()

            it "should NOT authenticate user", ->
                $httpBackend
                    .when("POST", "/login")
                    .respond (method, url, data, headers) ->
                        [ 500, {}, {}]
                scope.login()
                $httpBackend.flush()
                expect(authService.getToken()).toBeUndefined()
                expect(authService.isLogged()).toBeFalsy()

