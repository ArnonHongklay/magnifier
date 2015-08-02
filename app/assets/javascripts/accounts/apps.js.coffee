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
  'nprogress-rails'
])

ohmpieng.config ($stateProvider, $urlRouterProvider, $locationProvider, $analyticsProvider, $httpProvider) ->
  $httpProvider.defaults.useXDomain = true
  delete $httpProvider.defaults.headers.common['X-Requested-With']

  $stateProvider
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
      resolve:
        servers: ($http, $stateParams) ->
          $http.get "/#{$stateParams.userId}/index.json"

    .state 'account.dashboard',
      url: '/dashboard'
      templateUrl: 'accounts/dashboard'
      controller: 'DashboardCtrl'
      resolve:
        servers: ($http, $stateParams) ->
          $http.get "/#{$stateParams.userId}/dashboard.json"
        events: ($window, $stateParams) ->
          new $window.EventSource("/#{$stateParams.userId}/dashboard/events.json")

    .state 'account.report',
      url: '/report'
      templateUrl: 'accounts/report'
      controller: 'ReportCtrl'
      resolve:
        servers: ($http, $stateParams) ->
          $http.get "/#{$stateParams.userId}/dashboard.json"

    .state 'account.setting',
      url: '/setting'
      templateUrl: 'accounts/setting'
      controller: 'SettingCtrl'
      resolve:
        servers: ($http, $stateParams) ->
          $http.get "/#{$stateParams.userId}/setting.json"

  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.controller 'AppCtrl', ($scope, $rootScope) ->
  $scope.$on '$stateChangeStart',   NProgress.start
  $scope.$on '$stateChangeSuccess', NProgress.done
  $scope.$on '$stateChangeError',   NProgress.done

  $scope.$on '$stateChangeSuccess', (e, toState) ->
    $scope.stateName = toState.name
