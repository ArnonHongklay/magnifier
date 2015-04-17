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
  'ui.router',
  'gettext',
  'ngAnimate',
  'angulartics',
  # 'angulartics.google.analytics',
  'templates',
  'nprogress-rails'
])

# ohmpieng.run ($rootScope, $state, $stateParams) ->
#   $rootScope.$state = $state
#   $rootScope.$stateParams = $stateParams
#   return

ohmpieng.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $stateProvider
    .state 'account',
      url: '/:userId'
      templateUrl: 'accounts/nav'
      controller: 'AccountCtrl'
      resolve:
        account: ($http, $stateParams) ->
          console.log $stateParams
          $http.get "/#{$stateParams}.json"

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

  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.controller 'AppCtrl', ($scope, $stateParams) ->

  $scope.$on '$stateChangeStart',   NProgress.start
  $scope.$on '$stateChangeSuccess', NProgress.done
  $scope.$on '$stateChangeError',   NProgress.done

  $scope.$on '$stateChangeSuccess', (e, toState) ->
    console.log toState
    $scope.stateName = toState.name
