(function() {
  ohmpieng.controller('AccountCtrl', function($scope, $state, $stateParams, account) {
    $scope.user = account.data.user;
    $scope.isCollapsed = function() {
      $('#dock .launcher a').toggle();
    };
    $scope.isHoverIn = function(e) {
      angular.element(e.currentTarget).find('.dropdown-menu').stop(true, true).fadeIn();
    };
    return $scope.isHoverOut = function(e) {
      angular.element(e.currentTarget).find('.dropdown-menu').stop(true, true).delay(100).fadeOut();
    };
  });

}).call(this);
