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

  # noty({text: 'nonmadden!'});
  $.noty.defaults =
  layout: "bottomRight"
  theme: "relax"
  type: "alert"
  dismissQueue: true
  template: "<div class=\"noty_message\"><span class=\"noty_text\"></span><div class=\"noty_close\"></div></div>"
  animation:
    open: 'animated fadeInRight'
    close: 'animated fadeOutRight'
    easing: "swing"
    speed: 500 # opening & closing animation speed
  timeout: 5000 # delay for closing event. Set false for sticky notifications
  maxVisible: 10
  closeWith: ["click"] # ['click', 'button', 'hover', 'backdrop'] // backdrop click will close all notifications
  callback:
    onShow: ->
    afterShow: ->
    onClose: ->
    afterClose: ->
    onCloseClick: ->

  $(document).ready ->
    appOhmpieng.main_func()
    return
  return
) jQuery

NProgress.configure({
  showSpinner: true,
  ease: 'ease',
  speed: 500
});

$(document).on "page:fetch", ->
  NProgress.start()
  return

$(document).on "page:change", ->
  NProgress.done()
  return

$(document).on "page:restore", ->
  NProgress.remove()
  return
