
ohmpieng.controller 'ProfileCtrl', ($scope, profile) ->
  $scope.account = profile.data.account

  console.log $scope.account
