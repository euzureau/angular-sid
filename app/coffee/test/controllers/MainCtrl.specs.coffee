define [
    "angular"
    "app"
    "angular-mocks"
],(
    angular,
    app,
    mocks) ->

        describe "mainCtrl: ", ->
            $rootScope = undefined
            $location = undefined
            $httpBackend = undefined
            $route = undefined
            $controller = undefined
            i18nFactory = undefined
            mainCtrl = undefined
            scope = undefined

            beforeEach ->
                module "angular-sid"
                inject ($injector) ->
                    $rootScope = $injector.get "$rootScope"
                    $location = $injector.get "$location"
                    $httpBackend = $injector.get "$httpBackend"
                    $controller = $injector.get "$controller"
                    i18nFactory  = $injector.get "i18nFactory"
                    $route = $injector.get "$route"
                    scope = $rootScope.$new()

                    $httpBackend
                        .when("GET", "lang/EN_en/bundles.json")
                        .respond (method, url, data, headers) ->
                            [ 200, {}, {}]

                    mainCtrl = $controller("mainCtrl",
                        $scope: scope
                    )
                    $httpBackend.flush()

            afterEach ->
                $httpBackend.verifyNoOutstandingExpectation()
                $httpBackend.verifyNoOutstandingRequest()

            describe "init: ", ->
                it "should toggle modalError", ->
                    expect(scope.modalError.show).toBeFalsy()
                    scope.toggleModalError()
                    expect(scope.modalError.show).toBeTruthy()

