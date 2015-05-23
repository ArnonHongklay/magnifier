
ohmpieng.controller 'IndexCtrl', ($scope, $state, $stateParams, $http, account) ->
  $scope.user = account.data.user

  $scope.url = "https://nonmadden.com/monitor/"

  $scope.osInfo = ->
    $http.get("#{$scope.url}sh/issue.php").success(result) ->
      console.log result