
ohmpieng.controller 'SettingCtrl', ($scope, account) ->
  console.log $scope.user = account.data.user
  $('h1').hide()
  $('#aaa').hide()
  $('#bbb').hide()
  $('#addsv').click ->
    $('h1').toggle 'slow'
    $('#aaa').toggle 'slow'
    $('#bbb').hide()
    return
  $('#cmsv').click ->
    $('#bbb').toggle 'slow'
    return

  $('#chpic').hover ->
  bigImg = (x) ->
    x.style.height = '64px'
    x.style.width = '64px'
    return
  return
