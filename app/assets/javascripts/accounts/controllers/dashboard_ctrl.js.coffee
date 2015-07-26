ohmpieng.controller 'DashboardCtrl', ($scope, $state, account, servers) ->
  $scope.account = account.data
  $scope.servers = servers.data.servers
  $state.go("account.setting") if $scope.servers.length == 0

  $scope.currentIndex = 0
  $scope.server = (index) ->
    $scope.currentIndex = index

  $scope.arps = $scope.servers[$scope.currentIndex].arps

  # task =
  #   name: 'Start taking advantage of WebSockets'
  #   completed: false
  # dispatcher = new WebSocketRails('127.0.0.1:31337/websocket')
  # dispatcher.trigger 'tasks.create', task
  #
  # dispatcher.bind 'tasks.create_success', (task) ->
  #   console.log 'successfully created ' + task.name

  $scope.disk = {
    data: { text: "Disk", value: 50 }
    max: 30
  }
