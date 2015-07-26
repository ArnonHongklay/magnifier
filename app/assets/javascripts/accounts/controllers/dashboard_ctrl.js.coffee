ohmpieng.controller 'DashboardCtrl', ($scope, $state, account, servers) ->
  $scope.account = account.data
  $scope.servers = servers.data.servers
  $state.go("account.setting") if $scope.servers.length == 0

  $scope.currentIndex = 0
  $scope.server = (index) ->
    $scope.currentIndex = index

  $scope.arps = $scope.servers[$scope.currentIndex].arps

  task =
    name: 'Start taking advantage of WebSockets'
    completed: false
  dispatcher = new WebSocketRails('127.0.0.1:31337/websocket')
  # dispatcher.trigger 'tasks.create', task

  dispatcher.bind 'tasks.create_success', (task) ->
    console.log 'successfully created ' + task.name
    return

  # $scope.gaugeValue = 0
  # items = []
  # items.push({timestamp: 20, value: 82})
  # $scope.chart = {
  #   data: items
  #   max: 30
  # }
  #
  # $scope.ram = {
  #   data: { text: "Ram", value: 80 }
  #   max: 30
  # }
  # $scope.cpu = {
  #   data: { text: "CPU", value: 33 }
  #   max: 30
  # }
  # $scope.disk = {
  #   data: { text: "Disk", value: 50 }
  #   max: 30
  # }


  # $scope.$on 'tooltipShow.directive', (angularEvent, event) ->
  #   angularEvent.targetScope.$parent.event = event
  #   angularEvent.targetScope.$parent.$digest()
  #   return
