
ohmpieng.controller 'ReportCtrl', ($scope, $http, $filter, ngTableParams, account) ->
  $scope.user = account.data.user

  $scope.xxx = [
    {name: "Moroni", age: 50},
    {name: "Tiancum", age: 43},
    {name: "Jacob", age: 27},
    {name: "Nephi", age: 29},
    {name: "Enos", age: 34}
  ]

# http://bazalt-cms.com/ng-table/example/6
