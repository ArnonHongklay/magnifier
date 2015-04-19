# = require_self
# = require_tree ./services
# = require_tree ./directives
# = require_tree ./controllers

window.ohmpieng = angular.module("ohmpieng", [
  'ui.router',
  'ui.bootstrap',
  'gettext',
  'ngAnimate',
  'ngCookies',
  'ngResource',
  'ngTable',
  'angulartics',
  'nvd3ChartDirectives',
  'ui.sortable',
  'ui.dashboard',
  # 'angulartics.google.analytics',
  'templates',
  'nprogress-rails'
])

ohmpieng.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
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

    .state 'account.setting.profile',
      url: '/profile'
      templateUrl: 'accounts/profile'
      controller: 'ProfileCtrl'

  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.controller 'AppCtrl', ($scope, $rootScope) ->
  $scope.$on '$stateChangeStart',   NProgress.start
  $scope.$on '$stateChangeSuccess', NProgress.done
  $scope.$on '$stateChangeError',   NProgress.done

  $scope.$on '$stateChangeSuccess', (e, toState) ->
    $scope.stateName = toState.name
