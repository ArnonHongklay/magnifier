
ohmpieng.controller 'IndexCtrl', ($scope, $state, $stateParams, account) ->
  $scope.user = account.data.user
