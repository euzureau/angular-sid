define ["angular","app","angular-mocks"],(angular,app,mocks) ->

    describe "I18nDirective: ", ->
        $rootScope = undefined
        $location = undefined
        $httpBackend = undefined
        $controller = undefined
        $compile = undefined
        scope = undefined
        i18nFactory = undefined
        i18n = undefined

        beforeEach ->
            module "angular-sid"
            inject ($injector) ->
                $rootScope = $injector.get "$rootScope"
                $location = $injector.get "$location"
                $httpBackend = $injector.get "$httpBackend"
                $controller = $injector.get "$controller"
                $compile = $injector.get "$compile"
                i18nFactory  = $injector.get "i18nFactory"
                scope = $rootScope.$new()

        afterEach ->
            $httpBackend.verifyNoOutstandingExpectation()
            $httpBackend.verifyNoOutstandingRequest()

        describe "init: ", ->
            it "should exists", ->
                i18n = $compile('<p i18n></p>')(scope)
                expect(i18n.length).toEqual 1

            it "should return label", ->
                $httpBackend
                    .when("GET", "lang/EN_en/bundles.json")
                    .respond (method, url, data, headers) ->
                        [ 200, { "brand" : "Brand" }, {}]
                i18nFactory.getLang()
                $httpBackend.flush()
                i18n = $compile('<p i18n="brand"></p>')(scope)
                expect(i18n.text()).toEqual "Brand"

        describe "options: ", ->
            beforeEach ->
                $httpBackend
                    .when("GET", "lang/EN_en/bundles.json")
                    .respond (method, url, data, headers) ->
                        [ 200, { "brand" : "Brand" }, {}]
                i18nFactory.getLang()
                $httpBackend.flush()

            it "should set href", ->
                i18n = $compile('<a i18n i18n-href="brand"></a>')(scope)
                expect(i18n.attr('href')).toEqual "Brand"

            it "should set title", ->
                i18n = $compile('<a i18n i18n-title="brand"></a>')(scope)
                expect(i18n.attr('title')).toEqual "Brand"

            it "should set alt", ->
                i18n = $compile('<a i18n i18n-alt="brand"></a>')(scope)
                expect(i18n.attr('alt')).toEqual "Brand"

            it "should set name", ->
                i18n = $compile('<a i18n i18n-name="brand"></a>')(scope)
                expect(i18n.attr('name')).toEqual "Brand"

            it "should set name", ->
                i18n = $compile(
                    '<input type="text" i18n i18n-placeholder="brand" />'
                )(scope)
                expect(i18n.attr('placeholder')).toEqual "Brand"

            it "should replace", ->
                i18n = $compile(
                    '<span i18n="brand" i18n-replace="true">toremove</span>'
                )(scope)
                #expect(i18n.text()).toEqual "Brand"

            it "should prepend", ->
                i18n = $compile(
                    '<span i18n="brand" i18n-prepend="true">Brand</span>'
                )(scope)
                expect(i18n.text()).toEqual "BrandBrand"


