(function() {
  ohmpieng.controller('ReportCtrl', function($scope, $http, $filter, ngTableParams, account) {
    $scope.user = account.data.user;
    return $scope.xxx = [
      {
        name: "Moroni",
        age: 50
      }, {
        name: "Tiancum",
        age: 43
      }, {
        name: "Jacob",
        age: 27
      }, {
        name: "Nephi",
        age: 29
      }, {
        name: "Enos",
        age: 34
      }
    ];
  });

}).call(this);
