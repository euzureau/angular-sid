define [
    "angular"
    "app"
    "angular-mocks"
],(
    angular,
    app,
    mocks) ->

        describe "indexCtrl: ", ->
            $rootScope = undefined
            $location = undefined
            $httpBackend = undefined
            $route = undefined
            $controller = undefined
            indexCtrl = undefined

            beforeEach ->
                module "angular-sid"
                inject ($injector) ->
                    $rootScope = $injector.get "$rootScope"
                    $location = $injector.get "$location"
                    $httpBackend = $injector.get "$httpBackend"
                    $controller = $injector.get "$controller"
                    $route = $injector.get "$route"
                    scope = $rootScope.$new()
                    $location.path '/index'

                    $httpBackend
                        .when("GET", "lang/EN_en.json")
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
                it "should have /index as url", ->
                    expect($location.path()).toBe '/index'
                    expect($route.current.controller).toBe 'indexCtrl'
