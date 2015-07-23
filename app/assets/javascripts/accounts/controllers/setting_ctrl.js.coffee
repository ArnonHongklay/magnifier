
ohmpieng.controller 'SettingCtrl', ($scope, $state, account, servers, $http) ->
  $scope.account = account.data
  $scope.servers = servers.data.server

  $scope.showEdit     = false

  $scope.ipaddress    = false
  $scope.script       = false

  $scope.addServer = ->
    $scope.ipaddress  = true
    $scope.script     = false

  $scope.newipaddress = ->
    $scope.ipaddress  = true
    $scope.script     = true

  $scope.ip = ''
  $scope.submit = ->
    if @ip != ''
      $http.put "#{$scope.account.name}/setting",
        ip: @ip
      .success (result) ->
        $state.go('.')
