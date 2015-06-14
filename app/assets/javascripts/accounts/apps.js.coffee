# = require_self
# = require_tree ./services
# = require_tree ./directives
# = require_tree ./controllers

window.ohmpieng = angular.module("ohmpieng", [
  'ui.router',
  'ui.bootstrap',
  'ngAnimate',
  'ngCookies',
  'ngResource',
  'ngTable',
  'gettext',
  'angulartics',
  'templates',
  'nvd3ChartDirectives',
  'nprogress-rails'
])

ohmpieng.config ($stateProvider, $urlRouterProvider, $locationProvider, $analyticsProvider) ->

  $stateProvider
    .state 'profile',
      url: '/profile'
      templateUrl: 'accounts/profile'
      controller: 'ProfileCtrl'
      resolve:
        profile: ($http, $stateParams) ->
          $http.get "/profile.json"

    .state 'account',
      url: '/:userId'
      templateUrl: 'accounts/nav'
      controller: 'AccountCtrl'
      resolve:
        account: ($http, $stateParams) ->
          $http.get "/#{$stateParams.userId}.json"

    .state 'account.index',
      url: '/index'
      templateUrl: 'accounts/index'
      controller: 'IndexCtrl'

    .state 'account.dashboard',
      url: '/dashboard'
      templateUrl: 'accounts/dashboard'
      controller: 'DashboardCtrl'

    .state 'account.report',
      url: '/report'
      templateUrl: 'accounts/report'
      controller: 'ReportCtrl'

    .state 'account.setting',
      url: '/setting'
      templateUrl: 'accounts/setting'
      controller: 'SettingCtrl'

  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.controller 'AppCtrl', ($scope, $rootScope) ->
  $scope.$on '$stateChangeStart',   NProgress.start
  $scope.$on '$stateChangeSuccess', NProgress.done
  $scope.$on '$stateChangeError',   NProgress.done

  $scope.$on '$stateChangeSuccess', (e, toState) ->
    $scope.stateName = toState.name
