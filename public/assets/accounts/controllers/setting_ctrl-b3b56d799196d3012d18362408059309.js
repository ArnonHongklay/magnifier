(function() {
  ohmpieng.controller('SettingCtrl', function($scope, account) {
    return console.log($scope.user = account.data.user);
  });

}).call(this);
