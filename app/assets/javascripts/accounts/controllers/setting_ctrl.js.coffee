
ohmpieng.controller 'SettingCtrl', ($scope, account) ->
  $scope.user = account.data.user
  $scope.isCollapsed = false
ohmpieng.controller 'ProfileCtrl', ($scope, account) ->
  $scope.user = account.data.user
  $scope.isCollapsed = false
