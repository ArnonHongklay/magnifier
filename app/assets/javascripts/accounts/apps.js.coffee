# = require_self
# = require_tree ./services
# = require_tree ./directives
# = require_tree ./controllers

ohmpieng = angular.module("ohmpieng", [
  'ui.router',
  'gettext',
  'angulartics',
  'angulartics.google.analytics',
  'nprogress-rails'
])

ohmpieng.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'account',
      url:         '/:accountId'
      templateUrl: '/templates/hg/account'
      controller:  'AccountCtrl'
      resolve:
        account: ($http, $stateParams) ->
          $http.get "/#{$stateParams.accountId}.json"


ohmpieng.config ($analyticsProvider) ->
  $analyticsProvider.firstPageview(false)

ohmpieng.run (gettextCatalog) ->
  gettextCatalog.currentLanguage = 'th'

ohmpieng.controller 'AppCtrl', ($scope, $stateParams) ->
  $scope.$on "$stateChangeStart", (event, toState, toParams, fromState, fromParams) ->
    $scope.pageState.selectedCarId = toParams.id

  $scope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    console.log "$stateChangeSuccess to " + toState.name + "- fired once the state transition is complete."

  $scope.xxx = 1

  # $scope.$on '$stateChangeSuccess', (e, toState) ->
    # $scope.stateName = toState.name

ohmpieng.controller 'AccountCtrl', ($scope, $stateParams, $http, $window, account, events) ->
  console.log $stateParams
ohmpieng.controller 'NavCtrl', ($scope, $window) ->
