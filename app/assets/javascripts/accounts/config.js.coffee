
ohmpieng.config ($stateProvider, $urlRouterProvider, $locationProvider) ->

  # $urlRouterProvider.when '/auth', 'auth/sign_in'
  # $stateProvider
  #   .state          'sign_in',
  #     url:          '/auth/sign_in',
  #     templateUrl:  '/accounts/sign_in'

  #   .state          'accounts',
  #     url:          '/',
  #     abstract:     true,
  #     template:     '<ui-view/>'



    # .state          'accounts.auth.signout',
    #   url:          '/auth/sign_out',
    #   templateUrl:  'accounts/sign_out'

  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.controller 'AccountsCtrl', ($scope) ->
  console.log "AccountsCtrl"

ohmpieng.controller 'AuthCtrl', ($scope) ->
  console.log "AuthCtrl"
