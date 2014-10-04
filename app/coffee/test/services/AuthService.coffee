define [
    "angular"
    "app"
    "angular-mocks"
],(
    angular,
    app,
    mocks) ->

        describe "authService: ", ->
            $rootScope = undefined
            $location = undefined
            $httpBackend = undefined
            $controller = undefined
            authService = undefined

            beforeEach ->
                module "angular-sid"
                inject ($injector) ->
                    $rootScope = $injector.get "$rootScope"
                    $location = $injector.get "$location"
                    $httpBackend = $injector.get "$httpBackend"
                    $controller = $injector.get "$controller"
                    authService  = $injector.get "authService"
                    scope = $rootScope.$new()

            afterEach ->
                $httpBackend.verifyNoOutstandingExpectation()
                $httpBackend.verifyNoOutstandingRequest()

            describe "init: ", ->

                it "should getToken", ->
                    expect(authService.isLogged()).toBeFalsy()
                    authService.setToken 'XYZ'
                    expect(authService.getToken).equalTo 'XYZ'
                    expect(authService.isLogged()).toBeTruthy()


