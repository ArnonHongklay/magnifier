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
