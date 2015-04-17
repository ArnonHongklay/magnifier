# = require_self
# = require_tree ./services
# = require_tree ./directives
# = require_tree ./controllers

$(document).ready ->

  # Enable Tips & Popovers
  $('[data-toggle=tooltip]').tooltip()
  $('[data-toggle=popover]').popover()

  # Eable Dropdowns
  $('.dropdown-toggle').dropdown()
  $('.dropdown.hover').hover (->
    $(this).find('.dropdown-menu').stop(true, true).fadeIn()
  ), ->
    $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut()


  $('#toggle').click ->
    $('#dock .launcher a').toggle()
    $('#dock li.launcher').each ->
      $(this).find('.dropdown-menu').css 'top', $(this).position().top + 33

  # Enable toolbar tooltips
  $('[data-toggle=toolbar-tooltip]').tooltip
    placement: 'bottom'

  # Enable knob inputs
  # $('.knob').knob()


window.ohmpieng = angular.module("ohmpieng", [
  'ngAnimate',
  'ui.router',
  'gettext',
  'angulartics',
  # 'angulartics.google.analytics',
  'templates',
  'nprogress-rails'
])

ohmpieng.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $stateProvider
    .state 'accounts',
      url: '/:user',
      templateUrl: 'accounts/index',
      controller: 'AccountCtrl'
      resolve:
        info: ($http, $stateParams) ->
          $http.get '/info.json'

    .state 'accounts.dashboard',
      url: '/:user/dashboard',
      templateUrl: 'accounts/dashboard',
      controller: 'DashboardCtrl'

    .state 'accounts.report',
      url: '/:user/report',
      templateUrl: 'accounts/report',
      controller: 'ReportCtrl'

    .state 'accounts.setting',
      url: '/:user/setting',
      templateUrl: 'accounts/setting',
      controller: 'SettingCtrl'

    .state 'accounts.setting.profile',
      url: '/:user/setting/profile',
      templateUrl: 'accounts/profile',
      controller: 'ProfileCtrl'

  $urlRouterProvider.otherwise('/')
  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.controller 'AppCtrl', ($scope) ->
  $scope.$on '$stateChangeStart',   NProgress.start
  $scope.$on '$stateChangeSuccess', NProgress.done
  $scope.$on '$stateChangeError',   NProgress.done

  $scope.$on '$stateChangeSuccess', (e, toState) ->
    $scope.stateName = toState.name

ohmpieng.controller 'AccountCtrl', ($scope, info) ->
  $scope.user = info.data.user
  $scope.things = ['Angular', 'Rails 4.1', 'UI Router', 'Together!!']

ohmpieng.controller 'DashboardCtrl', ($scope, info) ->
  $scope.user = info.data.user
ohmpieng.controller 'ReportCtrl', ($scope, info) ->
  $scope.user = info.data.user
ohmpieng.controller 'SettingCtrl', ($scope, info) ->
  $scope.user = info.data.user
ohmpieng.controller 'ProfileCtrl', ($scope, info) ->
  $scope.user = info.data.user

# ohmpieng.controller 'AuthCtrl', ($scope) ->
#   $scope.name = "auth"
#   console.log $scope.name

# ohmpieng.controller 'AccountsCtrl', ($scope) ->
#   console.log "AccountsCtrl"
