define [
    "angular"
    "app"
    "angular-mocks"
],(
    angular,
    app,
    mocks) ->

        describe "I18nDirective: ", ->
            $rootScope = undefined
            $location = undefined
            $httpBackend = undefined
            $controller = undefined
            $compile = undefined
            scope = undefined
            navDirective = undefined

            beforeEach ->
                module "angular-sid"
                inject ($injector) ->
                    $rootScope = $injector.get "$rootScope"
                    $location = $injector.get "$location"
                    $httpBackend = $injector.get "$httpBackend"
                    $controller = $injector.get "$controller"
                    $compile = $injector.get "$compile"
                    scope = $rootScope.$new()

            afterEach ->
                $httpBackend.verifyNoOutstandingExpectation()
                $httpBackend.verifyNoOutstandingRequest()

            describe "init: ", ->
                it "should exists", ->
                    navDirective = $compile('<p nav-directive></p>')(scope)
                    expect(navDirective.length).toEqual 1
