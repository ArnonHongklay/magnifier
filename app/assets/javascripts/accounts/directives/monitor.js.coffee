ohmpieng.directive 'monitor', ->
  template: '<div></div>'
  scope: chart: '='
  restrict: 'E'
  replace: true
  link: (scope, element) ->
    lineChart = new google.visualization.LineChart(element[0])

    draw = (chart) ->
      data = chart.data
      table = new google.visualization.DataTable
      table.addColumn 'datetime'
      table.addColumn 'number'
      table.addRows data.length
      view = new google.visualization.DataView(table)
      i = 0
      while i < data.length
        item = data[i]
        table.setCell i, 0, new Date(item.timestamp)
        value = parseFloat(item.value)
        table.setCell i, 1, value
        i++
      last = data[data.length - 1]
      max = new Date(last.timestamp)
      min = new Date(last.timestamp - chart.max * 1000)
      chartOptions =
        legend: 'none'
        vAxis:
          minValue: 0
          maxValue: 100
        hAxis: viewWindow:
          min: min
          max: max
      lineChart.draw view, chartOptions

    scope.$watch 'chart', (chart) ->
      if chart and chart.data and chart.max
        draw chart
