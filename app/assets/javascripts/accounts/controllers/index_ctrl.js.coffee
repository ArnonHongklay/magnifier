ohmpieng.controller 'IndexCtrl', ($scope, $state, $stateParams, $http, account) ->
  $scope.user = account.data.user

  # $scope.url = "https://nonmadden.com/monitor/"

  # $scope.osInfo = ->
  #   $http.get("#{$scope.url}sh/issue.php").success(result) ->
  #     console.log result

  # $scope.getProcesses = ->
    # $http.get("#{$scope.url}sh/ps.php").success(result) ->
    #   console.log result
  $('.sss').hide()
  $('.detail2').hide()
  $('.ttt').hide()
  $('#ddd').click ->
    $('.sss').toggle 'slow'
    $('.detail2').hide()
    $('.ttt').hide()
    return
  $('#menu2').click ->
    $('.detail2').toggle 'slow'
    $('.sss').hide()
    $('.ttt').hide()
    return
  $('#menu3').click ->
    $('.ttt').toggle 'slow'
    $('.sss').hide()
    $('.detail2').hide()
    return
