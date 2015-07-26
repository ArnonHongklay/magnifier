ohmpieng.directive 'monitor', ->
  template: '<div></div>'
  scope: chart: '='
  restrict: 'E'
  replace: true
  link: (scope, element) ->
    # lineChart = new google.visualization.LineChart(element[0])
    #
    # draw = (chart) ->
    #   data = chart.data
    #   table = new google.visualization.DataTable
    #   table.addColumn 'datetime'
    #   table.addColumn 'number'
    #   table.addRows data.length
    #   view = new google.visualization.DataView(table)
    #   i = 0
    #   while i < data.length
    #     item = data[i]
    #     table.setCell i, 0, new Date(item.timestamp)
    #     value = parseFloat(item.value)
    #     table.setCell i, 1, value
    #     i++
    #   last = data[data.length - 1]
    #   max = new Date(last.timestamp)
    #   min = new Date(last.timestamp - chart.max * 1000)
    #   chartOptions =
    #     legend: 'none'
    #     vAxis:
    #       minValue: 0
    #       maxValue: 100
    #     hAxis: viewWindow:
    #       min: min
    #       max: max
    #   lineChart.draw view, chartOptions
    #
    # scope.$watch 'chart', (chart) ->
    #   if chart and chart.data and chart.max
    #     draw chart

    data = new google.visualization.DataTable()
    data.addColumn('number', 'Internet')
    data.addColumn('number', 'Internet')

    data.addRows([
      [1,  37.8],
      [2,  30.9],
      [3,  25.4],
      [4,  11.7],
      [5,  11.9],
      [6,   8.8],
      [7,   7.6],
      [8,  12.3],
      [9,  16.9],
      [10, 12.8],
      [11,  5.3],
      [12,  6.6],
      [13,  4.8],
      [14,  4.2]
    ])

    options =
    chart:
      title: 'Box Office Earnings in First Two Weeks of Opening'
      subtitle: 'in millions of dollars (USD)'
    width: '90%'
    height: 300

    chart = new google.charts.Line(element[0])
    chart.draw data, options

    #   console.log "hello"
    #
    # scope.$watch 'chart', (chart) ->
    #   if chart and chart.data and chart.max
    #     draw chart
