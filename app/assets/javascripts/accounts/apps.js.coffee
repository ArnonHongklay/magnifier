# = require_self


angular.module("ohmpieng", [
  'ui.router',
  'gettext',
  'angulartics',
  'angulartics.google.analytics',
  'nprogress-rails'
]).config ($stateProvider, $urlRouterProvider) ->
  # $urlRouterProvider.otherwise('/')

  $stateProvider
    .state      'state1',
      url:      '/state1',
      templateUrl: 'template/state1.html'
    .state      'state1.list',
      url:      '/list'
      template: "xxxxxxx",
      # controller: function($scope) {
      #   $scope.items = ["A", "LIST", "OF", "Items"]
      # }
    .state      'state2',
      url:      '/state2',
      templateUrl: 'template/state2.html'

    .state      'state2.list',
      url:      '/list',
      template: 'list'


# ohmpieng.config ($analyticsProvider) ->
#   $analyticsProvider.firstPageview(false)

# ohmpieng.run (gettextCatalog) ->
#   gettextCatalog.currentLanguage = 'th'

# ohmpieng.controller 'AppCtrl', ($scope, $stateParams) ->
#   $scope.$on "$stateChangeStart", (event, toState, toParams, fromState, fromParams) ->
#     $scope.pageState.selectedCarId = toParams.id

#   $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
#     console.log "$stateChangeSuccess to " + toState.name + "- fired once the state transition is complete."

#   $scope.xxx = 1

#   # $scope.$on '$stateChangeSuccess', (e, toState) ->
#     # $scope.stateName = toState.name

# ohmpieng.controller 'AccountCtrl', ($scope, $stateParams, $http, $window, account, events) ->
#   console.log $stateParams
# ohmpieng.controller 'NavCtrl', ($scope, $window) ->
