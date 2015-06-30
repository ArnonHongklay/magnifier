(function() {
  ohmpieng.controller('ProfileCtrl', function($scope, profile) {
    $scope.account = profile.data.account;
    return console.log($scope.account);
  });

}).call(this);
