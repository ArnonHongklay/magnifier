ohmpieng.controller 'IndexCtrl', ($scope, $state, $stateParams, $http, account, servers) ->
  $scope.account = account.data
  $scope.servers = servers.data.servers
  $state.go("account.setting") if $scope.servers.length == 0


  $scope.currentIndex = 0
  $scope.chose = (index) ->
    $scope.currentIndex = index

  $scope.parseId = (val) ->
    parseInt(val)
