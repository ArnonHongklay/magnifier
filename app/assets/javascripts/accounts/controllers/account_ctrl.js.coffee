
ohmpieng.controller 'AccountCtrl', ($scope, $state, $stateParams, account, events) ->
  $scope.account = account.data

  console.log events
  events.addEventListener 'ping', (e) ->
    console.log e.data
    noty
      text: "ไม่สามารถติดต่อกับ Server #{e.data} ได้ในขณะนี้"
      type: "error"

  events.addEventListener 'daily', (e) ->
    console.log e.data
    noty
      text: "เรามีรายงานประจำวันให้ท่านดูโปรคลิก"
      type: "success"


  $scope.isCollapsed = ->
    $('#dock .launcher a').toggle()
    # $('#dock li.launcher').each ->
    #   $(this).find('.dropdown-menu').css 'top', $(this).position().top + 33
    return

  $scope.isHoverIn = (e) ->
    angular.element(e.currentTarget).find('.dropdown-menu').stop(true, true).fadeIn()
    return

  $scope.isHoverOut = (e) ->
    angular.element(e.currentTarget).find('.dropdown-menu').stop(true, true).delay(100).fadeOut()
    return
