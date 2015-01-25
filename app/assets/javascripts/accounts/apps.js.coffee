# = require_self
# = require_tree ./services
# = require_tree ./directives
# = require_tree ./controllers

window.ohmpieng = angular.module 'ohmpieng', [
  'ui.router',
  'gettext',
  'angulartics',
  'angulartics.google.analytics',
  'nprogress-rails'
]

ohmpieng.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  console.log $stateProvider.state

ohmpieng.config ($analyticsProvider) ->
  $analyticsProvider.firstPageview(false)

ohmpieng.run (gettextCatalog) ->
  gettextCatalog.currentLanguage = 'th'

ohmpieng.controller 'AppCtrl', ($scope) ->
  $scope.$on '$stateChangeSuccess', (e, toState) ->
    $scope.stateName = toState.name

ohmpieng.controller 'NavCtrl', ($scope, $window) ->
  $scope.$on '$stateChangeStart',   $window.NProgress.start
  $scope.$on '$stateChangeSuccess', $window.NProgress.done
  $scope.$on '$stateChangeError',   $window.NProgress.done
