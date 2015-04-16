# = require_self
# = require ./config
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


ohmpieng.config ($stateProvider, $urlRouterProvider, $locationProvider) ->

  # $urlRouterProvider.when '/auth', 'auth/sign_in'
  $stateProvider
    .state          'auth',
      url:          '/auth/sign_in',
      templateUrl:  '/accounts/auth'
      controller:   'AuthCtrl'

    .state          'accounts',
      url:          '/',
      abstract:     true,
      template:     '<ui-view/>'



    # .state          'accounts.auth.signout',
    #   url:          '/auth/sign_out',
    #   templateUrl:  'accounts/sign_out'

  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.controller 'AccountsCtrl', ($scope) ->
  console.log "AccountsCtrl"

ohmpieng.controller 'AuthCtrl', ($scope) ->
  console.log "AuthCtrl"


ohmpieng.controller 'AppCtrl', ($scope, $state) ->
  $scope.$on '$stateChangeStart',   NProgress.start
  $scope.$on '$stateChangeSuccess', NProgress.done
  $scope.$on '$stateChangeError',   NProgress.done

  $scope.$on '$stateChangeSuccess', (e, toState) ->
    $scope.stateName = toState.name

