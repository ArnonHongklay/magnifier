# = require accounts/vendor
# = require_self

(($) ->
  "use strict"
  appOhmpieng =
    main_func: ->
      $(window).bind "load resize", ->
        if $(this).width() < 768
          $("div.sidebar-collapse").addClass "collapse"
        else
          $("div.sidebar-collapse").removeClass "collapse"
        return
    initialization: ->
      appOhmpieng.main_func()
      return
  $(document).ready ->
    appOhmpieng.main_func()
    return
  return
) jQuery
