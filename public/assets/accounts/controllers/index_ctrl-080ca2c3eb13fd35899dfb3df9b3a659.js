(function() {
  ohmpieng.controller('IndexCtrl', function($scope, $state, $stateParams, $http, account) {
    return $scope.user = account.data.user;
  });

}).call(this);
