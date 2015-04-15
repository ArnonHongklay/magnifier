# = require_self
# = require apps/angular/angular
# = require apps/angular/angular-resource
# = require apps/angular/angular-cookies
# = require apps/angular-strap/angular-strap
# = require ./angular-devise/index
# = require ./config
# = require_tree ./services
# = require_tree ./directives
# = require_tree ./controllers

window.ohmpieng = angular.module("ohmpieng", [
  'ui.router',
  'gettext',
  'angulartics',
  'angulartics.google.analytics',
  'nprogress-rails'
])

ohmpieng.controller 'AppCtrl', ($scope, $state) ->

  $scope.$on '$stateChangeStart',   NProgress.start
  $scope.$on '$stateChangeSuccess', NProgress.done
  $scope.$on '$stateChangeError',   NProgress.done

  $scope.$on '$stateChangeSuccess', (e, toState) ->
    $scope.stateName = toState.name

