
ohmpieng.controller 'DropdownCtrl', ($scope, $log) ->
  $scope.item = [
    'The first choice!',
    'And another choice for you.',
    'but wait! A third!'
    ]
  $scope.status = isopen: false

  $scope.toggled = (open) ->
    $log.log 'Dropdown is now: ', open
    return

  $scope.toggleDropdown = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.status.isopen = !$scope.status.isopen
    return

  return
