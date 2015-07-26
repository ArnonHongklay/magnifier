
ohmpieng.controller 'AccountCtrl', ($scope, $state, $stateParams, account) ->
  $scope.account = account.data

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
