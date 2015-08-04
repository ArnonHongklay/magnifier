ohmpieng.controller 'DashboardCtrl', ($scope, $state, $stateParams, account, servers) ->
  $scope.account        = account.data
  $scope.servers        = servers.data.servers
  $scope.mem            = servers.data.mem
  $scope.mem_free       = servers.data.mem_free
  $scope.mem_available  = servers.data.mem_available
  $scope.io             = servers.data.io

  $state.go("account.setting") if $scope.servers.length == 0

  $scope.currentIndex = 0
  $scope.selected = (index) ->
    console.log index
    $scope.currentIndex = index

  $scope.arps       = $scope.servers[$scope.currentIndex].arps
  $scope.bandwidths = $scope.servers[$scope.currentIndex].bandwidths
  $scope.cpus       = $scope.servers[$scope.currentIndex].cpus
  $scope.disks      = $scope.servers[$scope.currentIndex].disks
  $scope.ios        = $scope.servers[$scope.currentIndex].ios
  $scope.load_avgs  = $scope.servers[$scope.currentIndex].load_avgs
  $scope.memories   = $scope.servers[$scope.currentIndex].memories

  $scope.disk = {
    data: { text: "Disk", value: 50 }
    max: 30
  }

  $scope.mem = {
    chart: { title: "Box Office Earnings in First Two Weeks of Opening", subtitle: "in millions of dollars (USD)"}
    column_vertical:   { type: "string", text: "Memory" }
    column_horizontal: { type: "number", text: "mem_free (MB)"}
    column_horizontal2: { type: "number", text: "mem_available (MB)"}
    data: $scope.mem
  }

  $scope.memfree = {
    chart: { title: "Box Office Earnings in First Two Weeks of Opening", subtitle: "in millions of dollars (USD)"}
    column_vertical:   { type: "string", text: "Memory" }
    column_horizontal: { type: "number", text: "mem_free (MB)"}
    data: $scope.mem_free
  }

  $scope.memavailable = {
    chart: { title: "Box Office Earnings in First Two Weeks of Opening", subtitle: "in millions of dollars (USD)"}
    column_vertical:   { type: "string", text: "Memory" }
    column_horizontal: { type: "number", text: "mem_available (MB)"}
    data: $scope.mem_available
  }


  $scope.io = {
    chart: { title: "Box Office Earnings in First Two Weeks of Opening", subtitle: "in millions of dollars (USD)"}
    column_vertical:   { type: "number", text: "Memory" }
    column_horizontal: { type: "number", text: "reads (MB)"}
    column_horizontal2: { type: "number", text: "writes (MB)"}
    data: $scope.io
  }
