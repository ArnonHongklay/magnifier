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

  $scope.save = ->
    console.log "xxxx"
    $http.put "#{$scope.account.name}/setting",
      name: $scope.account.name
      email: $scope.account.email
    .success(result) ->
      console.log result

  $scope.ip = ''
  $scope.submit = ->
    if @ip != ''
      $http.put "#{$scope.account.name}/setting",
        ip: @ip
      .success(result) ->
        console.log result
        $state.go('.')
      .error(reslut) ->
        console.log reslut
