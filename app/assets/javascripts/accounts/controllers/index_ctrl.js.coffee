ohmpieng.controller 'IndexCtrl', ($scope, $state, $stateParams, $http, account, servers) ->
  console.log $scope.account = account.data
  console.log $scope.servers = servers.data.servers

  $scope.currentIndex = 0
  $scope.chose = (index) ->
    $scope.currentIndex = index

  $scope.parseId = (val) ->
    parseInt(val)
