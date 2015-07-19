
ohmpieng.controller 'SettingCtrl', ($scope, account, servers) ->
  $scope.account = account.data.account
  $scope.servers = servers.data.server

  $scope.ipaddress    = false
  $scope.script       = false

  $scope.addServer = ->
    $scope.ipaddress  = true
    $scope.script     = false
    return

  $scope.newipaddress = ->
    $scope.ipaddress  = true
    $scope.script     = true
    return
