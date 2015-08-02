ohmpieng.directive 'meter', ->
  template: '<div></div>'
  scope: chart: '='
  restrict: 'E'
  replace: true
  link: (scope, element) ->
    gauge = new google.visualization.Gauge(element[0])

    draw = (datas) ->
      view = new google.visualization.arrayToDataTable([
        ['Label', 'Value'],
        [datas.data.text, datas.data.value]
      ])

      chartOptions = {
        height: 150,
        redFrom: 90, redTo: 100,
        yellowFrom:75, yellowTo: 90,
        minorTicks: 5
      }

      gauge.draw view, chartOptions

    scope.$watch 'chart', (datas) ->
      if datas and datas.data and datas.max
        draw datas
