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

            compile: (tElement, tAttrs, transclude) ->

                setElement = (attr, attrValue) ->
                    val = i18nService.getLabel attrValue
                    tAttrs.$set attr, $sce.getTrustedHtml val

                translate = (attr, elmt) ->
                    val = i18nService.getLabel attr.i18n
                    html = $sce.getTrustedHtml val

                    if attr.i18nReplace
                        elmt.replaceWith html
                    else if attr.i18nPrepend
                        elmt.prepend html
                    else
                        elmt.append html

                setElement 'title', tAttrs.i18nTitle if tAttrs.i18nTitle

                setElement 'alt', tAttrs.i18nAlt if tAttrs.i18nAlt

                setElement 'name', tAttrs.i18nName if tAttrs.i18nName

                setElement 'href', tAttrs.i18nHref if tAttrs.i18nHref

                translate tAttrs, tElement if tAttrs.i18n
    ]
