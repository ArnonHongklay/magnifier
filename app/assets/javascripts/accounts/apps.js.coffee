# = require_self
# = require_tree ./services
# = require_tree ./directives
# = require_tree ./controllers

window.ohmpieng = angular.module("ohmpieng", [
  # 'ui.router',
  'gettext',
  'angulartics',
  'angulartics.google.analytics',
  'nprogress-rails'
])


ohmpieng.config ($locationProvider) ->
  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.controller 'AppCtrl', ($scope, $state) ->
  console.log $state
  $scope.$on '$stateChangeStart',   NProgress.start
  $scope.$on '$stateChangeSuccess', NProgress.done
  $scope.$on '$stateChangeError',   NProgress.done

  $scope.$on '$stateChangeSuccess', (e, toState) ->
    $scope.stateName = toState.name


ohmpieng.controller 'AccountsCtrl', ($scope) ->
  console.log "AccountsCtrl"

ohmpieng.controller 'AuthCtrl', ($scope) ->
  console.log "AuthCtrl"
