ohmpieng.controller 'SettingCtrl', ($scope, $state, account, servers, $http) ->
  $scope.account = account.data
  $scope.servers = servers.data.server

  $scope.showEdit     = false
  $scope.ipaddress    = false

  $scope.phoneNumberPattern = do ->
  regexp = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
  { test: (value) ->
    if $scope.requireTel == false
      return true
    regexp.test value
  }

  # # create angular app
  # validationApp = angular.module('validationApp', [])
  # # create angular controller
  # validationApp.controller 'mainController', ($scope) ->
  #   # function to submit the form after all validation has occurred
  #
  #   $scope.submitForm = ->
  #     # check to make sure the form is completely valid
  #     if $scope.userForm.$valid
  #       alert 'our form is amazing'
  #     return
  #
  #   return
  #
  # # ---

  $scope.addServer = ->
    $scope.ipaddress  = true

  $scope.newipaddress = ->
    $scope.ipaddress  = true

  $scope.setting_update = ->
    $http.put "#{$scope.account.name}/setting_update",
      name: $scope.account.name
      email: $scope.account.email
    .success(result) ->
      $state.go($state.current, {}, {reload: true});

  $scope.setting_ip_create = (ip) ->
    $http.post "#{$scope.account.name}/setting_ip_create", ip: ip
    .success ->
      $state.go($state.current, {}, {reload: true});

  $scope.setting_ip_delete = (ip) ->
    $http
      url: "#{$scope.account.name}/setting_ip_delete"
      method: 'DELETE'
      data: ip: ip
      headers: 'Content-Type': 'application/json;charset=utf-8'
    .success ->
      $state.go($state.current, {}, {reload: true});
