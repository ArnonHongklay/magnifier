ohmpieng.controller 'ReportCtrl', ($scope, $state, $http, $filter, ngTableParams, account, servers) ->
  $scope.account = account.data
  $scope.servers = servers.data.servers
  $state.go("account.setting") if $scope.servers.length == 0

  $scope.xxx = [
    {name: "Moroni", age: 1},
    {name: "Tiancum", age: 2},
    {name: "Jacob", age: 3},
    {name: "Nephi", age: 4},
    {name: "Enos", age: 5}
  ]
