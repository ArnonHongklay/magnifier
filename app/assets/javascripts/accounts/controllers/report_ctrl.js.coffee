
ohmpieng.controller 'ReportCtrl', ($scope, $http, $filter, ngTableParams, account) ->
  $scope.user = account.data.user

  $scope.xxx = [
    {name: "Moroni", age: 1},
    {name: "Tiancum", age: 2},
    {name: "Jacob", age: 3},
    {name: "Nephi", age: 4},
    {name: "Enos", age: 5}
  ]

  $('#seleteserver').click ->
    $(this).css 'background-color', '#35E5C3'
    $("#seleteserver2").css 'background-color', '#fff'
    $("#seleteserver3").css 'background-color', '#fff'
    return
  $('#seleteserver2').click ->
    $(this).css 'background-color', '#35E5C3'
    $("#seleteserver").css 'background-color', '#fff'
    $("#seleteserver3").css 'background-color', '#fff'
    return
  $('#seleteserver3').click ->
    $(this).css 'background-color', '#35E5C3'
    $("#seleteserver").css 'background-color', '#fff'
    $("#seleteserver2").css 'background-color', '#fff'
    return
