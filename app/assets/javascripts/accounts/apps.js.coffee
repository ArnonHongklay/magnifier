# = require_self
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
  $stateProvider
		.state 'account',
			url:					'/:account'
			templateUrl		'/accounts/ui'
			controller:		'HomeCtrl'
  .state 'account.nav',
    abstract:    true
    templateUrl: '/accounts/nav'
    controller:  'NavCtrl'

  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.run ->
  gettextCatalog.currentLanguage = 'th'

ohmpieng.controller 'AppCtrl', ($scope) ->
  $scope.$on '$stateChangeSuccess', (e, toState) ->
    $scope.stateName = toState.name

ohmpieng.controller 'NavCtrl', ($scope, $window) ->
  $scope.$on '$stateChangeStart',   $window.NProgress.start
  $scope.$on '$stateChangeSuccess', $window.NProgress.done
  $scope.$on '$stateChangeError',   $window.NProgress.done
