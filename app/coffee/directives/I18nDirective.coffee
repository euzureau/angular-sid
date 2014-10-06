define [], ->
    "use strict"
    ###*
    # @ngdoc object
    # @name angular-sid-directives.i18nDirective
    # @description
    # angular sid i18n directive
    # <h2>Settings</h2>
    # <pre>
    # <style type="text/css">
    # </style>
    # </pre>
    ###
    [
        "$log", "$sce", "i18nService",
        ($log, $sce, i18nService) ->

            replace: false
            restrict: 'A'
            scope: false
            ###*
            # @ngdoc function
            # @name compile
            # @methodOf angular-sid-directives.i18nDirective
            # @function
            # @param {Object} tElement the element
            # @param {Object} tAttrs the attributes of element
            # @param {Boolean} transclude transclude boolean
            # @description compiles the directive
            ###
            compile: (tElement, tAttrs, transclude) ->
                ###*
                # @ngdoc function
                # @name setElement
                # @methodOf angular-sid-directives.i18nDirective
                # @function
                # @param {Object} $attr the attribute
                # @param {String} elmt the element
                # @description set the value of the element attribute
                ###
                setElement = (attr, attrValue) ->
                    val = i18nService.getLabel attrValue
                    tAttrs.$set attr, $sce.getTrustedHtml val
                ###*
                # @ngdoc function
                # @name translate
                # @methodOf angular-sid-directives.i18nDirective
                # @function
                # @param {Object} $attr the attributes
                # @param {Object} elmt the element
                # @description translate an element based on the i18n attribute
                ###
                translate = (attr, elmt) ->
                    val = i18nService.getLabel attr.i18n
                    html = $sce.getTrustedHtml val

                    if attr.i18nReplace
                        elmt.replaceWith html
                    else if attr.i18nPrepend
                        elmt.prepend html
                    else
                        elmt.append html

                if tAttrs.i18nTitle
                    setElement 'title', tAttrs.i18nTitle

                if tAttrs.i18nAlt
                    setElement 'alt', tAttrs.i18nAlt

                if tAttrs.i18nName
                    setElement 'name', tAttrs.i18nName

                if tAttrs.i18nHref
                    setElement 'href', tAttrs.i18nHref

                if tAttrs.i18nPlaceholder
                    setElement 'placeholder', tAttrs.i18nPlaceholder

                if tAttrs.i18n
                    translate tAttrs, tElement
    ]
