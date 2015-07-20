ohmpieng.controller 'IndexCtrl', ($scope, $state, $stateParams, $http, account, servers) ->
  $scope.user = account.data.user

  # $scope.url = "https://nonmadden.com/monitor/"

  # $scope.osInfo = ->
  #   $http.get("#{$scope.url}sh/issue.php").success(result) ->
  #     console.log result

  # $scope.getProcesses = ->
    # $http.get("#{$scope.url}sh/ps.php").success(result) ->
    #   console.log result
#  $('#seelectsvdh1').click ->
#    $(this).css
#      'background-color': '#47c9af'
#      'color': '#fff'
#    $("#seelectsvdh2").css
#      'background-color': '#fff'
#      'color': '#444'
#    $("#seelectsvdh3").css
#      'background-color': '#fff'
#      'color': '#444'
#    $("#seelectsvdh4").css
#      'background-color': '#fff'
#      'color': '#444'
#    return

#  $('#seelectsvdh2').click ->
#    $(this).css
#      'background-color': '#47c9af'
#      'color': '#fff'
#    $("#seelectsvdh1").css
#      'background-color': '#fff'
#      'color': '#444'
#    $("#seelectsvdh3").css
#      'background-color': '#fff'
#      'color': '#444'
#    $("#seelectsvdh4").css
#      'background-color': '#fff'
#      'color': '#444'
#    return

#  $('#seelectsvdh3').click ->
#    $(this).css
#      'background-color': '#47c9af'
#      'color': '#fff'
#    $("#seelectsvdh2").css
#      'background-color': '#fff'
#      'color': '#444'
#    $("#seelectsvdh1").css
#      'background-color': '#fff'
#      'color': '#444'
#    $("#seelectsvdh4").css
#      'background-color': '#fff'
#      'color': '#444'
#    return

#  $('#seelectsvdh4').click ->
#    $(this).css
#      'background-color': '#47c9af'
#      'color': '#fff'
#    $("#seelectsvdh1").css
#      'background-color': '#fff'
#      'color': '#444'
#    $("#seelectsvdh3").css
#      'background-color': '#fff'
#      'color': '#444'
#    $("#seelectsvdh2").css
#      'background-color': '#fff'
#      'color': '#444'
#    return

  $('#detailData2').hide()
  $('#detailData3').hide()

  $('#seletindex1').click ->
    $('#detailData1').toggle 'slow'
    $('#detailData2').hide()
    $('#detailData3').hide()
    return

  $('#seletindex2').click ->
    $('#detailData2').toggle 'slow'
    $('#detailData1').hide()
    $('#detailData3').hide()
    return

  $('#seletindex3').click ->
    $('#detailData3').toggle 'slow'
    $('#detailData1').hide()
    $('#detailData2').hide()
    return


  $('#seletindex1').click ->
    $(this).css
      'background-color': '#307D7E'
      'color': '#fff'
    $("#seletindex2").css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seletindex3").css
      'background-color': '#47c9af'
      'color': '#fff'
    return

  $('#seletindex2').click ->
    $(this).css
      'background-color': '#307D7E'
      'color': '#fff'
    $("#seletindex1").css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seletindex3").css
      'background-color': '#47c9af'
      'color': '#fff'
    return

  $('#seletindex3').click ->
    $(this).css
      'background-color': '#307D7E'
      'color': '#fff'
    $("#seletindex2").css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seletindex1").css
      'background-color': '#47c9af'
      'color': '#fff'
    return
