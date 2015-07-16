ohmpieng.controller 'IndexCtrl', ($scope, $state, $stateParams, $http, account) ->
  $scope.user = account.data.user

  # $scope.url = "https://nonmadden.com/monitor/"

  # $scope.osInfo = ->
  #   $http.get("#{$scope.url}sh/issue.php").success(result) ->
  #     console.log result

  # $scope.getProcesses = ->
    # $http.get("#{$scope.url}sh/ps.php").success(result) ->
    #   console.log result
  $('#seelectsvdh1').click ->
    $(this).css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seelectsvdh2").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh3").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh4").css
      'background-color': '#fff'
      'color': '#444'
    return

  $('#seelectsvdh2').click ->
    $(this).css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seelectsvdh1").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh3").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh4").css
      'background-color': '#fff'
      'color': '#444'
    return

  $('#seelectsvdh3').click ->
    $(this).css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seelectsvdh2").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh1").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh4").css
      'background-color': '#fff'
      'color': '#444'
    return

  $('#seelectsvdh4').click ->
    $(this).css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seelectsvdh1").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh3").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh2").css
      'background-color': '#fff'
      'color': '#444'
    return

  $('#detailData11').hide()
  $('#detailData12').hide()
  $('#detailData13').hide()
  $('#detailData14').hide()

  $('#seletindex1').click ->
    $('#detailData1').toggle 'slow'
    $('#detailData2').toggle 'slow'
    $('#detailData3').toggle 'slow'
    $('#detailData4').toggle 'slow'
    $('#detailData11').hide()
    $('#detailData12').hide()
    $('#detailData13').hide()
    $('#detailData14').hide()
    return

  $('#seletindex2').click ->
    $('#detailData11').toggle 'slow'
    $('#detailData12').toggle 'slow'
    $('#detailData13').toggle 'slow'
    $('#detailData14').toggle 'slow'
    $('#detailData1').hide()
    $('#detailData2').hide()
    $('#detailData3').hide()
    $('#detailData4').hide()
    return
