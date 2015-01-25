ohmpieng.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
	$stateProvider
		.state 'home',
			url:					'/:accountId'
			templateUrl		'/accounts/index'
			controller:		'HomeCtrl'
