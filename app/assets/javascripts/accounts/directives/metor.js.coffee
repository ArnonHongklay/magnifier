ohmpieng.directive 'metor', ->
  template: '<div></div>'
  scope: chart: '='
  restrict: 'E'
  replace: true
  link: (scope, element) ->
    gauge = new google.visualization.Gauge(element[0])

    draw = (chart) ->

      view = new google.visualization.arrayToDataTable([
          ['Label', 'Value'],
          ['Memory', 80],
          ['CPU', 55],
          ['Network', 68]
          ['Disk', 80]
        ])

      chartOptions = {
        height: 150,
        redFrom: 90, redTo: 100,
        yellowFrom:75, yellowTo: 90,
        minorTicks: 5
      }

      # setInterval (->
      #   data.setValue 0, 1, 40 + Math.round(60 * Math.random())
      #   chart.draw data, options
      #   return
      # ), 13000
      # setInterval (->
      #   data.setValue 1, 1, 40 + Math.round(60 * Math.random())
      #   chart.draw data, options
      #   return
      # ), 5000
      # setInterval (->
      #   data.setValue 2, 1, 60 + Math.round(20 * Math.random())
      #   chart.draw data, options
      #   return
      # ), 26000

      gauge.draw view, chartOptions

    scope.$watch 'chart', (chart) ->
      if chart and chart.data and chart.max
        draw chart

