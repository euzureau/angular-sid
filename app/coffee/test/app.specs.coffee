define ["angular","app","angular-mocks"],(angular,app,mocks) ->

    describe "App: ", ->
        $rootScope = undefined
        $location = undefined
        $httpBackend = undefined
        $controller = undefined

        beforeEach ->
            module "angular-sid"
            inject ($injector) ->
                $rootScope = $injector.get "$rootScope"
                $location = $injector.get "$location"
                $httpBackend = $injector.get "$httpBackend"
                $controller = $injector.get "$controller"
                scope = $rootScope.$new()

        afterEach ->
            $httpBackend.verifyNoOutstandingExpectation()
            $httpBackend.verifyNoOutstandingRequest()

        describe "init: ", ->
            it "should have / as url", ->
                expect($location.path()).toBe '/'
