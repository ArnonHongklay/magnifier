ohmpieng.directive 'diskmonitor', ->
  template: '<div></div>'
  scope: chart: '='
  restrict: 'E'
  replace: true
  link: (scope, element) ->

    chart = new google.visualization.PieChart(element[0])

    draw = (datas) ->
      data = google.visualization.arrayToDataTable(datas.data)

      options =
        title: datas.chart.title
      chart.draw data, options

    scope.$watch 'chart', (datas) ->
      if datas and datas.data
        draw datas
