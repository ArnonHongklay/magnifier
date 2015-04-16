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
  # 'ui.router',
  'gettext',
  'angulartics',
  'angulartics.google.analytics',
  'nprogress-rails'
])


ohmpieng.config ($locationProvider) ->
  $locationProvider.html5Mode(true).hashPrefix('!')

ohmpieng.controller 'AppCtrl', ($scope) ->
#   # console.log $scope.name
#   # $scope.$on '$stateChangeStart',   NProgress.start
#   # $scope.$on '$stateChangeSuccess', NProgress.done
#   # $scope.$on '$stateChangeError',   NProgress.done

#   # $scope.$on '$stateChangeSuccess', (e, toState) ->
#     $scope.stateName = toState.name

ohmpieng.controller 'AuthCtrl', ($scope) ->
  $scope.name = "auth"
  console.log $scope.name

# ohmpieng.controller 'AccountsCtrl', ($scope) ->
#   console.log "AccountsCtrl"
