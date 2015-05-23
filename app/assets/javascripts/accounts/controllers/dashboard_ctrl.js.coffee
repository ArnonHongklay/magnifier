
ohmpieng.controller 'DashboardCtrl', ($scope, account) ->
  $scope.user = account.data.user

  # $scope.gaugeValue = 0
  #items = []
  #items.push({timestamp: 20, value: 82})
  items = [{timestamp: 20, value: 82}, {timestamp: 20
  , value: 30}]
  $scope.chart = {
    data: items
    max: 30
  }
  # items = []
  # webSocket.subscribe (item) ->
  #   items.push item
  #   if items.length > 40
  #     items.shift()
  #   $scope.chart =
  #     data: items
  #     max: 30
  #   $scope.gaugeValue = item.value
  #   $scope.$apply()
  #   return
  # return

  $scope.$on 'tooltipShow.directive', (angularEvent, event) ->
    angularEvent.targetScope.$parent.event = event
    angularEvent.targetScope.$parent.$digest()
    return

  # http://angularjs-nvd3-directives.github.io/angularjs-nvd3-directives/cumulative.line.chart.html
  $scope.exampleData = [{
    'key': 'CPU'
    'color': '#2ABB9B'
    'values': [
      [ 0, 1233 ]
      [ 10, 2312 ]
      [ 20, 3123 ]
      [ 30, 123 ]
      [ 40, 12312 ]
      [ 50, 1231 ]
    ]
  }]

  $scope.isAreaExampleData = [{
    'key': 'x1'
    'color': '#2ABB9B'
    'values': [
      [ 0, 1233 ]
      [ 10, 2312 ]
      [ 20, 3123 ]
      [ 30, 123 ]
      [ 40, 12312 ]
      [ 50, 1231 ]
    ]
    },{
    'key': 'x2'
    'color': '#2574A9'
    'values': [
      [ 0, 123 ]
      [ 10, 3123 ]
      [ 20, 2345 ]
      [ 30, 456 ]
      [ 40, 456 ]
      [ 50, 765 ]
    ]
    },{
    'key': 'x3'
    'color': '#F62459'
    'values': [
      [ 0, 12 ]
      [ 10, 213 ]
      [ 20, 313 ]
      [ 30, 123 ]
      [ 40, 12 ]
      [ 50, 1231 ]
    ]
    }]
