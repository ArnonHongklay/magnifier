ohmpieng.controller 'DashboardCtrl', ($scope, account, servers) ->
  $scope.user = account.data.user

  dispatcher = new WebSocketRails("127.0.0.1:31337/websocket")

  dispatcher.on_open = (data) ->
    console.log data

  dispatcher.bind 'tasks.create_success', (task) ->
    console.log 'successfully created ' + task.name
    return

  # $scope.gaugeValue = 0
  items = []
  items.push({timestamp: 20, value: 82})
  $scope.chart = {
    data: items
    max: 30
  }

  $scope.ram = {
    data: { text: "Ram", value: 80 }
    max: 30
  }
  $scope.cpu = {
    data: { text: "CPU", value: 33 }
    max: 30
  }
  $scope.disk = {
    data: { text: "Disk", value: 50 }
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

  $('#seelectsvdh1').click ->
    $(this).css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seelectsvdh2").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh3").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh4").css
      'background-color': '#fff'
      'color': '#444'
    return

  $('#seelectsvdh2').click ->
    $(this).css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seelectsvdh1").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh3").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh4").css
      'background-color': '#fff'
      'color': '#444'
    return

  $('#seelectsvdh3').click ->
    $(this).css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seelectsvdh2").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh1").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh4").css
      'background-color': '#fff'
      'color': '#444'
    return

  $('#seelectsvdh4').click ->
    $(this).css
      'background-color': '#47c9af'
      'color': '#fff'
    $("#seelectsvdh1").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh3").css
      'background-color': '#fff'
      'color': '#444'
    $("#seelectsvdh2").css
      'background-color': '#fff'
      'color': '#444'
    return


  $('#sv1').click ->
    $(this).addClass 'active'
    $("#sv2").removeClass 'active'
    $("#sv3").removeClass 'active'
    $("#sv4").removeClass 'active'
    return

  $('#sv2').click ->
    $(this).addClass 'active'
    $('#sv1').removeClass 'active'
    $('#sv3').removeClass 'active'
    $('#sv4').removeClass 'active'
    return

  $('#sv3').click ->
    $('#sv3').addClass 'active'
    $("#sv2").removeClass 'active'
    $("#sv1").removeClass 'active'
    $("#sv4").removeClass 'active'
    return

  $('#sv4').click ->
    $('#sv4').addClass 'active'
    $("#sv2").removeClass 'active'
    $("#sv3").removeClass 'active'
    $("#sv1").removeClass 'active'
    return
