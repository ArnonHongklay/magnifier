$.noty.defaults =
  layout: 'bottomRight'
  theme: 'defaultTheme'
  type: 'error'
  # text: ''
  dismissQueue: true
  template: '<div class="noty_message"><span class="noty_text"></span><div class="noty_close"></div></div>'
  animation:
    open: height: 'toggle'
    close: height: 'toggle'
    easing: 'swing'
    speed: 500
  timeout: false
  force: false
  modal: false
  maxVisible: 5
  killer: false
  closeWith: [ 'click' ]
  callback:
    onShow: ->
    afterShow: ->
    onClose: ->
    afterClose: ->
    onCloseClick: ->
  buttons: false
