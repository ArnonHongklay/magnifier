ohmpieng.controller 'ReportCtrl', ($scope, $state, $http, $filter, ngTableParams, account, servers) ->
  $scope.account = account.data
  $scope.servers = servers.data.servers
  $state.go("account.setting") if $scope.servers.length == 0
